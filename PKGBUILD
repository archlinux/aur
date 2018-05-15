# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=eredis-git
pkgver=20180203
pkgrel=1
pkgdesc="C client library built over Hiredis"
arch=('i686' 'x86_64')
depends=('libev')
makedepends=('cmake' 'git' 'make')
url="https://github.com/EulerianTechnologies/eredis"
license=('BSD')
source=(git+https://github.com/EulerianTechnologies/eredis)
sha256sums=('SKIP')
provides=('eredis')
conflicts=('eredis')

# half of available processing units or one if only one is available
_nproc=$(($(nproc)/2))
[[ ${_nproc} < 1 ]] && _nproc=1

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short --no-show-signature | sed "s|-||g"
}

prepare() {
  cd ${pkgname%-git}

  msg2 'Fetching submodules...'
  git submodule update --init
}

build() {
  cd ${pkgname%-git}

  msg2 'Building...'
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    .
  make -j$_nproc
}

package() {
  cd ${pkgname%-git}

  msg2 'Installing license...'
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname%-git}"

  msg2 'Installing documentation...'
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/${pkgname%-git}"

  msg2 'Installing...'
  make DESTDIR="$pkgdir" install
}
