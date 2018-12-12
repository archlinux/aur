# Maintainer: Conor Anderson <conor@conr.ca>
# Maintainer: Maxim Baz <$_pkgname at maximbaz dot com>

pkgname=wire-desktop-beta
_pkgname=${pkgname%-beta}
pkgver=3.4.2885
pkgrel=1
pkgdesc='Modern, private messenger. Based on Electron.'
arch=('x86_64' 'i686')
url='https://wire.com/'
license=('GPL3')
conflicts=('wire-desktop-bin' 'wire-desktop' 'wire-desktop-git')
depends=('alsa-lib' 'gconf' 'gtk2' 'libxss' 'libxtst' 'nss' 'xdg-utils')
makedepends=('cargo' 'npm' 'python2' 'git' 'yarn')
optdepends=('hunspell-en: for English spellcheck support'
            'noto-fonts-emoji: for colorful emoji made by Google'
            'ttf-emojione: for colorful emoji made by EmojiOne')
provides=('wire-desktop')
source=("${pkgver}.tar.gz::https://github.com/wireapp/wire-desktop/archive/release/${pkgver}.tar.gz"
        "${_pkgname}.desktop")
sha256sums=('7bdcb33bfb23719b0840a86d294b4d4d97c59f8a7857bc609d8736dfe2b340e1'
            'cc9056cecff2aa49a9ce9c8376d57ec8c7c2cb8174f7966b5cdccbeb2e3751ea')

build() {
  cd "${srcdir}/${_pkgname}-release-${pkgver}"
  yarn
  yarn build:ts
  npx grunt 'linux-other-internal'
}

package() {
  # Place files
  install -d "${pkgdir}/usr/lib/${_pkgname}"
  cp -a "${srcdir}/${_pkgname}-release-${pkgver}"/wrap/dist/linux*unpacked/* "${pkgdir}/usr/lib/${_pkgname}"  

  # Symlink main binary
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/lib/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  # Place desktop entry and icon
  desktop-file-install -m 644 --dir "${pkgdir}/usr/share/applications/" "${srcdir}/${_pkgname}.desktop"
  for res in 32x32 256x256; do
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/${res}/apps"
    install -Dm644 "${srcdir}/${_pkgname}-release-${pkgver}/resources/icons/${res}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${res}/apps/${_pkgname}.png"
  done

  # Spellcheck dictionaries
  rm -rf "${pkgdir}/usr/lib/${_pkgname}/resources/app/node_modules/spellchecker/vendor/hunspell_dictionaries"
  ln -s "/usr/share/hunspell" "${pkgdir}/usr/lib/${_pkgname}/resources/app/node_modules/spellchecker/vendor/hunspell_dictionaries"

  # Place license files
  for license in "LICENSE.electron.txt" "LICENSES.chromium.html"; do
    install -Dm644 "${pkgdir}/usr/lib/${_pkgname}/${license}" "${pkgdir}/usr/share/licenses/${_pkgname}/${license}"
    rm "${pkgdir}/usr/lib/${_pkgname}/${license}"
  done
}
