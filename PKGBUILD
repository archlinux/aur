# Maintainer: Ernesto Cruz <ernestobritocruz05@gmail.com>
pkgname=packet-term
pkgver=0.1.0
pkgrel=1
pkgdesc="A terminal multiplexer and broadcast system for network engineers with GNS3/EVE-NG integration"
arch=('x86_64')
url="https://github.com/ernestoCruz05/packet"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'openssl' 'libssh2' 'cairo' 'gdk-pixbuf2' 'glib2' 'hicolor-icon-theme' 'pango')
makedepends=('rust' 'cargo' 'nodejs' 'npm' 'pkgconf')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('8b1d568be734cb2f37acdf0f2ee8c27d37c108351be90a7c53147453e89d07c9')

prepare() {
    cd "packet-$pkgver"
    npm install
}

build() {
    cd "packet-$pkgver"
    export LIBSSH2_SYS_USE_PKG_CONFIG=1
    npx tauri build -b deb
}

package() {
    cd "packet-$pkgver"
    # Extract from deb bundle - Tauri packages everything correctly there
    cp -a src-tauri/target/release/bundle/deb/packet_${pkgver}_*/data/* "${pkgdir}"
}
