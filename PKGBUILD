# Maintainer: Firegem <mrfiregem [at] protonmail [dot] ch>
pkgname=wpaperd
pkgver=0.3.0
pkgrel=1
pkgdesc='Wallpaper daemon for Wayland.'
arch=('x86_64')
url='https://github.com/danyspin97/wpaperd'
license=('GPL3')
depends=('libxkbcommon')
makedepends=('cargo' 'scdoc')
provides=("${pkgname}")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('41b2b15a32abe724ff10f59c51ae5f2440040334e3494994258bd5c43023333f')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
  scdoc <man/wpaperd-output.5.scd >man/wpaperd-output.5
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  # executable
  install -Dm0755 -t "${pkgdir}/usr/bin/" "target/release/${pkgname}"
  # man pages
  install -Dm0644 -t "${pkgdir}/usr/share/man/man1" man/wpaperd.1
  install -Dm0644 -t "${pkgdir}/usr/share/man/man5" man/wpaperd-output.5
  # completion
  install -Dm0644 completions/${pkgname}.bash "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
  install -Dm0644 -t "${pkgdir}/usr/share/fish/vendor_completions.d" completions/${pkgname}.fish
  install -Dm0644 -t "${pkgdir}/usr/share/zsh/site-functions" completions/_${pkgname}
  install -Dm0644 -t "${pkgdir}/usr/share/elvish/completions" completions/${pkgname}.elv
}
