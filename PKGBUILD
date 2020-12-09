# Maintainer: orhun <orhunparmaksiz@gmail.com>
# Contributor: Rustem B. <rustemb@systemli.org>
# https://github.com/orhun/pkgbuilds

pkgname=sic-image-cli-git
_pkgname=sic
pkgver=0.14.0.r0.g9c0e31f
pkgrel=3
pkgdesc="Accessible image processing and conversion from the terminal (git)"
arch=('x86_64')
url="https://github.com/foresterre/sic"
license=('MIT')
conflicts=("$_pkgname" "${pkgname%-git}")
provides=("${pkgname%-git}")
makedepends=('rust' 'git')
source=("git+${url}"
        "$url/releases/download/v$pkgver/shell_completions.zip")
sha512sums=('SKIP'
            'c3ce7c681c50a4bba8f29cca4f3269b857bd7f5f64b7b84c411fb41d4ff0ace6c06aae760bdcc81be0a750f271bac2cf80f6fc8376d5f3e293d915e2b37d3ecc')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags $(git rev-list --tags --max-count=1) | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"
  cargo build --release --locked --all-features
}

check() {
  cd "$_pkgname"
  cargo test --release --locked
}

package() {
  cd "$_pkgname"
  install -Dm 755 "target/release/$_pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE-MIT -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 LICENSE-APACHE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 "../$_pkgname.bash" "${pkgdir}/usr/share/bash-completion/completions/$_pkgname"
  install -Dm 644 "../$_pkgname.fish" -t "${pkgdir}/usr/share/fish/completions"
  install -Dm 644 "../_$_pkgname" -t "${pkgdir}/usr/share/zsh/site-functions"
}
