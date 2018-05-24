# Maintainer:  Jonathon Fernyhough <jonathon at_manjaro_dot org>
# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Romain Bouchaud-Leduc <r0m1.bl@camaris.org>

pkgname=trickle
pkgver=1.07
pkgrel=11
pkgdesc="Lightweight userspace bandwidth shaper"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/mariusae/trickle"
license=('BSD')
depends=('libevent' 'libtirpc')
_commit=a2aeb9f30aa3c651580b9be9ba3c9c13bf51a416 # "import of trickle 1.07"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mariusae/trickle/archive/${_commit}.tar.gz"
        "fix-crasher.patch")
sha256sums=('b07ffdff831d11972dc802a4fc2d4000af844933b39ad7f88de20a2866a55f37'
            '495aeb95039dcdeb3bfde46c40b3391fe2416ec51678a1ded9bbeced6f6d1349')

prepare() {
  cd "${srcdir}/${pkgname}-${_commit}"

  # FS#27549
  sed -i 's|^_select(int|select(int|' trickle-overload.c

  # FS#35872
  patch -Np1 -i "${srcdir}/fix-crasher.patch"
}

build() {
  cd "${srcdir}/${pkgname}-${_commit}"

  CPPFLAGS+=" -I/usr/include/tirpc/"
  LDFLAGS+=" -ltirpc"

  ./configure --prefix=/usr \
              --mandir=/usr/share/man \
              --build=$(gcc -dumpmachine)
  sed -i "s|.*in_addr_t.*||g" config.h
  make -j1
}

package(){
  cd "${srcdir}/${pkgname}-${_commit}"

  make DESTDIR="${pkgdir}" install
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
