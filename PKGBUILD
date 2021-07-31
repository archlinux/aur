# Maintainer:  Jonathon Fernyhough <jonathon+m2x+dev>
# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Romain Bouchaud-Leduc <r0m1.bl@camaris.org>

pkgname=trickle
pkgver=1.07
pkgrel=12
pkgdesc="Lightweight userspace bandwidth shaper"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/mariusae/trickle"
license=('BSD')
depends=('libevent' 'libtirpc')
_commit=a2aeb9f30aa3c651580b9be9ba3c9c13bf51a416 # "import of trickle 1.07"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mariusae/trickle/archive/${_commit}.tar.gz"
        "fix-crasher.patch"
        "$url/commit/20f221f166fc03323ed28dc3cad0b0da2c879513.patch")
sha256sums=('b07ffdff831d11972dc802a4fc2d4000af844933b39ad7f88de20a2866a55f37'
            '495aeb95039dcdeb3bfde46c40b3391fe2416ec51678a1ded9bbeced6f6d1349'
            '432194c2a25e934a865a06de9fa876545431a1729028ca1a60943554865fb40c')

prepare() {
  cd $pkgname-$_commit

  # FS#27549
  sed -i 's|^_select(int|select(int|' trickle-overload.c

  # FS#35872
  patch -Np1 -i ../fix-crasher.patch

  # Fix build with -Werror=format-security, https://github.com/mariusae/trickle/commit/20f221f166fc03323ed28dc3cad0b0da2c879513
  patch -Np1 -i ../20f221f166fc03323ed28dc3cad0b0da2c879513.patch
}

build() {
  cd $pkgname-$_commit

  CPPFLAGS+=" -I/usr/include/tirpc/"
  LDFLAGS+=" -ltirpc"

  ./configure --prefix=/usr \
              --mandir=/usr/share/man \
              --build=$(gcc -dumpmachine)
  sed -i "s|.*in_addr_t.*||g" config.h
  make -j1
}

package(){
  cd $pkgname-$_commit

  make DESTDIR="${pkgdir}" install
  install -Dm644 -t "${pkgdir}"/usr/share/licenses/${pkgname}/ LICENSE
}
