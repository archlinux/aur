# Maintainer: orhun <orhunparmaksiz@gmail.com>
# Maintainer: Skallwar <estblcsk@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=suckit-git
pkgver=0.2.0.r3.g13e9d9f
pkgrel=1
pkgdesc="Recursively visit and download a website's content to your disk (git)"
arch=('any')
url="https://github.com/Skallwar/suckit"
license=('Apache' 'MIT')
depends=('gcc-libs')
makedepends=('rust' 'git')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=("git+${url}"
	"$pkgname-cargo-lock.patch::$url/commit/2a88eacc28d3ade3c88b43f00aceccba36652152.patch")
sha512sums=('SKIP'
            '28bd3770600b74854900f3b9eafae5b83063151568e82affc64d66c76d173d85b36d521504ecfe8a43401f7c888b74c32887332fea64fd60e32b9017ae9b75a9')
options=('!lto')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"
  patch -Np1 -i "../$pkgname-cargo-lock.patch"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "${pkgname%-git}"
  cargo build --release --frozen
}

check() {
  cd "${pkgname%-git}"
  cargo test --frozen
}

package() {
  cd "${pkgname%-git}"
  install -Dm 755 "target/release/${pkgname%-git}" -t "${pkgdir}/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE-MIT -t "$pkgdir/usr/share/licenses/$pkgname"
}
