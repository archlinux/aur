# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Jesse R. Adams <jesse at techno-geeks dot org>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=mdocml
pkgver=1.14.1
pkgrel=1
pkgdesc="A suite of tools compiling mdoc, the roff macro language and man manuals."
arch=('i686' 'x86_64')
url="http://mdocml.bsd.lv/"
license=('custom: ISC')
options=(staticlibs)
depends=('')
provides=('mandoc')
conflicts=('mandoc')
source=("http://mdocml.bsd.lv/snapshots/$pkgname-$pkgver.tar.gz")
md5sums=('07db67f437ee894e7e4b18b305d53ca1')
sha1sums=('7dd020fed9fc2a0f56835e903c92a5ae8cc89632')
sha256sums=('356954f141ec6f5635e938c826f2e16e4619bb361c64d84a31f6775d030a615b')

prepare() {
  # adapt configuration
  cat << END > $pkgname-$pkgver/configure.local
PREFIX="/usr"
SBINDIR="/usr/bin"
MANDIR="/usr/share/man"
EXAMPLEDIR="/usr/share/mandoc/examples"
BINM_MAN="mman"
BINM_SOELIM="msoelim"
BINM_APROPOS="mapropos"
BINM_WHATIS="mwhatis"
BINM_CATMAN="mcatman"
MANM_MAN="mandoc_man"
MANM_MDOC="mandoc_mdoc"
MANM_ROFF="mandoc_roff"
BUILD_CATMAN=1
# default cflags
$(grep -m1 'CFLAGS=' configure)
# add our cflags
CFLAGS="\${CFLAGS} $CFLAGS"
END
}

build() {
  cd $pkgname-$pkgver
  ./configure
  make -j$(grep -c ^processor /proc/cpuinfo)
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" -j1 install
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

