# Maintainer: Lars Hagström <lars@foldspace.nu>
# Contributor: Nephyrin Zey <nephyrin@doublezen.net>
# Contributor: John Schoenick <john@pointysoftware.net>
# Contributor: Geoffrey Teale <tealeg@googlemail.com>
pkgname=google-breakpad-svn
pkgver=r1479
pkgrel=1
epoch=1 # Due to pre-VCS version not including the 'r'
pkgdesc="An open-source multi-platform crash reporting system"
arch=('i686' 'x86_64' 'armv7h')
url="http://code.google.com/p/google-breakpad/"
license=('BSD')
makedepends=('subversion')
depends=('gcc-libs')
options=('staticlibs' '!strip')

source=("google-breakpad-svn::svn+https://google-breakpad.googlecode.com/svn/trunk")
sha1sums=('SKIP')

pkgver() {
  cd "$pkgname"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

build() {
  cd "$srcdir"

  rm -rf "${pkgname}-build"
  svn export "$pkgname" "${pkgname}-build"
  cd "${pkgname}-build"

  msg2 "Running autotools"
  autoreconf -v --force --install
  msg2 "Configuring"
  ./configure --prefix=/usr
  msg2 "Building"
  make
}

package() {
  cd "$srcdir/${pkgname}-build"
  make DESTDIR="$pkgdir" install
  install -dm755 "${pkgdir}/usr/include/breakpad/client/linux/dump_writer_common/"
  install -Dm644 src/client/linux/dump_writer_common/*.h "${pkgdir}/usr/include/breakpad/client/linux/dump_writer_common/"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
