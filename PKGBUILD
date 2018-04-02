# Contributor: jospehgbr <rafael.f.f1@gmail.com>
# Maintainer: GordonGR <ntheo1979@gmail.com>

_pkgname=enca
pkgname=lib32-${_pkgname}
pkgver=1.19
pkgrel=2
pkgdesc="Charset analyser and converter (32 bit)"
arch=('x86_64')
url="http://cihar.com/software/enca/"
license=('GPL')
depends=('recode' "${_pkgname}")
source=("http://dl.cihar.com/${_pkgname}/${_pkgname}-${pkgver}.tar.xz"
	'enca-bad-file-descriptor.patch')
md5sums=('a7a0c152658e012db701a48ae8b79525'
         'd4e204209bccffea4dcc1aec62d4cadf')

prepare() {
cd ${_pkgname}-$pkgver
patch -p1 -i ../enca-bad-file-descriptor.patch # https://github.com/nijel/enca/issues/28
}

build() {
export CC='gcc -m32'  
cd ${_pkgname}-${pkgver}
./configure --prefix=/usr \
            --libexecdir=/usr/lib32 \
            --mandir=/usr/share/man \
            --with-librecode=/usr \
            --enable-external \
            --libdir=/usr/lib32
make
}

package() {
make -C ${_pkgname}-${pkgver} DESTDIR="${pkgdir}" install
rm -rf "${pkgdir}"/usr/{bin,include,share}
}
