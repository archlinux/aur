# Maintainer: orhun <orhunparmaksiz@gmail.com>
# Contributor: Caleb Maclennan <caleb@alerque.com>
# https://github.com/orhun/pkgbuilds

pkgname=cocogitto-git
pkgver=4.1.0.r2.gcd847de
pkgrel=1
pkgdesc="Set of CLI tools for the conventional commit and semver specifications (git)"
arch=('x86_64')
url="https://github.com/cocogitto/cocogitto"
license=('MIT')
depends=('gcc-libs' 'libgit2' 'libgit2.so' 'zlib')
makedepends=('cargo' 'git')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "${pkgname%-git}"
  cargo build --frozen --release
}

check() {
  cd "${pkgname%-git}"
  # Test suite is not atomic, relies on user environment such as git user configs
  # cargo test --frozen
}

package() {
  cd "${pkgname%-git}"
  for bin in coco cog; do
    local target="target/release/$bin"
    install -Dm0755 -t "$pkgdir/usr/bin/" "$target"
    local gen="$target "
    [[ $bin == coco ]] && gen+='--completion' || gen+='generate-completions'
    $gen bash | install -Dm0644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/$bin"
    $gen fish | install -Dm0644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/$bin.fish"
    $gen zsh |  install -Dm0644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_$bin"
  done
  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
