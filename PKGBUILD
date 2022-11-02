# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=release-plz-git
pkgver=0.2.21.r0.g87507c3
pkgrel=1
pkgdesc="Release Rust packages without using the command line (git)"
arch=('x86_64')
url="https://github.com/MarcoIeni/release-plz"
license=('MIT' 'Apache')
depends=('gcc-libs' 'curl')
makedepends=('cargo' 'git')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=("git+${url}"
	"$pkgname-$pkgver-fix-args.patch::$url/commit/d92659803c82e9ebcad623d2702e71aa0ed1c9e2.patch")
sha512sums=('SKIP'
            'c347d3a43b77a77c14af992ffb661f2cc55b5095d2844d164405b22e4d93a65f277885c0afe9f590e3b88b588b5cba109a298abf06c5cdd0392e49e4154efb87')
options=('!lto')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags --match "${pkgname%-git}-v*" | sed 's/^.*v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"
  patch -Np1 -i "$srcdir/$pkgname-$pkgver-fix-args.patch"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
  mkdir completions
}

build() {
  cd "${pkgname%-git}"
  cargo build --release --frozen
  local compgen="target/release/${pkgname%-git} generate-completions"
  $compgen bash > "completions/${pkgname%-git}"
  $compgen fish > "completions/${pkgname%-git}.fish"
  $compgen zsh  > "completions/_${pkgname%-git}"
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
  install -Dm 644 "completions/${pkgname%-git}" -t "$pkgdir/usr/share/bash-completion/completions/"
  install -Dm 644 "completions/${pkgname%-git}.fish" -t "$pkgdir/usr/share/fish/vendor_completions.d/"
  install -Dm 644 "completions/_${pkgname%-git}" -t "$pkgdir/usr/share/zsh/site-functions/"
}
