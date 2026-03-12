# Maintainer: Andreas Wendleder <gonsolo@gmail.com>

pkgname=gonzales-git
_pkgname=gonzales
pkgver=v0.2.r70.gd25c8e9
pkgrel=1
pkgdesc="High-performance Swift path tracer"
arch=('x86_64')
url="https://github.com/gonsolo/gonzales"
license=('GPL3')
depends=('swift-bin' 'embree' 'openimageio' 'ptex' 'zlib')
makedepends=('git' 'make' 'pkg-config')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  # This generates a version string like: 0.2.0.r1100.g5e4d3c2
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"
  echo "--- Building Release Binary ---"
  make release
}

check() {
  cd "$_pkgname"
  echo "--- Running Optimized Tests ---"
  # Try release tests first, fallback to standard tests
  make test_release || make test
}

package() {
  cd "$_pkgname"

  # Install the binary
  install -Dm755 .build/release/gonzales "$pkgdir/usr/bin/gonzales"

  # Install documentation
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

  # Optional: Install license if it's in the repo (usually required for GPL)
  if [ -f LICENSE ]; then
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  fi
}
