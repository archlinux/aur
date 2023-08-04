# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=dysk-git
pkgver=2.7.2.r1.gae75076
pkgrel=1
pkgdesc="Get information on your mounted filesystems"
arch=('x86_64')
url="https://github.com/Canop/dysk"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'git')
replaces=('lfs-git')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=("git+${url}")
sha512sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"
  cargo fetch --locked
}

build() {
  cd "${pkgname%-git}"
  cargo build --release --frozen
}

package() {
  cd "${pkgname%-git}"
  install -Dm 755 "target/release/${pkgname%-git}" -t "${pkgdir}/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  out_dir=$(find target -type f -name "${pkgname%-git}.bash" -exec dirname {} \;)
  install -Dm 644 "$out_dir/${pkgname%-git}.bash" "$pkgdir/usr/share/bash-completion/completions/${pkgname%-git}"
  install -Dm 644 "$out_dir/${pkgname%-git}.fish" "$pkgdir/usr/share/fish/vendor_completions.d/${pkgname%-git}.fish"
  install -Dm 644 "$out_dir/_${pkgname%-git}" "$pkgdir/usr/share/zsh/site-functions/_${pkgname%-git}"
  install -Dm 644 "$out_dir/${pkgname%-git}.1" -t "$pkgdir/usr/share/man/man1"
}
