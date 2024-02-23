# Maintainer: Atle Solbakken <atle@goliathdns.no>

pkgname=nghttp3-git
pkgver=r777.36579fd
pkgrel=4
pkgdesc="HTTP/3 library written in C"
arch=('x86_64')
url="https://github.com/ngtcp2/nghttp3"
license=('MIT')
makedepends=('git')
checkdepends=('cunit')
provides=('nghttp3' 'libnghttp3' 'libnghttp3.so')
conflicts=('nghttp3' 'libnghttp3')
source=('git+https://github.com/ngtcp2/nghttp3')
md5sums=('SKIP')

prepare() {
  cd nghttp3

  # Download sfparse
  if [ -d lib/sfparse ]; then
    git submodule update lib/sfparse
    if ! [ -f lib/sfparse/sfparse.h ]; then
      rm -rf lib/sfparse
    fi
  fi
  if ! [ -d lib/sfparse ]; then
    git submodule update --init lib/sfparse
  fi

  # Download munit
  if [ -d tests/munit ]; then
    git submodule update tests/munit
    if ! [ -f tests/munit/munit.h ]; then
      rm -rf tests/munit
    fi
  fi
  if ! [ -d tests/munit ]; then
    git submodule update --init tests/munit
  fi
}

pkgver() {
  cd nghttp3

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd nghttp3

  autoreconf -fisv

  ./configure \
      --prefix=/usr

  make
}

check() {
  cd nghttp3

  make -k check
}

package() {
  cd nghttp3

  make DESTDIR="$pkgdir" install
}
