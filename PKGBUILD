# Maintainer:  <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Jean Lucas <jean@4ray.co>

_pkgname=rx
pkgname=${_pkgname}-git
pkgver=r760.18625a6
pkgrel=1
pkgdesc='Extensible Rust-based pixel editor (git)'
arch=("i686" "x86_64" "aarch64")
url="http://cloudhead.io/rx/"
license=('GPL3')
makedepends=('clang' 'cargo' 'cmake' 'libxcursor' 'xorg-xinput' 'git')
source=(git+https://github.com/cloudhead/rx)
sha512sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
 	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${_pkgname}"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

	cd "${_pkgname}"
  cargo build --frozen --release
}

package() {
  install -Dm755 -t "${pkgdir}/usr/bin" "${_pkgname}/target/release/${_pkgname}"
  install -Dm644 -t "${pkgdir}/usr/share/applications" "${_pkgname}/${_pkgname}.desktop"
  install -Dm644 -t "${pkgdir}/usr/share/pixmaps" "${_pkgname}/${_pkgname}.png"
  install -Dm644 -t "${pkgdir}/usr/share/icons/hicolor/128x128/apps" "${_pkgname}/${_pkgname}.png"
}

