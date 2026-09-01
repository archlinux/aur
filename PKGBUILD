# Maintainer: Nichokas <https://github.com/Nichokas>
# Binary variant — downloads the prebuilt Linux tarball from GitHub Releases.
pkgname=grokbot-linux-port-bin
pkgver=0.32.0
pkgrel=3
pkgdesc="Grok Bot desktop — wine-less Linux port (prebuilt tarball from GitHub Releases)"
arch=('x86_64' 'aarch64')
url="https://github.com/Nichokas/grokbot-linux-port"
license=('custom')
depends=(
  'alsa-lib' 'gtk3' 'nss' 'libxss' 'libxtst' 'libxrandr'
  'libxdamage' 'libxcomposite' 'libxfixes' 'libdrm' 'mesa'
  'libxkbcommon' 'at-spi2-core' 'cairo' 'pango'
  'expat' 'hicolor-icon-theme'
)
makedepends=('python')
optdepends=('libnotify: desktop notifications')
provides=('grokbot-linux-port' 'grok-bot' 'grokbot')
conflicts=('grokbot-linux-port' 'grok-bot')
source_x86_64=("Grok_Bot_${pkgver}_linux_x64.tar.gz::https://github.com/Nichokas/grokbot-linux-port/releases/download/v${pkgver}/Grok_Bot_${pkgver}_linux_x64.tar.gz")
source_aarch64=("Grok_Bot_${pkgver}_linux_arm64.tar.gz::https://github.com/Nichokas/grokbot-linux-port/releases/download/v${pkgver}/Grok_Bot_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('dbd2e455d0769441d9f536c68ae048cfc426869aa9c37186a911049bdec9e28b')
sha256sums_aarch64=('1cd5e834ce6a4b57da1909f945c7da45006821bf93e3c9b673189423db715b65')

package() {
  # Per-arch source arrays land the matching tarball under ${srcdir}; pick
  # the staged dir for THIS CARCH. A leftover sibling-arch dir (a previous
  # makepkg run in the same srcdir) must never win over the current build.
  local arch_dir
  case "${CARCH}" in
    x86_64)  arch_dir="linux_x64" ;;
    aarch64) arch_dir="linux_arm64" ;;
    *) echo "error: unsupported CARCH '${CARCH}'" >&2; exit 1 ;;
  esac
  local staged="${srcdir}/Grok_Bot_${pkgver}_${arch_dir}"
  if [[ ! -d "${staged}" ]]; then
    echo "error: no staged Grok_Bot_${pkgver}_${arch_dir} dir found under srcdir" >&2
    ls -R "${srcdir}" | head -n 100 >&2
    exit 1
  fi

  # Upstream tarball ships NSIS-derived restrictive modes (drwx------ on
  # app.asar.unpacked); cp -a would preserve them and pacman would then
  # install root-only directories. Normalise before copying.
  chmod -R u+rwX,go+rX,go-w "${staged}"

  # Refuse to package a tarball whose loadable native modules are still
  # Windows PE binaries — they dlopen-fail at runtime with "invalid ELF
  # header". Dead-on-Linux PE leftovers (win32 prebuild dirs, napi-rs
  # *.win32-*.node filenames) are tolerated: Linux loaders never resolve them.
  if [[ "${GROKBOT_ALLOW_BROKEN_NATIVE:-}" != "1" ]]; then
    local mz_live
    mz_live="$(find "${staged}" -name '*.node' -type f -exec sh -c \
      'head -c 2 "$1" | grep -q MZ && printf "%s\n" "$1"' _ {} \; 2>/dev/null \
      | grep -v -e '/prebuilds/win32-' -e '\.win32-[^/]*\.node$' || true)"
    if [[ -n "${mz_live}" ]]; then
      echo "error: loadable .node files in the tarball are win32 (MZ header) — upstream rebuild failed:" >&2
      printf '%s\n' "${mz_live}" | head -n 10 >&2
      echo "hint:  install grokbot-linux-port (builds from source) instead, or rebuild upstream via scripts/port.sh" >&2
      echo "hint:  GROKBOT_ALLOW_BROKEN_NATIVE=1 makepkg -si forces a known-broken install (debug only)" >&2
      exit 1
    fi
  fi

  install -dm755 "${pkgdir}/opt/${pkgname}" "${pkgdir}/usr/bin" \
                 "${pkgdir}/usr/share/applications" \
                 "${pkgdir}/usr/share/icons/hicolor/256x256/apps" \
                 "${pkgdir}/usr/share/licenses/${pkgname}"

  cp -a "${staged}/." "${pkgdir}/opt/${pkgname}/"
  # Some tarballs keep electron as 'grok-bot' already; normalize
  if [[ ! -x "${pkgdir}/opt/${pkgname}/grok-bot" && -x "${pkgdir}/opt/${pkgname}/electron" ]]; then
    mv "${pkgdir}/opt/${pkgname}/electron" "${pkgdir}/opt/${pkgname}/grok-bot"
  fi
  chmod +x "${pkgdir}/opt/${pkgname}/grok-bot"

  ln -sf "/opt/${pkgname}/grok-bot" "${pkgdir}/usr/bin/grok-bot"
  ln -sf "/opt/${pkgname}/grok-bot" "${pkgdir}/usr/bin/grokbot"

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
  # app.asar.unpacked, so a filesystem hunt of current tarballs finds
  # nothing. Prefer a loose grok-bot.png (future port.sh plants one at
  # the tarball root), then extract from asar so 0.24.0 still ships an icon.
  local icon=""
  local icon_dest="${pkgdir}/usr/share/icons/hicolor/256x256/apps/grok-bot.png"
  for cand in \
    "${staged}/grok-bot.png" \
    "${staged}/resources/app.asar.unpacked/dist/renderer/assets/app-icon-"*.png \
  ; do [[ -f "${cand}" ]] && { icon="${cand}"; break; } ; done
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

  cat > "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" <<LICENSE
Grok Bot is proprietary software. This package fetches the prebuilt Linux
tarball published at https://github.com/Nichokas/grokbot-linux-port/releases.
See upstream terms at https://grok.com and inside resources/app.asar.
LICENSE

  if [[ -f "${pkgdir}/opt/${pkgname}/chrome-sandbox" ]]; then
    chmod 4755 "${pkgdir}/opt/${pkgname}/chrome-sandbox"
  fi
}
