# Maintainer: k1f0 <generic at k1f0.mozmail.com>

pkgname=rwpspread
pkgver=0.2.2
pkgrel=1
_patch=""
pkgdesc='Multi-Monitor Wallpaper Utility'
arch=('x86_64')
url='https://github.com/0xk1f0/rwpspread'
license=('GPL3')
makedepends=('cargo' 'git' 'gzip')
optdepends=('wpaperd: wallpaper setter backend'
            'swaybg: wallpaper setter backend'
            'hyprpaper: wallpaper setter backend')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
source=("${pkgname}-${pkgver}${_patch}::${url}/archive/refs/tags/v${pkgver}${_patch}.tar.gz")
b2sums=('63e974614cd1a3e633f58a47c06cf40e73e726bfff4a6bc432726d19366af77d14e11dc559fd68763ae652d8ac9593ded7c76a72a320e5c8a1f1f1cd4a8cc4bf')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}${_patch}"
  cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}${_patch}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}${_patch}"
  # binary
  install -Dm0755 -t "${pkgdir}/usr/bin" "target/release/${pkgname}"
  # shell completions
  mv "completions/${pkgname%-git}.bash" "completions/${pkgname%-git}"
  install -Dm0644 -t "${pkgdir}/usr/share/bash-completion/completions" "completions/${pkgname%-git}"
  install -Dm0644 -t "${pkgdir}/usr/share/zsh/site-functions" "completions/_${pkgname%-git}"
  install -Dm0644 -t "${pkgdir}/usr/share/fish/vendor_completions.d" "completions/${pkgname%-git}.fish"
  # man page
  gzip "man/${pkgname%-git}.1"
  install -Dm0644 -t "${pkgdir}/usr/share/man/man1" "man/${pkgname%-git}.1.gz"
  # license
  install -Dm0644 -t "${pkgdir}/usr/share/licenses/${pkgname%-git}" "LICENSE"
}
