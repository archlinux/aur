# Maintainer: k1f0 <generic at k1f0.mozmail.com>

pkgname=rwpspread
pkgver=0.2.6
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
b2sums=('c20456ef8b4b89298ffdd7c973be8b1bbc047987c2706a14f80b06ed426fc2bf118f8e1d99fb55500812d287495b6b08e17acb6930e9da4786ebc9dea0ce3b55')

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
