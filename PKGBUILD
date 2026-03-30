# Maintainer: Marek Küthe <m.k@mk16.de>

_pkgname=libtins
pkgname=libtins-git
pkgver=v4.0.r125.g67c8119
pkgrel=1
pkgdesc="High-level, multiplatform C++ network packet sniffing and crafting library"
arch=('x86_64')
url="https://libtins.github.io/"
license=('BSD-2-Clause')
optdepends=('boost: TCP ACK tracker feature')
depends=('openssl' 'libpcap')
makedepends=('git' 'cmake')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(
  'git+https://github.com/mfontanini/libtins.git'
#  'git+https://github.com/google/googletest.git'
)
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --always | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

# prepare() {
#   cd "$_pkgname"
#   git submodule init
#   git config submodule.googletest.url "$srcdir/googletest"
#   git -c protocol.file.allow=always submodule update
# }

build() {
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DLIBTINS_ENABLE_CXX11=1 -B build -S "$_pkgname"
  cmake --build build
}

# Disable due to https://github.com/mfontanini/libtins/issues/555
# check() {
#   cmake --build build --target tests
#   ctest --test-dir build --output-on-failure
# }

package() {
  DESTDIR="$pkgdir" cmake --install build
}
