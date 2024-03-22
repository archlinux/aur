# Maintainer: Behnam Momeni <sbmomeni [at the] gmail [dot] com>
# Contributor: GordonGR <ntheo1979@gmail.com>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=lib32-tk
pkgver=8.6.14
pkgrel=1
pkgdesc="A windowing toolkit for use with tcl"
arch=('x86_64')
url="http://tcl.sourceforge.net/"
license=('custom')
depends=('lib32-libxss' 'lib32-libxft' "lib32-tcl-ar>=${pkgver}" 'tk')
options=('staticlibs')
source=("https://cfhcable.dl.sourceforge.net/project/tcl/Tcl/${pkgver}/tk${pkgver}-src.tar.gz")
sha256sums=('8ffdb720f47a6ca6107eac2dd877e30b0ef7fac14f3a84ebbd0b3612cee41a94')

build() {
cd tk${pkgver}/unix
export CC='gcc -m32'
export CXX='g++ -m32'
export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
export LDFLAGS+=' -L/usr/lib32'
./configure --prefix=/usr --mandir=/usr/share/man \
  --enable-threads --disable-rpath \
  --libdir=/usr/lib32 \
  --libexecdir=/usr/lib32 \
  --with-tcl=/usr/lib32/
make
}

check() {
cd tk${pkgver}/unix
# make test
}

package() {
cd tk${pkgver}/unix
make INSTALL_ROOT="${pkgdir}" install install-private-headers
mv "${pkgdir}/usr/bin/wish${pkgver%.*}" \
  "${pkgdir}/usr/bin/wish${pkgver%.*}-32"
ln -sf wish${pkgver%.*}-32 "${pkgdir}/usr/bin/wish-32"
ln -sf libtk${pkgver%.*}.so "${pkgdir}/usr/lib32/libtk.so"

rm -rf "${pkgdir}/usr/"{share/man,include,lib}

install -Dm644 license.terms "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

# remove buildroot traces
sed -e "s#${srcdir}/tk${pkgver}/unix#/usr/lib32#" \
    -e "s#${srcdir}/tk${pkgver}#/usr/include#" \
    -i "${pkgdir}/usr/lib32/tkConfig.sh"
}
