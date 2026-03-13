# Maintainer: Yaksh Bariya <yakshbari4@gmail.com>

pkgname=signal-desktop-system-electron
conflicts=('signal-desktop')
provides=('signal-desktop')
_parent_pkgname=signal-desktop
_pkgname=Signal-Desktop
pkgver=8.0.0
pkgrel=2
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
  'pnpm'
  'python'
)
optdepends=('xdg-desktop-portal: Screensharing with Wayland')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/signalapp/${_pkgname}/archive/v${pkgver}.tar.gz"
  "${_parent_pkgname}.desktop"
)
sha256sums=('f0232d07b6d253b35e02e389d2b4cc5d25d699b609d086f18fd52f696a24dca3'
            'bf388df4b5bbcab5559ebbf220ed4748ed21b057f24b5ff46684e3fe6e88ccce')
b2sums=('2569bbcb514befbee2f7ac2a509858f622c8f6bca40af089469fca7ded23a683cc4f2ef91bfa3cd1f569e13426c792849183c62343d41f9accc092cdc2f1072f'
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

  # Install dependencies for signal-desktop
  pnpm install
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
