# Maintainer: Ricardo Funke Ormieres <ricardo.funke at gmail dot com>
# Contributor: Alessio Sergi <asergi at archlinux dot us>

pkgname=eclipse-galileo
_realname=eclipse
pkgver=3.5.2
_internal_pkgver=3.5.2
pkgrel=2
_date=201002111343
pkgdesc="An IDE for Java and other languages - Galileo"
arch=('i686' 'x86_64')
url="http://www.eclipse.org/"
license=('EPL')
depends=('desktop-file-utils' 'java-environment' 'python2' 'xulrunner')
provides=(${_realname})
conflicts=(${_realname})
install=${pkgname}.install
source=("http://www.eclipse.org/downloads/download.php?file=/eclipse/downloads/drops/R-${pkgver}-${_date}/${_realname}-SDK-${pkgver}-linux-gtk.tar.gz"
        "eclipse.desktop"
        "eclipse.ini.patch"
        "eclipse.sh")
md5sums=('bde55a2354dc224cf5f26e5320e72dac'
         'feb32dc323efc161cf044a36eeb5ec4d'
         '74165d9a60ecc841d021567270b14fd5'
         '7ea99a30fbaf06ec29261541b8eb1e23')
[ "${CARCH}" = "x86_64" ] && source[0]="http://www.eclipse.org/downloads/download.php?file=/eclipse/downloads/drops/R-${pkgver}-${_date}/${_realname}-SDK-${pkgver}-linux-gtk-${CARCH}.tar.gz"
[ "${CARCH}" = "x86_64" ] && md5sums[0]='54e2ce0660b2b1b0eb4267acf70ea66d'

package() {
  cd "${srcdir}/eclipse"

  # patch to increase default memory limits
  patch -Np0 -i ${srcdir}/eclipse.ini.patch

  # python2 fix
  sed -i 's|#!/usr/bin/python|#!/usr/bin/python2|' \
    plugins/org.apache.ant_1.7.1.v20090120-1145/bin/runant.py

  # install eclipse
  install -d -m755 ${pkgdir}/usr/share/${_realname}
  cp -r * ${pkgdir}/usr/share/${_realname}/

  # install bin file
  install -d -m755 ${pkgdir}/usr/bin
  install -m755 ${srcdir}/${_realname}.sh ${pkgdir}/usr/bin/${_realname}

  # install icon and desktop files
  install -d -m755 ${pkgdir}/usr/share/{applications,pixmaps}
  install -m644 ${srcdir}/${_realname}.desktop ${pkgdir}/usr/share/applications/
  install -m644 plugins/org.eclipse.sdk_${_internal_pkgver}.v${_date}/${_realname}48.png \
    ${pkgdir}/usr/share/pixmaps/${_realname}.png
}
