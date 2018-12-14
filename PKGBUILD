# Contributor: Stephen Zhang <zsrkmyn at gmail dot com>

pkgname=sphinxtrain
pkgver=5prealpha
pkgrel=1
pkgdesc="Carnegie Mellon University's open source acoustic model trainer."
url='http://cmusphinx.sourceforge.net/'
arch=('i686' 'x86_64')
license=('BSD')
makedepends=('python')
depends=('sphinxbase=5prealpha')
optdepends=('python: for python support'
			'python-scipy: for python support'
			'python-numpy: for python support')
source=("http://downloads.sourceforge.net/project/cmusphinx/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.gz"
		'fix_sphinxbase_checking.patch')

prepare() {
  cd "${pkgname}-${pkgver}"

  sed -i -e '1s/python/python2/' -e '21s/bw//' scripts/sphinxtrain
  patch -p1 < "$srcdir/fix_sphinxbase_checking.patch"

  msg2 "Reconfiguring project for current version of Automake"
  autoreconf -ivf > /dev/null
}

build() {
  cd "${pkgname}-${pkgver}"

  ./configure \
	  --prefix=/usr \
	  --libexecdir="/usr/lib" \
	  --sysconfdir="/etc" \
	  --with-sphinxbase=auto
  make

  #cd "python"
  #python2 setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}/" install

  #cd "python"
  #python2 setup.py install --root=$pkgdir --optimize=1 --skip-build

  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" \
                "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  rm -rf "${pkgdir}/usr/lib/${pkgname}/python"
}
md5sums=('762d776c315a8dfbc01923d1712ede6a'
         '86a5a8d3df8108b213f91df8dba22d85')
