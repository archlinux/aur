# Maintainer: Janek Thomaschewski <janek[at]artos-hosting[dot]de>
# Contributor: Testuser_01 <arch[at]nico-siebler[dot]de>
# Contributor: Pablo Vilas <pablovilas89[at]gmail[dot]com>

pkgname=webstorm-eap
_pkgname=WebStorm
pkgver=211.5538.3
_pkgver=2021.1
pkgrel=1
pkgdesc="JavaScript IDE and HTML editor. Early Access Program."
arch=('i686' 'x86_64')
options=('!strip')
url="http://www.jetbrains.com/webstorm"
license=('custom')
depends=()

source=(https://download.jetbrains.com/webstorm/${_pkgname}-${pkgver}.tar.gz
        https://download.jetbrains.com/webstorm/${_pkgname}-211.4961.31.tar.gz
        jetbrains-webstorm-eap.desktop
        ${_pkgname}_license.txt)

sha256sums=('fee273cdb00aa0708d7b44b5515191635badf3651289c6be2610baacb1f030af'
            '5675221f57dcc250ca5b77565d573eea70e2a3571598d2648d72924c30b0027c'
            'e8d1be7f980b7d371ef5aa65f2375397d970e887659bf3b280601cced8498e32'
            '8464fc766dbb4f6a0de4acd84007fc2916b50ca48ce7d22654144f549c8c6f4c')

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  # Remove bin/libs of non-matching architectures
  if [[ $CARCH = 'i686' ]]; then
    rm bin/fsnotifier64
    rm bin/libdbm64.so
    rm bin/webstorm64.vmoptions
    rm -rf lib/pty4j-native/linux/x86_64
  fi
  if [[ $CARCH = 'x86_64' ]]; then
    rm bin/fsnotifier
    rm bin/webstorm.vmoptions
    rm -rf lib/pty4j-native/linux/x86
  fi

  # The JBR of this version is broken, see https://youtrack.jetbrains.com/issue/JBR-3066
  rm -rf jbr
}

package() {
  cd "${srcdir}"
  mkdir -p "${pkgdir}/opt/${pkgname}"
  cp -r ${srcdir}/${_pkgname}-${pkgver}/* "${pkgdir}/opt/${pkgname}"

  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/share/applications"
  mkdir -p "${pkgdir}/usr/share/pixmaps"
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s /opt/${pkgname}/bin/webstorm.sh "${pkgdir}"/usr/bin/${pkgname}
  install -m 644 "${startdir}/jetbrains-${pkgname}.desktop" "${pkgdir}/usr/share/applications"
  install -m 644 "${pkgdir}/opt/${pkgname}/bin/webstorm.svg" "${pkgdir}/usr/share/pixmaps/${pkgname}.svg"
  install -m 644 "${startdir}/${_pkgname}_license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/${_pkgname}_license.txt"

  echo 'Using the JBR from build 211.4961.31...'
  cp -r "${srcdir}/${_pkgname}-211.4961.31/jbr" "${pkgdir}/opt/${pkgname}/jbr"
}
