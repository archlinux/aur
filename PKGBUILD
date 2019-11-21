# Maintainer: mrxx <mrxx at cyberhome dot at>

pkgname=speedtest++
_gitname=SpeedTest
pkgver=1.14.r65.262daf8
pkgrel=1
pkgdesc="Unofficial speedtest.net cli using raw TCP for better accuracy"
arch=('any')
url="https://github.com/taganaka/SpeedTest"
license=('MIT')
depends=('curl' 'openssl' 'libxml2')
makedepends=('git' 'cmake')
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd "${_gitname}"
  local maj=$(grep -m 1 VERSION_MAJOR CMakeLists.txt |sed 's/[^0-9]*//g')
  local min=$(grep -m 1 VERSION_MINOR CMakeLists.txt |sed 's/[^0-9]*//g')
  printf "%s.%s.r%s.%s" $maj $min "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  mkdir -p build
  cd build
  cmake "$srcdir/${_gitname}" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "$srcdir/build"
  make DESTDIR="$pkgdir" install
  ln -s "/usr/bin/SpeedTest" "$pkgdir/usr/bin/speedtest++"
  install -Dm644 "$srcdir/${_gitname}/README.md" "${pkgdir}/usr/share/doc/${_gitname}/README"
}
