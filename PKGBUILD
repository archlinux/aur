# Maintainer: Conor Anderson <conor@conr.ca>
# Maintainer: Maxim Baz <$pkgname at maximbaz dot com>

pkgname=wire-desktop-beta
_pkgname=${pkgname%-beta}
pkgver=3.5.2881
pkgrel=2
pkgdesc='End-to-end encrypted messenger with file sharing, voice calls and video conferences'
arch=('x86_64')
url='https://wire.com/'
license=('GPL3')
depends=('electron' 'xdg-utils')
makedepends=('cargo' 'npm' 'python2' 'git' 'yarn')
optdepends=('hunspell-en_US: for English spellcheck support'
            'emoji-font: colorful emoji')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/wireapp/${_pkgname}/archive/linux/${pkgver}.tar.gz"
        "${pkgname}.desktop")
sha256sums=('4216cd9c3a2c4920aec2f3c967181b04bfafdb1b47e526a8e823911cce704da1'
            '79505a8ae908a26f74af3d72c24cb09815dc5688eca26ee4bbf57362a865d7c5')

prepare() {
  # Create launcher script
  cat << EOF > "${pkgname}"
#!/bin/sh

electron "/usr/lib/${pkgname}"
EOF
}

build() {
  cd "${_pkgname}-linux-${pkgver}"
  yarn
  yarn build:ts
  npx grunt 'linux-other-internal'
}

package() {
  # Place files
  install -d "${pkgdir}/usr/lib/${pkgname}"
  cp -a "${_pkgname}-linux-${pkgver}"/wrap/dist/linux-unpacked/resources/app/* "${pkgdir}/usr/lib/${pkgname}"

  # Place launcher script
  install -Dm755 -t "${pkgdir}/usr/bin/" "${pkgname}"

  # Place desktop entry and icon
  desktop-file-install -m 644 --dir "${pkgdir}/usr/share/applications/" "${pkgname}.desktop"
  local res
  for res in 32x32 256x256; do
    install -Dm644 "${_pkgname}-linux-${pkgver}/resources/icons/${res}.png" "${pkgdir}/usr/share/icons/hicolor/${res}/apps/${pkgname}.png"
  done

  # Spellcheck dictionaries
  rm -rf "${pkgdir}/usr/lib/${pkgname}/node_modules/spellchecker/vendor/hunspell_dictionaries"
  ln -s "/usr/share/hunspell" "${pkgdir}/usr/lib/${pkgname}/node_modules/spellchecker/vendor/hunspell_dictionaries"

  # Place license files
  local license
  for license in "LICENSE.electron.txt" "LICENSES.chromium.html"; do
    install -Dm644 "${_pkgname}-linux-${pkgver}/wrap/dist/linux-unpacked/${license}" "${pkgdir}/usr/share/licenses/${pkgname}/${license}"
  done
}
