# Maintainer: Kevin MacMartin <prurigro@gmail.com>

_pkgname=tidy-html5
pkgname=$_pkgname-bbatsche
pkgver=20140907.r122.3b68968
pkgrel=2
pkgdesc='Experimental fork of Tidy for HTML5 documents (bbatsche fork)'
url='https://github.com/bbatsche/tidy-html5'
license=('custom')
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
depends=('glibc')
makedepends=('git')
provides=('tidyhtml')
replaces=('tidyhtml')
conflicts=('tidyhtml')

source=('git+https://github.com/bbatsche/tidy-html5.git')
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname
  printf "%s.r%s.%s" "$(git show -s --format=%ci master | sed 's/\ .*//g;s/-//g')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  # This configures the Makefile's install location, which doesn't respond to DESTDIR
  sed -i 's|/usr/local|'"$pkgdir"'/usr|g' ${_pkgname}/build/gmake/Makefile
}

build() {
  cd $_pkgname

  # Build tidy command line tool
  make -C build/gmake/

  # Build libtidy shared library
  sh build/gnuauto/setup.sh
  ./configure \
    --prefix=/usr \
    --mandir=/usr/share/man/man1
  make
}

package() {
  cd $_pkgname

  # Install tidy command line tool
  make DESTDIR="$pkgdir" install -C build/gmake/

  # Install the libtidy shared library
  make DESTDIR="$pkgdir" install

  # Fix manpage location
  install -d "$pkgdir"/usr/share/man/man1
  mv "$pkgdir"/usr/man/man1/tidy.1 "$pkgdir"/usr/share/man/man1/tidy.1
  rmdir "$pkgdir"/usr/man{/man1,}

  # Install the license
  install -Dm644 license.html "$pkgdir"/usr/share/licenses/$pkgname/license.html

  # Install the documentation
  for doc in index.html README.html quickref.html tidy.css; do
    install -Dm644 $doc "$pkgdir"/usr/share/doc/$_pkgname/$doc
  done
}
