# Maintainer:
# Contributor: justanoobcoder <syaorancode@gmail.com>

pkgname=mechvibes
pkgver=3.5.0
pkgrel=1
pkgdesc="A modern mechanical keyboard sound simulator with customizable soundpacks"
arch=('x86_64')
url="https://mechvibes.com/"
license=('MIT')
depends=('alsa-lib'
         'cairo'
         'gdk-pixbuf2'
         'glib2'
         'glibc'
         'gtk3'
         'libgcc'
         'libsoup3'
         'libx11'
         'libxtst'
         'openssl'
         'wayland'
         'webkit2gtk-4.1'
         'xdotool'
         'xz'
         'zstd')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/hainguyents13/mechvibes/archive/v${pkgver}.tar.gz")
sha256sums=('19b41ec4a625d39f283a6274009a0dd159c9a2dabc3b0b6e8ad2c3b2822229bc')

 prepare() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target host-tuple
}

 build() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export ZSTD_SYS_USE_PKG_CONFIG=1
    CFLAGS+=" -ffat-lto-objects"
    cargo build --frozen --release --all-features
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 "target/release/${pkgname}" -t "${pkgdir}/usr/bin"
    install -d "${pkgdir}/usr/lib/${pkgname}" "${pkgdir}/usr/share/${pkgname}"
    cp -r assets "${pkgdir}/usr/lib/${pkgname}"
    cp -r soundpacks "${pkgdir}/usr/share/${pkgname}"
    install -Dm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 assets/icon.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "packaging/linux/${pkgname}.xml" -t "${pkgdir}/usr/share/mime/packages"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
