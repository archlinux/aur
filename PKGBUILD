# Maintainer: Yaksh Bariya <yakshbari4@gmail.com>

pkgname=signal-desktop-system-electron
conflicts=('signal-desktop')
provides=('signal-desktop')
_parent_pkgname=signal-desktop
_pkgname=Signal-Desktop
pkgver=8.30.0
pkgrel=1
pkgdesc="Signal Private Messenger for Linux (uses system Electron)"
license=('AGPL-3.0-only')
arch=('x86_64')
url="https://signal.org"
depends=(
  'electron'
  'glibc'
  'gtk3'
  'hicolor-icon-theme'
  'libcups'
  'libdrm'
  'libgcc'
  'libnotify'
  'libpulse'
  'libx11'
  'libxcb'
  'libxcomposite'
  'libxdamage'
  'libxext'
  'libxfixes'
  'libxrandr'
  'mesa'
  'nspr'
  'nss'
)
makedepends=(
  'git'
  'git-lfs'
  'libxcrypt-compat'
  'node-gyp'
  'nodejs'
  'npm'
  'pnpm'
  'python'
)
optdepends=('xdg-desktop-portal: Screensharing with Wayland')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/signalapp/${_pkgname}/archive/v${pkgver}.tar.gz"
  "${_parent_pkgname}.desktop"
)
sha256sums=('6015f33fabe44fcc4c7a8dbb50081349afbeccd3975bf9fcacd6f79704e1fa79'
            'bf388df4b5bbcab5559ebbf220ed4748ed21b057f24b5ff46684e3fe6e88ccce')
b2sums=('60ca4051d1e9a1530385fe95e9e9f0b6b087a719d170118ed9d9b2d0e9a1c42082ca9ca2acd41fe1c9e013e178eefaf26e440a95ca41571489c0df00d4d9b558'
        'ffb8f7bab4fd84aacf13e7b6d2835daf449b6650b4b3fa723456792ba7fb6cae352928fea11cb030510d558ce30036ff5a1513444f067b94c7fff0158b4f2265')

prepare() {
  cd "${_pkgname}-${pkgver}"

  # git-lfs hook needs to be installed for one of the dependencies
  export GIT_CONFIG_GLOBAL="$HOME/.gitconfig"
  git lfs install

  # Allow higher Node versions
  sed 's#"node": "#&>=#' -i package.json

  # Install dependencies for sticker-creator
  pnpm install --dir sticker-creator

  # Configure electron-builder's Linux target for the current Arch architecture.
  case "${CARCH}" in
    "aarch64") electron_arch="arm64" ;;
    *) electron_arch="x64" ;;
  esac
  node scripts/prepare_linux_build.mjs deb "${electron_arch}"

  # Install dependencies for signal-desktop
  pnpm install --frozen-lockfile
}

build() {
  cd "${_pkgname}-${pkgver}"

  # Build the sticker creator
  pnpm --prefix ./sticker-creator/ run build

  # Build signal-desktop
  pnpm run build
}

package() {
  cd "${_pkgname}-${pkgver}"

  install -d "${pkgdir}/usr/"{lib,bin}
  cp -a release/linux-unpacked/resources/ "${pkgdir}/usr/lib/${_parent_pkgname}"
  cat << EOF > "${pkgdir}/usr/bin/${_parent_pkgname}"
#!/bin/sh
NODE_ENV=production electron /usr/lib/${_parent_pkgname}/app.asar "\$@"
EOF

  chmod +x "${pkgdir}/usr/bin/${_parent_pkgname}"

  install -Dm 644 "../${_parent_pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
  for i in 16 24 32 48 64 128 256 512 1024; do
    install -Dm 644 "build/icons/png/${i}x${i}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/${_parent_pkgname}.png"
  done
}

# vim: ts=2 sw=2 et:
