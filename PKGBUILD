# Maintainer: Stephen Zhang <zsrkmyn at gmail dot com>

pkgname=sphinxtrain
pkgver=5prealpha
pkgrel=1
pkgdesc="Carnegie Mellon University's open source acoustic model trainer."
url='http://cmusphinx.sourceforge.net/'
arch=('i686' 'x86_64')
license=('BSD')
depends=('sphinxbase=5prealpha')
source=("http://downloads.sourceforge.net/project/cmusphinx/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.gz"
		'fix_sphinxbase_checking.patch')

prepare() {
  cd "${pkgname}-${pkgver}"

  patch -p1 < "$srcdir/fix_sphinxbase_checking.patch"

  msg2 "Reconfiguring project for current version of Automake"
  autoreconf -ivf > /dev/null

  cd ..
}

build() {
  cd "${pkgname}-${pkgver}"

  ./configure \
	  --prefix=/usr \
	  --libexecdir="/usr/lib/$pkgname" \
	  --with-sphinxbase=auto
  make
}

package() {
  cd "${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}/" install

  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" \
                "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
md5sums=('762d776c315a8dfbc01923d1712ede6a'
         '86a5a8d3df8108b213f91df8dba22d85')
