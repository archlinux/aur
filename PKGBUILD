# Maintainer: orhun <orhunparmaksiz@gmail.com>
pkgname=kmon-git
pkgver=v0.3.1.r0.g5fd5ae1
pkgrel=1
pkgdesc="Linux kernel manager and activity monitor (git)"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/orhun/kmon"
license=('GPL3')
depends=('libxcb')
makedepends=('cargo' 'git')
provides=("${pkgname%-git}")
conflicts=("$pkgname" "${pkgname}-git" "${pkgname}-bin")
source=('git://github.com/orhun/kmon.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname%-git}"
  cargo build --release --locked --all-features
}

check() {
  cd "${pkgname%-git}"
  cargo test --release --locked
}

package() {
  cd "${pkgname%-git}"
  install -Dm 755 "target/release/${pkgname%-git}" -t "${pkgdir}/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/${pkgname%-git}"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname%-git}"
  install -Dm 644 "man/${pkgname%-git}.8" -t "$pkgdir/usr/local/man/man8"
  gzip "$pkgdir/usr/local/man/man8/${pkgname%-git}.8"
}