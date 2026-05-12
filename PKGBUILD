# Maintainer: Yaksh Bariya <yakshbari4@gmail.com>

pkgname=signal-desktop-system-electron
conflicts=('signal-desktop')
provides=('signal-desktop')
_parent_pkgname=signal-desktop
_pkgname=Signal-Desktop
pkgver=8.10.0
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
  'pnpm'
  'python'
)
optdepends=('xdg-desktop-portal: Screensharing with Wayland')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/signalapp/${_pkgname}/archive/v${pkgver}.tar.gz"
  "${_parent_pkgname}.desktop"
)
sha256sums=('520dfd62c5073bebf786244fb91d6566664442cddf1b0c5e0fa7a0199b659984'
            'bf388df4b5bbcab5559ebbf220ed4748ed21b057f24b5ff46684e3fe6e88ccce')
b2sums=('61f238b0a55cbdff8ce5f19f26125af1e4291a3e57b4484e8b5e23f8804a44ace8d778b99a215146d8aa1805f36a43175b22ae5a617fc18d8399701bcce3bdd6'
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
