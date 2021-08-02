# Maintainer: Martin Chang <marty188586@gmail.com>
# Creater: Daniel Mensinger <daniel@mensinger-ka.de>
pkgname=drogon-git
pkgver=1.7.1.c5398b2
pkgrel=1
pkgdesc='A C++14/17 based HTTP web application framework running on Linux/macOS/Unix'
arch=('x86_64')
url='https://github.com/an-tao/drogon'
license=('MIT')
depends=(mariadb postgresql libpqxx sqlite jsoncpp util-linux c-ares hiredis brotli)
makedepends=(cmake git)
checkdepends=()
optdepends=()
provides=(drogon)
conflicts=()
replaces=()
options=()
source=("$pkgname::git+https://github.com/an-tao/drogon.git"
        "trantor::git+https://github.com/an-tao/trantor.git" )
sha256sums=('SKIP' 'SKIP')

prepare() {
  cd "$pkgname"
  git submodule init
  git config submodule.trantor.url $srcdir/trantor
  git submodule update
}

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$pkgname"
  [ -d build ] && rm -rf build
  mkdir build
  cd build
  cmake                         \
    -DCMAKE_BUILD_TYPE=RELEASE  \
    -DCMAKE_INSTALL_PREFIX=/usr \
    ..
	make
}

package() {
	cd "$pkgname/build"
	make DESTDIR="$pkgdir/" install
}
