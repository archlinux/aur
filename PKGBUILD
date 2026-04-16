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
  'fuse2'
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

  install -Dm755 "${appimage}" "${pkgdir}/opt/stably-orca/orca.AppImage"
  install -Dm755 "${srcdir}/stably-orca.sh" "${pkgdir}/usr/bin/stably-orca"
  install -Dm644 "${srcdir}/stably-orca.desktop" \
    "${pkgdir}/usr/share/applications/stably-orca.desktop"

  local sqfs="${srcdir}/squashfs-root"
  if [[ -d "${sqfs}" ]]; then
    local found=0
    for size in 16 32 48 64 128 256 512; do
      local src="${sqfs}/usr/share/icons/hicolor/${size}x${size}/apps/orca.png"
      if [[ -f "${src}" ]]; then
        install -Dm644 "${src}" \
          "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/stably-orca.png"
        found=1
      fi
    done
    if [[ "${found}" -eq 0 && -f "${sqfs}/orca.png" ]]; then
      install -Dm644 "${sqfs}/orca.png" \
        "${pkgdir}/usr/share/icons/hicolor/512x512/apps/stably-orca.png"
    fi
  fi
}
