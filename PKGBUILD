# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: Dongda Li <dongdongbhbh at gmail dot com>
# Contributor: Mark Wagie <mark dot wagie at proton dot me>

pkgname=mindwtr
_name="${pkgname^}"
pkgver=1.3.4
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
sha256sums=('abe4f31dc798e4d2bb7ec24efd1f6b7ecfad3f846d9ef2d409e3dcb7779f0486')

build() {
    cd "${_name}-${pkgver}"
    CFLAGS+=" -ffat-lto-objects"
    CXXFLAGS+=" -ffat-lto-objects"
    export OPENSSL_NO_VENDOR=1
    export LIBSQLITE3_SYS_USE_PKG_CONFIG=1
    bun install
    bun run desktop:build --no-bundle
}

package() {
    cd "${_name}-${pkgver}/apps/desktop/src-tauri"
    install -Dm755 "target/release/${pkgname}" -t "${pkgdir}/usr/bin"
    install -Dm644 icons/icon.png "${pkgdir}/usr/share/pixmaps/tech.dongdongbh.mindwtr.png"
    install -Dm644 linux/tech.dongdongbh.mindwtr.desktop -t "${pkgdir}/usr/share/applications"
}
