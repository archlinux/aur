# Maintainer:  twa022 <twa022 at gmail dot com>
# Contributor: D. Can Celasun <dcelasun[at]gmail[dot]com>
# Contributor: Dmitry Batenkov <dima dot batenkov at gmail dot com>

pkgname=thunarx-python
epoch=1
pkgver=0.4.0
pkgrel=1
pkgdesc="Thunarx Python Bindings"
arch=('i686' 'x86_64')
url='http://goodies.xfce.org/projects/bindings/thunarx-python'
makedepends=('thunar')
license=('GPL')
install="${pkgname}.install"
sha256sums=('435f4750f660575c6a854663bfc93f2f16d445128db0e8190e901aa09c15a615'
            '40c8ec1598142962349314eedb30fab5e115c719571490dcc39d1bcc793451e9'
            'c1386f440d3e3b10ee69afeed48f349b91720111aad2d2956b3767085ed8ff87')
if [[ "`pkg-config --modversion thunarx-3 2>/dev/null`" != '' ]] ; then
	depends+=('thunar>=1.7.0' 'python2-gobject')
elif [[ "`pkg-config --modversion thunarx-2 2>/dev/null`" != '' ]] ; then
	depends+=('thunar<1.7.0' 'python2-gobject2' 'pygtk')
	pkgver=0.3.0
	sha256sums[0]='5650e045565af82f3a5f67bbecb46182b502a37f94d08c23adac697dbb4ce258'
else
	return 1
fi
source=("https://archive.xfce.org/src/bindings/${pkgname}/${pkgver%.*}/${pkgname}-${pkgver}.tar.bz2"
        'python2.patch'
        'pygtk.patch')

prepare() {
  cd "${pkgname}-${pkgver}"
  patch -p1 -i ../python2.patch
  if [[ `vercmp "${pkgver}" '0.3.0'` -le 0 ]] ; then
    patch -p1 -i ../pygtk.patch
  fi
}

build() {
  cd "${pkgname}-${pkgver}"
  PYTHON=python2 ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
