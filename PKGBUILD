# Maintainer: orhun <orhunparmaksiz@gmail.com>
# Contributor: Caleb Maclennan <caleb@alerque.com>
# https://github.com/orhun/pkgbuilds

pkgname=cocogitto-git
_pkgname=cog
pkgver=6.0.1.r0.gf818bf2
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
  mkdir {completions,man}
}

build() {
  cd "${pkgname%-git}"
  cargo build --frozen --release
  local compgen="target/release/$_pkgname generate-completions"
  local mangen="target/release/$_pkgname generate-manpages"
  $compgen bash > "completions/$_pkgname"
  $compgen fish > "completions/$_pkgname.fish"
  $compgen zsh  > "completions/_$_pkgname"
  $mangen man/
}

check() {
  cd "${pkgname%-git}"
  # Test suite is not atomic, relies on user environment such as git user configs
  # cargo test --frozen
}

package() {
  cd "${pkgname%-git}"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_pkgname"
  install -Dm0644 -t "$pkgdir/usr/share/bash-completion/completions/" "completions/$_pkgname"
  install -Dm0644 -t "$pkgdir/usr/share/fish/vendor_completions.d/" "completions/$_pkgname.fish"
  install -Dm0644 -t "$pkgdir/usr/share/zsh/site-functions/" "completions/_$_pkgname"
  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
  install -Dm0644 -t "$pkgdir/usr/share/man/man1" man/*.1
}
