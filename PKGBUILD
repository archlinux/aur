# Maintainer: Firegem <mrfiregem [at] protonmail [dot] ch>
pkgname=wpaperd-git
pkgver=r49.006ab49
pkgrel=1
pkgdesc='Wallpaper daemon for Wayland.'
arch=('x86_64')
url='https://github.com/danyspin97/wpaperd'
license=('GPL3')
depends=('gcc-libs' 'glibc')
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
  cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
  cd "${srcdir}/${pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
  scdoc < man/wpaperd-output.5.scd > target/release/wpaperd-output.5
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm0755 -t "${pkgdir}/usr/bin" "target/release/${pkgname%-git}"
  install -Dm0644 -t "${pkgdir}/usr/share/man/man5" target/release/wpaperd-output.5
}
