# Maintainer: GordonGR <ntheo1979@gmail.com>
# Contributor: josephgbr <rafael.f.f1@gmail.com>
# Contributor: quequotion <quequotion@gmail.com>

_pkgname=musicbrainz
pkgname=lib32-${_pkgname}
pkgver=2.1.5
pkgrel=3
pkgdesc="The second generation incarnation of the CD Index (32 bit)"
arch=('x86_64')
url="http://www.musicbrainz.org/index.html"
license=('LGPL')
depends=('lib32-expat' 'lib32-gcc-libs' "${_pkgname}")
makedepends=('lib32-python2' 'gcc-multilib')
options=('!libtool')
source=("ftp://ftp.musicbrainz.org/pub/$_pkgname/historical/libmusicbrainz-${pkgver}.tar.gz"
	'gcc4.3.patch'
	'gcc6-fix-errors.patch')
md5sums=('d5e19bb77edd6ea798ce206bd05ccc5f'
         '9455555d03e3bd15d488ffdb2287ffa7'
         '92ebdb6bc65df929bc532b1e6cf78756')


prepare() {
cd "${srcdir}/lib${_pkgname}-${pkgver}"
patch -p1 -i ${srcdir}/gcc4.3.patch
patch -p1 -i ${srcdir}/gcc6-fix-errors.patch
}

build() {
export CC='gcc -m32'
export CXX='g++ -m32'
export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  
cd "${srcdir}/lib${_pkgname}-${pkgver}"
./configure --prefix=/usr --libdir=/usr/lib32
make
}

package() {
cd "${srcdir}/lib${_pkgname}-${pkgver}"
make DESTDIR="${pkgdir}" install
rm -rf "${pkgdir}/usr/include"
  
## python is not ready for multilib?
cd python
python2.7-32 setup.py install --root=${pkgdir}
}

