# Maintainer: mrxx <mrxx at cyberhome dot at>

pkgname=speedtest++
_gitname=SpeedTest
pkgver=1.15.r72.b743996
pkgrel=2
pkgdesc="Unofficial speedtest.net cli using raw TCP for better accuracy. Written in C++."
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

prepare() {
  cd "$srcdir/$_gitname"
  # Replace any cmake_minimum_required line with version >= 3.5
  sed -i 's/cmake_minimum_required(VERSION [0-9.]\+)/cmake_minimum_required(VERSION 3.5)/' CMakeLists.txt
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
