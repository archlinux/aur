# Maintainer: Adam Hellberg <adam.hellberg@sharparam.com>

pkgbase=comma-ide-complete
pkgname=(comma-ide-complete comma-ide-complete-jre)
pkgrel=1
pkgver=2023.08.0
pkgdesc='The Integrated Development Environment for Raku (formerly Perl 6) (Complete edition).'
arch=('any')
url='https://commaide.com/'
license=('APACHE')
source=("$pkgbase-$pkgver.tar.gz::https://commaide.com/download/complete/linux"
        'comma-ide-complete.desktop')
sha256sums=('93523a0450c7c2dd228088b44e33ff5d620edb1b6fb0fb051b58245091a926aa'
            '6166a99c86982fc5fabde97dfdda14cb4b2addffa774551b9b50c4aae9e63283')

_binname=comma-complete
_tarname=comma-complete-${pkgver}
_installdir='/opt'

prepare() {
  rm -rf "$srcdir/jbr"
  mv "${srcdir}/${_tarname}/jbr" "$srcdir/jbr"
}

build() {
  sed -i "s/Version=/Version=${pkgver}/" "${pkgbase}.desktop"
  sed -i "s#Exec=#Exec=\"${_installdir}/${pkgbase}/bin/comma.sh\" %f#" "${pkgbase}.desktop"
  sed -i "s/Icon=/Icon=${pkgbase}/" "${pkgbase}.desktop"
}

package_comma-ide-complete() {
  optdepends=(
    'rakudo-star' 'rakudo'
    'comma-ide-complete-jre: JetBrains custom JRE (Recommended)'
    'java-runtime=11: Required if comma-ide-complete-jre is not installed'
  )
  install=comma-ide-complete.install

  install -dm755 "${pkgdir}${_installdir}"
  install -dm755 "${pkgdir}/usr/bin"
  install -dm755 "${pkgdir}/usr/share/applications"
  install -dm755 "${pkgdir}/usr/share/icons"

  cp -a "${srcdir}/${_tarname}/" "${pkgdir}${_installdir}/${pkgbase}"

  ln -s "${_installdir}/${pkgbase}/bin/comma.sh" "${pkgdir}/usr/bin/${_binname}"
  install -m644 "${srcdir}/${pkgbase}.desktop" "${pkgdir}/usr/share/applications"

  ln -s "${_installdir}/${pkgbase}/bin/comma.png" "${pkgdir}/usr/share/icons/${pkgbase}.png"
}

package_comma-ide-complete-jre() {
  pkgdesc='JBR (Jetbrains Runtime) for Comma IDE Complete - a patched JRE'
  url='https://github.com/JetBrains/JetBrainsRuntime'

  install -dm755 "${pkgdir}${_installdir}/$pkgbase"
  mv "$srcdir/jbr" "${pkgdir}${_installdir}/$pkgbase"
}
