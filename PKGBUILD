# Original Author: Firegem <mrfiregem [at] protonmail [dot] ch>
# Maintainer: Rolv Apneseth <rolv.apneseth [at] gmail [dot] com>

pkgname=wpaperd-git
pkgver=r400.7a0fbc9
pkgrel=2
pkgdesc='Wallpaper daemon for Wayland.'
arch=('x86_64')
url='https://github.com/danyspin97/wpaperd'
license=('GPL-3.0-only')
depends=('wayland' 'gcc-libs' 'glibc' 'libglvnd' 'libffi')
makedepends=('cargo' 'scdoc' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+${url}.git")
md5sums=('SKIP')
options=(!debug !lto)

pkgver() {
    cd "${srcdir}/${pkgname}" || exit
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${srcdir}/${pkgname}" || exit
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${srcdir}/${pkgname}" || exit
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
    scdoc <man/wpaperd-output.5.scd >target/release/wpaperd-output.5
}

package() {
    cd "${srcdir}/${pkgname}" || exit
    # Daemon
    install -Dm0755 -t "${pkgdir}/usr/bin" "target/release/${pkgname%-git}"
    # CLI
    install -Dm0755 -t "${pkgdir}/usr/bin" "target/release/wpaperctl"
    # Doc
    install -Dm0644 -t "${pkgdir}/usr/share/man/man5" target/release/wpaperd-output.5
}
