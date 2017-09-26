# Maintainer: Conor Anderson <conor@conr.ca>
pkgname=wire-desktop-beta
_pkgname=${pkgname%-beta}
pkgver=2.17.2813
pkgrel=2
pkgdesc='Modern, private messenger. Based on Electron.'
arch=('x86_64' 'i686')
url='https://wire.com/'
license=('GPL3')
conflicts=('wire-desktop-bin' 'wire-desktop' 'wire-desktop-git')
depends=('alsa-lib' 'gconf' 'gtk2' 'libxss' 'libxtst' 'nss')
makedepends=('cargo' 'npm' 'python2' 'git')
optdepends=('hunspell-en: for English spellcheck support')
provides=('wire-desktop')
source=("${pkgver}.tar.gz::https://github.com/wireapp/wire-desktop/archive/release/"$pkgver".tar.gz"
        "${_pkgname}.desktop")
sha256sums=('66e532a8b64231f0b7f11cce0dad389e56eff25cc4481976bcc466525d0aa8f6'
            '84d869ca111010a5f45f3d5cb8ef4320fa46ac01104773559fb3a7c501f8313b')

build() {
  cd "${srcdir}/${_pkgname}-release-${pkgver}"
  npm install
  $(npm bin)/grunt 'linux-other'
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
