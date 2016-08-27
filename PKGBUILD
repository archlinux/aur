# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Jesse R. Adams <jesse at techno-geeks dot org>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=mdocml
pkgver=1.13.4
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
md5sums=('797d4f0e112479f8861e03a72f8b8b01')
sha1sums=('e7fd98e898704b8e285da3a3e2c4218694c3a51d')
sha256sums=('0a55c1addb188071d6f784599303656b8465e98ec6b2f4f264e12fb96d79e0ef')

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

