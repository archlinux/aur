# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: Jonathan Dönszelmann <jonabent@gmail.com>

pkgname=pointless
pkgver=1.10.0
pkgrel=1
pkgdesc="An endless drawing canvas desktop app made with Tauri (Rust) and React"
arch=('x86_64')
url="https://github.com/kkoomen/pointless"
license=('GPL-3.0-or-later')
depends=('cairo' 'gcc-libs' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'pango' 'webkit2gtk')
makedepends=('cargo' 'libsoup' 'npm' 'yarn')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "${pkgname}.desktop")
sha256sums=('f7b1713f2ff1f1292fde098b2a8c5edeb4fe7ee1c7e593374262627d67eca959'
            '2c348298c7b16f82ce5c2dd4db87131e427036506f62af8af92d1c84b30644a5')

prepare() {
    cd "${pkgname}-${pkgver}"
    mkdir .git
    yarn install --frozen-lockfile
}

build() {
    cd "${pkgname}-${pkgver}"
    yarn run tauri build --bundles none
}

package() {
    install -Dm644 -t "${pkgdir}/usr/share/applications/" "${pkgname}.desktop"

    cd "${pkgname}-${pkgver}/src-tauri"
    install -Dm755 -t "${pkgdir}/usr/bin/" "target/release/${pkgname}"
    install -Dm644 icons/icon.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
