# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=cocogitto-git
pkgver=4.0.1.r1.gfb4a294
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
  target/release/coco --completion bash > "completions/coco.bash"
  target/release/coco --completion fish > "completions/coco.fish"
  target/release/coco --completion zsh > "completions/_coco"
  target/release/cog generate-completions bash > "completions/cog.bash"
  target/release/cog generate-completions fish > "completions/cog.fish"
  target/release/cog generate-completions zsh > "completions/_cog"
}

check() {
  cd "${pkgname%-git}"
  git config --global user.name "the name"
  git config --global user.email "paul.delafosse@gmail.com"
  cargo test --frozen -- --test-threads=1
}

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
