# Maintainer: Firegem <mrfiregem [at] protonmail [dot] ch>
pkgname=wpaperd-git
pkgver=r107.c98293b
pkgrel=1
pkgdesc='Wallpaper daemon for Wayland.'
arch=('x86_64')
url='https://github.com/danyspin97/wpaperd'
license=('GPL3')
depends=('libxkbcommon')
makedepends=('cargo' 'scdoc' 'git')
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
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
  cd "${srcdir}/${pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
  scdoc <man/wpaperd-output.5.scd >target/release/wpaperd-output.5
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm0755 -t "${pkgdir}/usr/bin" "target/release/${pkgname%-git}" target/release/wpaperctl
  install -Dm0644 -t "${pkgdir}/usr/share/man/man5" target/release/wpaperd-output.5
}
