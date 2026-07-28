# Maintainer: thenomadcode <thenomadcodeinfo@gmail.com>

pkgname=stably-orca-git
_gitname=orca
pkgver=1.1.30.r0.g0000000
pkgrel=1
pkgdesc="Stably AI Orca - Electron-based agentic coding IDE (built from main)"
arch=('x86_64')
url="https://github.com/stablyai/orca"
license=('MIT')
depends=(
  'zlib'
  'hicolor-icon-theme'
  'gtk3'
  'nss'
  'alsa-lib'
  'libnotify'
  'libxss'
  'libxtst'
  'libsecret'
)
makedepends=(
  'git'
  'nodejs>=20'
  'pnpm'
  'python'
  # Upstream's config/scripts/install-electron-package-binary.mjs shells out
  # to the `unzip` CLI to extract the Electron archive. Not in base-devel.
  'unzip'
)
provides=('stably-orca')
conflicts=('stably-orca' 'stably-orca-bin')
options=('!strip' '!debug')
source=(
  "${_gitname}::git+https://github.com/stablyai/orca.git"
  'stably-orca.sh'
  'stably-orca.desktop'
)
sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
)

pkgver() {
  cd "${srcdir}/${_gitname}"
  local tag count hash
  # Strip leading v, replace hyphens with dots (pkgver forbids hyphens).
  tag="$(git describe --tags --abbrev=0 2>/dev/null | sed 's/^v//; s/-/./g')"
  count="$(git rev-list --count HEAD)"
  hash="$(git rev-parse --short HEAD)"
  printf '%s.r%s.g%s' "${tag:-0}" "${count}" "${hash}"
}

prepare() {
  cd "${srcdir}/${_gitname}"

  # Upstream's electron-builder afterPack hook runs verifyLinuxGlibcFloor(),
  # which aborts packaging if any bundled native binary needs a glibc or
  # libstdc++ symbol newer than Ubuntu 20.04 (glibc 2.31). That gate protects
  # upstream's own AppImage, which must run on old distros.
  #
  # It cannot hold here: node-pty is rebuilt from source against the build
  # host's glibc, so on Arch it legitimately records GLIBC_2.42 and
  # GLIBC_ABI_DT_RELR and the gate kills the build. Build host and target host
  # are the same rolling-release system, so the floor is meaningless for us —
  # replace the checker with a no-op.
  local gate='config/scripts/verify-linux-glibc-floor.cjs'
  if [[ ! -f "${gate}" ]]; then
    echo "ERROR: expected upstream ${gate}, not found."
    echo "Upstream may have moved or dropped the glibc floor gate. Re-check the"
    echo "afterPack hook in config/electron-builder.config.cjs and update this PKGBUILD."
    return 1
  fi
  cat > "${gate}" <<'EOF'
// Replaced by the stably-orca-git PKGBUILD. See the prepare() comment: the
// upstream Ubuntu 20.04 glibc floor does not apply to natives compiled
// against the same Arch system they will run on.
module.exports = { verifyLinuxGlibcFloor: () => {} }
EOF
}

build() {
  cd "${srcdir}/${_gitname}"
  # Electron + node-pty need a working C toolchain and Python, covered by base-devel + makedepends.
  pnpm install --frozen-lockfile
  # Reproduce upstream's build:linux but restrict electron-builder to the
  # AppImage target. Upstream's script also builds a .deb via bundled fpm,
  # whose ruby wants libcrypt.so.1 (not shipped on Arch). We only consume
  # the AppImage anyway. Invoking electron-builder directly avoids having
  # the script's `&&` chain mis-route positional args.
  pnpm run build
  pnpm exec electron-builder --config config/electron-builder.config.cjs --linux AppImage
}

package() {
  local appimage="${srcdir}/${_gitname}/dist/orca-linux.AppImage"
  if [[ ! -f "${appimage}" ]]; then
    echo "ERROR: expected AppImage at ${appimage} not found."
    echo "Upstream build outputs may have changed. Inspect dist/ and update PKGBUILD."
    return 1
  fi

  chmod +x "${appimage}"
  ( cd "${srcdir}" && "${appimage}" --appimage-extract >/dev/null )

  local sqfs="${srcdir}/squashfs-root"

  # Ship the extracted tree rather than the AppImage: see stably-orca-bin
  # PKGBUILD for rationale (AppImageLauncher bypass + no fuse2 runtime dep).
  install -dm755 "${pkgdir}/opt/stably-orca"
  cp -a "${sqfs}/." "${pkgdir}/opt/stably-orca/"
  # Extracted AppImages can ship with 0700 on the root dir; make everything
  # world-readable and dirs world-traversable so non-root users can launch.
  chmod -R u+rwX,go+rX "${pkgdir}/opt/stably-orca"
  chmod 755 "${pkgdir}/opt/stably-orca/AppRun"

  install -Dm755 "${srcdir}/stably-orca.sh" "${pkgdir}/usr/bin/stably-orca"
  install -Dm644 "${srcdir}/stably-orca.desktop" \
    "${pkgdir}/usr/share/applications/stably-orca.desktop"

  # Theme-aware icon install (in addition to the copies inside /opt).
  # Upstream names the Linux executable and its icon `orca-ide` (GNOME Orca
  # already owns `orca`), and has renamed it before, so match whatever single
  # icon each hicolor size ships instead of hardcoding a basename.
  local found=0 size src
  for size in 16 24 32 48 64 128 256 512; do
    for src in "${sqfs}/usr/share/icons/hicolor/${size}x${size}/apps/"*.png; do
      [[ -f "${src}" ]] || continue
      install -Dm644 "${src}" \
        "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/stably-orca.png"
      found=1
      break
    done
  done
  if (( found == 0 )); then
    for src in "${sqfs}"/*.png; do
      [[ -f "${src}" ]] || continue
      install -Dm644 "${src}" \
        "${pkgdir}/usr/share/icons/hicolor/512x512/apps/stably-orca.png"
      found=1
      break
    done
  fi
  # Fail loudly: a silently icon-less package looks fine in CI but ships a
  # blank launcher entry, which is how the orca -> orca-ide rename went
  # unnoticed in the first place.
  if (( found == 0 )); then
    echo "ERROR: no application icon found under ${sqfs}."
    echo "Upstream icon layout changed. Inspect the extracted tree and update PKGBUILD."
    return 1
  fi
}
