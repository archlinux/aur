# Maintainer: Anton Kudelin <kudelin at proton dot me>

pkgname=quickfix-git
_pkgname=quickfix
pkgver=1.15.1.r297.g4e89249a
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
    cmake.patch
    663.patch)
sha256sums=('SKIP'
            '48061022832c0eb44a4d37bc618853a66856f98277aa5a33cfd829d0a0e1891a'
            'bfb6a425c0e3d06dbc7155b2ab0f06284a50bd28b606a659b4dcd5ff3cd1a9e4')
options=(!lto)

pkgver() {
    cd "${_pkgname}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/; s/-/./g'
}

prepare() {
  cd "${_pkgname}"
  patch -p1 < ../663.patch
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
