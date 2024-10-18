# Maintainer: k1f0 <generic at k1f0.mozmail.com>

pkgname=rwpspread
pkgver=0.3.1
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
b2sums=('b4d16332deb4e9ea86a30fce774611e648a3f54207dc48f2ebc0b034b89a81bbdea6ac21e4b39c30c2ba4d7b9fb77ec0d85bf327fa3eaf77ce3d69042b31e4d4')

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
