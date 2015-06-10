#Maintainer: "Jameson Pugh <imntreal@gmail.com>"

pkgname=firmware-extract
pkgver=2.0.13
pkgrel=1
pkgdesc="A firmware-tools plugin to add firmware extraction from vendor binaries"
arch=('any')
url="http://linux.dell.com/repo/firmware/"
license=('GPL' 'OSL')
depends=('python2')
makedepends=('make' 'gawk')
source=("http://linux.dell.com/libsmbios/download/firmware-extract/firmware-extract-${pkgver}/firmware-extract-${pkgver}.tar.bz2")
provides=('firmware-extract')
sha256sums=('507fe9aa33f5630c2b8859e2b9ec80fc4ff73dead24d7eaf640978e5873ccf96')

#grep '\..-' will work with any locale
PYTHON3VER=$(pacman -Qi python | grep '\..-' | sed -e 's/^.*: //' -e 's/-.*$//g' | awk -F '.' '{print $1"."$2}')
PYTHON2VER=$(pacman -Qi python2 | grep '\..-' | sed -e 's/^.*: //' -e 's/-.*$//g' | awk -F '.' '{print $1"."$2}')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr --sysconfdir=/etc
  #UGLY HACK - Python 3 to Python 2
  sed -i -e 's/^PYTHON.=.*$/PYTHON = \/usr\/bin\/python2/' -e "s/${PYTHON3VER}/${PYTHON2VER}/g" Makefile
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}/" install
}
