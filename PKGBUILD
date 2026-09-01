# Maintainer: Nichokas <https://github.com/Nichokas>
# Co-maintained via https://github.com/Nichokas/grokbot-linux-port
pkgname=grokbot-linux-port
pkgver=0.32.0
pkgrel=2
pkgdesc="Grok Bot desktop — wine-less Linux port (fuses win32 NSIS payload with Electron 42.1.0)"
arch=('x86_64')
url="https://github.com/Nichokas/grokbot-linux-port"
license=('custom')
depends=(
  'alsa-lib' 'gtk3' 'nss' 'libxss' 'libxtst' 'libxrandr'
  'libxdamage' 'libxcomposite' 'libxfixes' 'libdrm' 'mesa'
  'libxkbcommon' 'at-spi2-core' 'cairo' 'pango'
  'expat' 'hicolor-icon-theme'
)
makedepends=('p7zip' 'curl' 'unzip' 'nodejs' 'npm' 'python' 'git')
optdepends=('libnotify: desktop notifications')
provides=('grok-bot' 'grokbot')
conflicts=('grokbot-linux-port-bin' 'grok-bot')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Nichokas/grokbot-linux-port/archive/v${pkgver}.tar.gz")
sha256sums=('b796cf7b94f5679680475f391633bcf675595b4875c22157991fc3fe8b0c349d')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  rm -rf dist
  # Prevent stale extraction from previous makepkg run shadowing the new build
  rm -rf "${srcdir}/Grok_Bot_${pkgver}_linux_x64"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  # port.sh is intentionally best-effort for @electron/rebuild (still emits
  # the tarball on failure for CI/local debugging). For AUR packaging the
  # native modules must be Linux-rebuilt — fail the build if any .node
  # remains Windows-built. Allow opt-out via GROKBOT_ALLOW_BROKEN_NATIVE=1.
  bash scripts/port.sh "${pkgver}"
  if [[ "${GROKBOT_ALLOW_BROKEN_NATIVE:-}" != "1" ]]; then
    local tarball="dist/Grok_Bot_${pkgver}_linux_x64.tar.gz"
    if [[ -f "${tarball}" ]]; then
      # Heuristic: warn if the staged tree still contains win32 .node markers
      # (port.sh logs the rebuild outcome; this catches the silent-still-tarball case)
      local probe_dir
      probe_dir="$(mktemp -d)"
      tar -xzf "${tarball}" -C "${probe_dir}" 2>/dev/null || true
      # Fail if any Linux-loadable .node is still a Windows PE. Exemptions
      # match port.sh: win32 prebuild dirs and napi-rs *.win32-*.node files
      # are dead code on Linux (loaders filter them by platform).
      local mz_live
      mz_live="$(find "${probe_dir}" -name '*.node' -type f -exec sh -c \
        'head -c 2 "$1" | grep -q MZ && printf "%s\n" "$1"' _ {} \; 2>/dev/null \
        | grep -v -e '/prebuilds/win32-' -e '\.win32-[^/]*\.node$' || true)"
      if [[ -n "${mz_live}" ]]; then
        echo "error: loadable native .node modules appear to be win32 binaries — @electron/rebuild likely failed:" >&2
        printf '%s\n' "${mz_live}" | head -n 10 >&2
        echo "hint: re-run with GROKBOT_ALLOW_BROKEN_NATIVE=1 makepkg -si to bypass, or fix the rebuild toolchain" >&2
        rm -rf "${probe_dir}"
        exit 1
      fi
      rm -rf "${probe_dir}"
    fi
  fi
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Always prefer the just-built tarball; never reuse a stale sibling dir
  local tarball="dist/Grok_Bot_${pkgver}_linux_x64.tar.gz"
  if [[ ! -f "${tarball}" ]]; then
    echo "error: expected tarball ${tarball} not found after build" >&2
    exit 1
  fi
  rm -rf "${srcdir}/Grok_Bot_${pkgver}_linux_x64"
  tar -xzf "${tarball}" -C "${srcdir}"
  local staged="${srcdir}/Grok_Bot_${pkgver}_linux_x64"
  if [[ ! -d "${staged}" ]]; then
    staged="$(find "${srcdir}" -maxdepth 1 -type d -name "Grok_Bot_${pkgver}_linux_x64" -print -quit 2>/dev/null || true)"
  fi
  if [[ -z "${staged}" || ! -d "${staged}" ]]; then
    echo "error: staged app dir not found after build" >&2
    exit 1
  fi

  # Tarballs produced by older port.sh kept NSIS restrictive modes
  # (drwx------ on app.asar.unpacked). cp -a preserves them; normalise so the
  # installed tree is readable by the invoking user, not only root.
  chmod -R u+rwX,go+rX,go-w "${staged}"

  install -dm755 "${pkgdir}/opt/${pkgname}" "${pkgdir}/usr/bin" \
                 "${pkgdir}/usr/share/applications" \
                 "${pkgdir}/usr/share/icons/hicolor/256x256/apps" \
                 "${pkgdir}/usr/share/licenses/${pkgname}"

  cp -a "${staged}/." "${pkgdir}/opt/${pkgname}/"
  chmod +x "${pkgdir}/opt/${pkgname}/grok-bot"

  # Symlink for PATH
  ln -s "/opt/${pkgname}/grok-bot" "${pkgdir}/usr/bin/grok-bot"
  ln -s "/opt/${pkgname}/grok-bot" "${pkgdir}/usr/bin/grokbot"

  # Desktop entry — use --no-sandbox only as fallback; the wrapper prefers sandbox when available
  cat > "${pkgdir}/usr/share/applications/grok-bot.desktop" <<DESKTOP
[Desktop Entry]
Name=Grok Bot
GenericName=Grok Bot
Comment=Grok Bot desktop agent (Linux port)
Exec=/opt/${pkgname}/grok-bot %U
Icon=grok-bot
Type=Application
Categories=Utility;Development;
StartupWMClass=grok-bot
MimeType=x-scheme-handler/grokbot;
Terminal=false
DESKTOP

  # Icon — app-icon-*.png lives inside packed app.asar, not
  # app.asar.unpacked. Prefer a loose grok-bot.png (port.sh plants one at
  # the tarball root after this change), then extract from asar so a
  # tagged port.sh that does not yet plant the PNG still ships an icon.
  local icon=""
  local icon_dest="${pkgdir}/usr/share/icons/hicolor/256x256/apps/grok-bot.png"
  for cand in \
    "${staged}/grok-bot.png" \
    "${staged}/resources/app.asar.unpacked/dist/renderer/assets/app-icon-"*.png \
    "${staged}/resources/app.asar.unpacked/"*.png \
  ; do
    [[ -f "${cand}" ]] && { icon="${cand}"; break; }
  done
  if [[ -z "${icon}" ]]; then
    icon="$(find "${staged}" -name 'app-icon*.png' -print -quit 2>/dev/null || true)"
  fi
  if [[ -n "${icon}" && -f "${icon}" ]]; then
    install -Dm644 "${icon}" "${icon_dest}"
  elif [[ -f "${staged}/resources/app.asar" ]]; then
    local extracted="${srcdir}/grok-bot.png"
    if python3 - "${staged}/resources/app.asar" "${extracted}" <<'PY'
import json, pathlib, struct, sys

def walk(node, prefix=""):
    for name, meta in node.get("files", {}).items():
        path = f"{prefix}/{name}" if prefix else name
        if "files" in meta:
            yield from walk(meta, path)
        else:
            yield path, meta

# Best-effort extraction: callers warn and carry on, so keep failures as
# one-line errors instead of tracebacks.
try:
    asar, dest = sys.argv[1], sys.argv[2]
    with open(asar, "rb") as fh:
        if struct.unpack("<I", fh.read(4))[0] != 4:
            raise SystemExit("bad asar pickle")
        header_size = struct.unpack("<I", fh.read(4))[0]
        header_pickle = fh.read(header_size)
        str_len = struct.unpack_from("<I", header_pickle, 4)[0]
        header = json.loads(header_pickle[8:8 + str_len])
        hits = [
            (p, m) for p, m in walk(header)
            if p.rsplit("/", 1)[-1].startswith("app-icon") and p.endswith(".png") and "offset" in m
        ]
        if not hits:
            raise SystemExit("no app-icon*.png in asar")
        path, meta = max(hits, key=lambda item: int(item[1]["size"]))
        fh.seek(8 + header_size + int(meta["offset"]))
        blob = fh.read(int(meta["size"]))
        if len(blob) != int(meta["size"]):
            raise SystemExit(f"error: {path} is truncated")
        if blob[:8] != b"\x89PNG\r\n\x1a\n":
            raise SystemExit("not a PNG")
        pathlib.Path(dest).write_bytes(blob)
except Exception as exc:
    raise SystemExit(f"error: {exc}")
PY
    then
      install -Dm644 "${extracted}" "${icon_dest}"
    else
      echo "warn: could not extract grok-bot icon from app.asar" >&2
    fi
  fi

  # License placeholder — upstream EULA is inside app.asar; point there
  cat > "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" <<LICENSE
Grok Bot is proprietary software. This AUR package redistributes no upstream
binary itself in the -bin variant it fetches the official Windows distribution
at build time (non-bin) or the prebuilt Linux tarball produced by
https://github.com/Nichokas/grokbot-linux-port. See upstream terms at
https://grok.com and inside resources/app.asar.
LICENSE

  # chrome-sandbox: makepkg strips setuid by default. Keep 4755 and instruct
  # namcap override via !strip where needed. Use install -m4755 explicitly.
  if [[ -f "${pkgdir}/opt/${pkgname}/chrome-sandbox" ]]; then
    chmod 4755 "${pkgdir}/opt/${pkgname}/chrome-sandbox"
  fi
}
