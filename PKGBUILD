# Maintainer: Adam Hellberg <adam.hellberg@sharparam.com>
# Contributor: Connor Nuutinen <cnuutinen@outlook.com>
# Contributor: David Santiago <demanuel@ymail.com>
# Contributor: jokersus <jokersus.cava@gmail.com>

pkgbase=comma-ide-community
pkgname=(comma-ide-community comma-ide-community-jre)
pkgrel=2
pkgver=2023.07.0
pkgdesc='The Integrated Development Environment for Raku (formerly Perl 6).'
arch=('any')
url='https://commaide.com/'
license=('APACHE')
source=("$pkgbase-$pkgver.tar.gz::https://commaide.com/download/community/linux"
        'comma-ide-community.desktop')
sha256sums=('defe67a45a0d348590271806318f76bb6983ae7f28cf2c32621cd52d713ee19f'
            '79770c7c0b602cd07266da5727afd62eb12e01d7de82e588c216bac7419ff971')

_binname=comma
_tarname=comma-community-${pkgver}
_installdir='/opt'

prepare() {
  rm -rf "$srcdir/jbr"
  mv "${srcdir}/${_tarname}/jbr" "$srcdir/jbr"
}

build() {
  sed -i "s/Version=/Version=${pkgver}/" "${pkgbase}.desktop"
  sed -i "s#Exec=#Exec=\"${_installdir}/${pkgbase}/bin/${_binname}.sh\" %f#" "${pkgbase}.desktop"
  sed -i "s/Icon=/Icon=${pkgbase}/" "${pkgbase}.desktop"
}

package_comma-ide-community() {
  optdepends=(
    'rakudo-star' 'rakudo'
    'comma-ide-community-jre: JetBrains custom JRE (Recommended)'
    'java-runtime=11: Required if comma-ide-community-jre is not installed'
  )
  install=comma-ide.install

  install -dm755 "${pkgdir}${_installdir}"
  install -dm755 "${pkgdir}/usr/bin"
  install -dm755 "${pkgdir}/usr/share/applications"
  install -dm755 "${pkgdir}/usr/share/icons"

  cp -a "${srcdir}/${_tarname}/" "${pkgdir}${_installdir}/${pkgbase}"

  ln -s "${_installdir}/${pkgbase}/bin/comma.sh" "${pkgdir}/usr/bin/${_binname}"
  install -m644 "${srcdir}/${pkgbase}.desktop" "${pkgdir}/usr/share/applications"

  ln -s "${_installdir}/${pkgbase}/bin/comma.png" "${pkgdir}/usr/share/icons/${pkgbase}.png"
}

package_comma-ide-community-jre() {
  pkgdesc='JBR (Jetbrains Runtime) for Comma IDE - a patched JRE'
  url='https://github.com/JetBrains/JetBrainsRuntime'

  install -dm755 "${pkgdir}${_installdir}/$pkgbase"
  mv "$srcdir/jbr" "${pkgdir}${_installdir}/$pkgbase"
}
