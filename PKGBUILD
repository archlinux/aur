# Maintainer: Yaksh Bariya <yakshbari4@gmail.com>

pkgname=signal-desktop-system-electron
conflicts=('signal-desktop')
provides=('signal-desktop')
_parent_pkgname=signal-desktop
_pkgname=Signal-Desktop
pkgver=8.2.1
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
sha256sums=('e72d44e93ee579ab99b3f308c07a10ac2eecf14dd86197ac7efca6855f3facc4'
            'bf388df4b5bbcab5559ebbf220ed4748ed21b057f24b5ff46684e3fe6e88ccce')
b2sums=('5e617baa9c111f356772b56687c3c1bae324fb3e0ba9b03ea680a23222968cd5029190697d88138dcd0c3b503b98f4c80b551adf5f8647b6a05a1a8af3d34ac0'
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
