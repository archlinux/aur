# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Jesse R. Adams <jesse at techno-geeks dot org>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=mdocml
pkgver=1.13.3
pkgrel=1
pkgdesc="A suite of tools compiling mdoc, the roff macro language and man manuals."
arch=('i686' 'x86_64')
url="http://mdocml.bsd.lv/"
license=('custom: ISC')
options=(staticlibs)
depends=('sqlite')
provides=('mandoc')
conflicts=('mandoc')
source=("http://mdocml.bsd.lv/snapshots/$pkgname-$pkgver.tar.gz")
md5sums=('7be80e1116a11abe2aabd6b2f04434ef')
sha1sums=('3ccfbb492a477b84343c97de743b3dd5bd3c763b')
sha256sums=('23ccab4800d50bf4c327979af5d4aa1a6a2dc490789cb67c4c3ac1bd40b8cad8')

prepare() {
  # adapt configuration
  cat << END > $pkgname-$pkgver/configure.local
PREFIX="/usr"
SBINDIR="/usr/bin"
MANDIR="/usr/share/man"
EXAMPLEDIR="/usr/share/mandoc/examples"
BINM_MAN="mman"
BINM_APROPOS="mapropos"
BINM_WHATIS="mwhatis"
MANM_MAN="mandoc_man"
MANM_MDOC="mandoc_mdoc"
MANM_ROFF="mandoc_roff"
# default cflags
$(grep -m1 'CFLAGS=' configure)
# add our cflags
CFLAGS="\${CFLAGS} $CFLAGS"
END
}

build() {
  cd $pkgname-$pkgver
  ./configure
  make -j1
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" -j1 install
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

