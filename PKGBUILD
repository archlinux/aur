# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=cocogitto-git
pkgver=3.0.0.r2.geaf63bb
pkgrel=1
pkgdesc="Set of CLI tools for the conventional commit and semver specifications (git)"
arch=('x86_64')
url="https://github.com/oknozor/cocogitto"
license=('MIT')
depends=('gcc-libs' 'zlib')
makedepends=('rust' 'git')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=("git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"
  mkdir completions/
  cargo fetch --locked
}

build() {
  cd "${pkgname%-git}"
  cargo build --release --frozen
  for bin in 'cog' 'coco'; do
    "target/release/$bin" generate-completions bash > "completions/$bin.bash"
    "target/release/$bin" generate-completions fish > "completions/$bin.fish"
    "target/release/$bin" generate-completions zsh > "completions/_$bin"
  done
}

#check() {
#  cd "${pkgname%-git}"
#  cargo test --frozen
#}

package() {
  cd "${pkgname%-git}"
  install -Dm 755 "target/release/coco" -t "$pkgdir/usr/bin"
  install -Dm 755 "target/release/cog" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  for bin in 'cog' 'coco'; do
    install -Dm 644 "completions/$bin.bash" "${pkgdir}/usr/share/bash-completion/completions/$bin"
    install -Dm 644 "completions/$bin.fish" -t "${pkgdir}/usr/share/fish/vendor_completions.d"
    install -Dm 644 "completions/_$bin" -t "${pkgdir}/usr/share/zsh/site-functions"
  done
}
