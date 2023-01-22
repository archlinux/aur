# Maintainer: Adam Hellberg <adam.hellberg@sharparam.com>
# Contributor: Connor Nuutinen <cnuutinen@outlook.com>
# Contributor: David Santiago <demanuel@ymail.com>
# Contributor: jokersus <jokersus.cava@gmail.com>

pkgname=comma-ide-community
pkgrel=1
pkgver=2022.10.0
pkgdesc='The Integrated Development Environment for Raku (formerly Perl 6).'
arch=('any')
url='https://commaide.com/'
license=('APACHE')
depends=('java-runtime>=11')
optdepends=('rakudo-star' 'rakudo')
source=('https://commaide.com/download/community/linux'
        'comma-ide-community.desktop')
sha256sums=('b8fca82237f3d3c0ee1c67e8a4829248c04da9ec9434a917b36c523fcc3b99d4'
            '79770c7c0b602cd07266da5727afd62eb12e01d7de82e588c216bac7419ff971')
install=comma-ide.install

_binname=comma
_tarname=comma-community-${pkgver}
_installdir='/opt'

build() {
  sed -i "s/Version=/Version=${pkgver}/" "${pkgname}.desktop"
  sed -i "s#Exec=#Exec=\"${_installdir}/${pkgname}/bin/${_binname}.sh\" %f#" "${pkgname}.desktop"
  sed -i "s/Icon=/Icon=${pkgname}/" "${pkgname}.desktop"
}

package() {
  # No direct link, look at source
  tar -xzvf linux

  install -dm755 "${pkgdir}${_installdir}"
  install -dm755 "${pkgdir}/usr/bin"
  install -dm755 "${pkgdir}/usr/share/applications"
  install -dm755 "${pkgdir}/usr/share/icons"

  cp -a "${srcdir}/${_tarname}/" "${pkgdir}${_installdir}/${pkgname}"
  rm -rf "${pkgdir}${_installdir}/${pkgname}/jbr"

  ln -s "${_installdir}/${pkgname}/bin/comma.sh" "${pkgdir}/usr/bin/${_binname}"
  install -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications"

  ln -s "${_installdir}/${pkgname}/bin/comma.png" "${pkgdir}/usr/share/icons/${pkgname}.png"
}
