# Maintainer: Anton Kudelin <kudelin at proton dot me>

pkgname=quickfix-git
_pkgname=quickfix
pkgver=1.16.0.r28.g386ce46e
pkgrel=1
pkgdesc="C++ Fix Engine Library"
arch=(x86_64)
url="http://www.quickfixengine.org"
license=('custom:The QuickFIX Software License, Version 1.0')
depends=(python tbb)
optdepends=(mysql postgresql-libs ruby)
conflicts=('quickfix')
provides=("quickfix=$pkgver")
makedepends=(boost cmake python-setuptools swig)
checkdepends=(ruby)
source=("git+https://github.com/quickfix/quickfix.git"
    cmake.patch
    getdatetime-gil.patch)
sha256sums=('SKIP'
            'fdd7b71866f6490100796be9d891df13a92546f2e70c9cf88863688e9b65a2f7'
            '04972d562875f8224861d76791001b3ec2515e0a898a431439dea6fbef88760f')
options=(!lto)

pkgver() {
    cd "${_pkgname}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/; s/-/./g'
}

prepare() {
  cd "${_pkgname}"
  patch -p1 < ../cmake.patch
  patch -p1 < ../getdatetime-gil.patch
  # Regenerate the bindings so the %nothreadallow above takes effect; the
  # committed QuickfixPython.cpp is stale otherwise.
  cd src/python
  ./swig.sh
}

build() {
  cmake -B build -S $_pkgname \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DHAVE_SSL=ON \
      -DHAVE_PYTHON=ON \
      -DHAVE_PYTHON3=ON \
      -DHAVE_POSTGRESQL=ON \
      -DHAVE_MYSQL=ON \
      -DQUICKFIX_EXAMPLES=NO \
      -DQUICKFIX_TESTS=NO \
      -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  # Copying SQL scripts
  install -dm755 "$pkgdir/usr/lib/$_pkgname"
  cd "${_pkgname}"
  cp -r src/sql "$pkgdir/usr/lib/$_pkgname"
  find "$pkgdir/usr/lib/$_pkgname" -name "*.bat" -exec rm {} \;
  chmod -R 755 "$pkgdir/usr/lib/$_pkgname"

  install -Dm644 "LICENSE" \
    -t "$pkgdir/usr/share/licenses/$_pkgname"
} 
