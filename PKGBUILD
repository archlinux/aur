# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: Dongda Li <dongdongbhbh at gmail dot com>
# Contributor: Mark Wagie <mark dot wagie at proton dot me>

pkgname=mindwtr
_name=tech.dongdongbh.mindwtr
pkgver=1.3.9
pkgrel=1
pkgdesc="To-do app built on the Getting Things Done (GTD) method"
arch=('x86_64')
url="https://github.com/dongdongbh/Mindwtr"
license=('AGPL-3.0-only')
depends=('alsa-lib'
         'bzip2'
         'cairo'
         'gdk-pixbuf2'
         'glib2'
         'glibc'
         'gtk3'
         'libgcc'
         'libsoup3'
         'libstdc++'
         'openssl'
         'sqlite'
         'webkit2gtk-4.1')
makedepends=('bun' 'cargo' 'clang' 'cmake' 'node-gyp')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('c9701903217122c800872d3f51973f623f59931a0967921f761eef7ce422df49')

build() {
    cd "${pkgname^}-${pkgver}"
    bun install

    cd apps/desktop
    CFLAGS+=" -ffat-lto-objects"
    CXXFLAGS+=" -ffat-lto-objects"
    export LIBSQLITE3_SYS_USE_PKG_CONFIG=1
    export OPENSSL_NO_VENDOR=1
    bunx tauri build --no-bundle
}

package() {
    cd "${pkgname^}-${pkgver}/apps/desktop/src-tauri"
    install -Dm755 "target/release/${pkgname}" -t "${pkgdir}/usr/bin"
    install -Dm644 icons/icon.png "${pkgdir}/usr/share/pixmaps/${_name}.png"
    install -Dm644 "linux/${_name}.desktop" -t "${pkgdir}/usr/share/applications"
}
