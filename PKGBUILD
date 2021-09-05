# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=jsoncpp-git
pkgver=1.9.4.r34.gc39fbda
pkgrel=2
pkgdesc="C++ library for interacting with JSON"
arch=('i686' 'x86_64')
url="https://github.com/open-source-parsers/jsoncpp"
license=('MIT' 'custom')
depends=('gcc-libs')
makedepends=('git' 'meson' 'python')
provides=('jsoncpp' 'libjsoncpp.so')
conflicts=('jsoncpp')
options=('staticlibs')
source=("git+https://github.com/open-source-parsers/jsoncpp.git")
sha256sums=('SKIP')


pkgver() {
  cd "jsoncpp"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "jsoncpp"

  meson \
    --buildtype=plain \
    --prefix="/usr" \
    --sbindir="bin" \
    --default-library both \
    "_build"
  meson compile -C "_build"
}

check() {
  cd "jsoncpp"

  meson test -C "_build"

  cd "test"
  python "runjsontests.py" ../_build/jsontestrunner
  python "rununittests.py" ../_build/jsoncpp_test
}

package() {
  cd "jsoncpp"

  DESTDIR="$pkgdir" meson install -C "_build"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/jsoncpp"
}
