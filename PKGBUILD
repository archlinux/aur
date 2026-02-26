# Maintainer: Anton Kudelin <kudelin at proton dot me>

pkgname=quickfix-git
_pkgname=quickfix
pkgver=1.15.1.r312.g00dd2083
pkgrel=1
pkgdesc="C++ Fix Engine Library"
arch=(x86_64)
url="http://www.quickfixengine.org"
license=('custom:The QuickFIX Software License, Version 1.0')
depends=(python tbb)
optdepends=(mysql postgresql-libs ruby)
conflicts=('quickfix')
provides=("quickfix=$pkgver")
makedepends=(boost python-setuptools swig)
checkdepends=(ruby)
source=("git+https://github.com/quickfix/quickfix.git"
    cmake.patch)
sha256sums=('SKIP'
            'cc6314302a3dc5077ba34041fd9b427049395f306f9e86f7b1f14b7415067ba8')
options=(!lto)

pkgver() {
    cd "${_pkgname}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/; s/-/./g'
}

prepare() {
  cd "${_pkgname}"
  patch -p1 < ../cmake.patch
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
