# Maintainer: absrdspc <repom2@riseup.net>
pkgname=arc_unpacker-git
_pkgname=arc_unpacker
pkgver=r2426.b9843a13
pkgrel=1
pkgdesc="CLI tool for extracting images and sounds from visual novels."
arch=(x86_64)
url="https://github.com/vn-tools/arc_unpacker"
license=('GPL')
depends=('boost-libs' 'libpng' 'libjpeg-turbo' 'openssl')
optdepends=('libwebp')
makedepends=('boost' 'cmake')
provides=('arc_unpacker-git' 'arc_unpacker')
conflicts=('arc_unpacker')
source=("$pkgname::git+https://github.com/vn-tools/arc_unpacker.git"
        'catch.hpp::https://raw.githubusercontent.com/catchorg/Catch2/v2.13.4/single_include/catch2/catch.hpp'
        'lcg.patch'
        'etc.patch')
sha256sums=('SKIP'
            '6e0fa3dd160891a01c1f3b34e8bcd6e0140abe08eca022e390027f27dec2050b'
            '37f3c1f1969ec9ed537a5cff79e3eb712fb2f317fcf99508eaa8bb250104a003'
            'e8c02f338aca81df79f6d5c0e302322abd776b2aeb36eb0a57ee93335c0da216')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$pkgname"
  # fix sources path
  sed -i "s|\/\.\.\/|\/|g" CMakeLists.txt
  # fix etc/ path
  git apply "$srcdir/etc.patch"
  # fix logic_error
  git apply "$srcdir/lcg.patch"
  # fix tests
  cp "$srcdir/catch.hpp" tests/test_support/catch.h
}

build() {
  cd "$pkgname"
  cmake -DCMAKE_INSTALL_PREFIX=/usr/bin/ -DCMAKE_BUILD_TYPE=Release .
  make
}

check() {
  cd "$pkgname"
  env _ARC_UNPACKER_TESTS=1 ./run_tests
}

package() {
  cd "$srcdir/$pkgname/"
  install -D -m 755 ${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
  mkdir -p ${pkgdir}/usr/share/${_pkgname}
  cp -r etc ${pkgdir}/usr/share/${_pkgname}
}
