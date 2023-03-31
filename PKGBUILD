# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Ben <ben@benmazer.net>

pkgname=gmime
pkgver=2.6.23+4+g91dcee38
pkgrel=3
pkgdesc="A C/C++ MIME creation and parser library with support for S/MIME, PGP, and Unix mbox spools"
arch=(x86_64)
license=(GPL)
url="https://github.com/jstedfast/gmime"
depends=(glib2 gpgme zlib)
makedepends=(gtk-sharp-2 gobject-introspection gtk-doc git vala docbook-utils)
_commit=91dcee38ea301463fb9c6bc936f08b9fd1c0969f  # gmime-2-6
source=("git+https://github.com/jstedfast/gmime#commit=$_commit"
        0001-Avoid-non-UTF-8-code.patch)
sha256sums=('SKIP'
            '516e339e92e419f5744abfd9b7608816115cca103727755994356b0984edcb10')

pkgver() {
  cd gmime
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd gmime
  patch -Np1 -i ../0001-Avoid-non-UTF-8-code.patch
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  # get rid of the .wapi errors in fakeroot
  mkdir weird
  export MONO_SHARED_DIR="$PWD/weird"

  cd gmime

  ./configure --prefix=/usr \
    --program-prefix=$pkgname \
    --enable-gtk-doc \
    --enable-mono \
    --enable-smime \
    --disable-static

  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

package() {
  cd gmime
  make DESTDIR="$pkgdir" install
}
