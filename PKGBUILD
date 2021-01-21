# Maintainer: Darren Ng <$(base64 --decode <<<'ZGFycmVuMTk5NzA4MTBAZ21haWwuY29tCg==')>

pkgname=pe-util-git
pkgver=r19.5b07cb3
pkgrel=1
pkgdesc="List shared object dependencies of a portable executable (PE)"
arch=('x86_64')
url="https://github.com/gsauthof/pe-util"
license=('custom:unknown')
depends=('boost-libs')
makedepends=('git' 'cmake' 'boost')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/gsauthof/pe-util.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  # Git, no tags available
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  git submodule update --init
  mkdir build
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr ..
  make VERBOSE=1
}

package() {
  cd "$srcdir/${pkgname%-git}/build"
  make DESTDIR="$pkgdir/" install
}
