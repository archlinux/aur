# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Jesse R. Adams <jesse at techno-geeks dot org>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=mdocml
pkgver=1.14.3
pkgrel=1
pkgdesc="A suite of tools compiling mdoc, the roff macro language and man manuals."
arch=('i686' 'x86_64')
url="http://mdocml.bsd.lv/"
license=('custom: ISC')
options=(staticlibs)
depends=('')
provides=('mandoc')
conflicts=('mandoc')
source=("http://mdocml.bsd.lv/snapshots/mandoc-$pkgver.tar.gz")
md5sums=('3d49ca1eb15b49b5d15c708027fd27c9')
sha1sums=('25b3c97f6346a2722964279c9effab314c1e57cf')
sha256sums=('0b0c8f67958c1569ead4b690680c337984b879dfd2ad4648d96924332fd99528')

prepare() {
  # adapt configuration
  cat << END > mandoc-$pkgver/configure.local
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
  cd mandoc-$pkgver
  ./configure
  make -j$(grep -c ^processor /proc/cpuinfo)
}

package() {
  cd mandoc-$pkgver
  make DESTDIR="$pkgdir" -j1 install
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

