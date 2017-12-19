# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=avro-c-git
pkgver=20160514
pkgrel=1
pkgdesc="C bindings for Avro data serialization framework"
arch=('i686' 'x86_64')
depends=('jansson' 'snappy' 'xz' 'zlib')
makedepends=('cmake' 'git' 'make' 'pkg-config')
optdepends=('asciidoc: build with documentation'
            'source-highlight: add syntax highlighting to documentation')
url="https://github.com/apache/avro"
license=('Apache')
source=(${pkgname%-git}::git+https://github.com/apache/avro)
sha256sums=('SKIP')
provides=('avro-c')
conflicts=('avro-c')

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short --no-show-signature | sed "s|-||g"
}

build() {
  cd "$srcdir/${pkgname%-git}/lang/c"

  msg2 'Building...'
  mkdir build && cd build
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DTHREADSAFE=true
  make
}

package() {
  cd "$srcdir/${pkgname%-git}/lang/c"

  msg2 'Installing license...'
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/avro-c"

  msg2 'Installing...'
  make DESTDIR="$pkgdir" install -C build/

  msg2 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
