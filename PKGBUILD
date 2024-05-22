# Maintainer: k1f0 <generic at k1f0.mozmail.com>

pkgname=rwpspread-git
pkgver=r354.eea96c5
pkgrel=1
pkgdesc='Multi-Monitor Wallpaper Utility'
arch=('x86_64' 'aarch64')
url='https://github.com/0xk1f0/rwpspread'
license=('GPL-3.0-only')
makedepends=('cargo' 'git' 'gzip')
optdepends=('wpaperd: wallpaper setter backend'
            'swaybg: wallpaper setter backend'
            'hyprpaper: wallpaper setter backend')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${pkgname}"
  cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
  cd "${srcdir}/${pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "${srcdir}/${pkgname}"
  # binary
  install -Dm0755 -t "${pkgdir}/usr/bin" "target/release/${pkgname%-git}"
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
