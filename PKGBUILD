# Maintainer: k1f0 <generic at k1f0.mozmail.com>

pkgname=rwpspread
pkgver=0.5.0
pkgrel=1
_patch=""
pkgdesc='Multi-Monitor Wallpaper Utility'
arch=('x86_64' 'aarch64')
url='https://github.com/0xk1f0/rwpspread'
license=('GPL-3.0-only')
makedepends=('cargo' 'git' 'gzip')
optdepends=('wpaperd: wallpaper setter backend'
            'swaybg: wallpaper setter backend'
            'hyprpaper: wallpaper setter backend')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
source=("${pkgname}-${pkgver}${_patch}::${url}/archive/refs/tags/v${pkgver}${_patch}.tar.gz")
b2sums=('46a3f1de39182c80a29cfec67a2704a6eacb1ab19a1f6b14fceb956f929a008a422b550d8ae9f1ff06c280455d8fec3185d715d563ae2c69bc9aedaf9134525e')
options=(!debug)

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
  mv "target/release/completions/${pkgname%-git}.bash" "target/release/completions/${pkgname%-git}"
  install -Dm0644 -t "${pkgdir}/usr/share/bash-completion/completions" "target/release/completions/${pkgname%-git}"
  install -Dm0644 -t "${pkgdir}/usr/share/zsh/site-functions" "target/release/completions/_${pkgname%-git}"
  install -Dm0644 -t "${pkgdir}/usr/share/fish/vendor_completions.d" "target/release/completions/${pkgname%-git}.fish"
  # man page
  gzip "target/release/man/${pkgname%-git}.1"
  install -Dm0644 -t "${pkgdir}/usr/share/man/man1" "target/release/man/${pkgname%-git}.1.gz"
  # license
  install -Dm0644 -t "${pkgdir}/usr/share/licenses/${pkgname%-git}" "LICENSE"
}
