# Maintainer: aksr <aksr at t-com dot me>
# Maintainer: Caleb Maclennan <caleb@alerque.com

pkgname=grcompiler-git
pkgver=5.2
pkgrel=1
pkgdesc='The SIL Graphite compiler'
arch=('x86_64' 'i686')
url="https://github.com/silnrsi/${pkgname%-git}"
license=('CPL' 'LGPL')
depends=('icu')
makedepends=('cmake' 'docbook-utils' 'git' 'perl-sgmls')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --tags --abbrev=7 --match="v*" HEAD |
    sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$pkgname"
  cmake -S . -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
  make -C build
}

package() {
  cd "$pkgname"
  make -C build DESTDIR="$pkgdir" install
  install -Dm0644 -t "$pkgdir/usr/share/doc/${pkgname%-git}/" README.md
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" license/*.txt
}

