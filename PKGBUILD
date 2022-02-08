# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: GordonGR <gordongr@freemail.gr>

pkgname=lib32-libcaca
pkgver=0.99.beta20
pkgrel=1
pkgdesc="Color AsCii Art library (32-bit)"
url="http://caca.zoy.org/wiki/libcaca"
arch=(x86_64)
license=(custom:WTFPL)
depends=(lib32-imlib2 libcaca)
makedepends=(git)
_commit=373c88b9890e67bde91e6acb8f1c442e847d1203
source=("git+https://github.com/cacalabs/libcaca#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd libcaca
  git describe --tags | sed 's/^v//;s/-/+/g'
}

prepare() {
  cd libcaca

  autoreconf -fvi
}

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG="i686-pc-linux-gnu-pkg-config"

  cd libcaca
  ./configure \
    --build=x86_64-pc-linux-gnu \
    --prefix=/usr \
    --libdir=/usr/lib32 \
    --libexecdir=/usr/lib \
    --mandir=/usr/share/man \
    --enable-shared \
    --disable-csharp \
    --disable-cxx \
    --disable-doc \
    --disable-gl \
    --disable-python \
    --disable-slang \
    --disable-static
  make
}

package() {
  cd libcaca
  make DESTDIR="$pkgdir" install

  rm -r "$pkgdir"/usr/{share,include}
  find "$pkgdir/usr/bin" -type f -not -name caca-config -printf 'Removing %P\n' -delete
  mv "$pkgdir"/usr/bin/caca-config{,-32}

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 COPYING
}

# vim:set sw=2 et:
