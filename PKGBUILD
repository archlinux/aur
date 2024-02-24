# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: Jonathan Dönszelmann <jonabent@gmail.com>

pkgname=pointless
pkgver=1.11.0
pkgrel=1
pkgdesc="An endless drawing canvas desktop app made with Tauri (Rust) and React"
arch=('x86_64')
url="https://github.com/kkoomen/pointless"
license=('GPL-3.0-or-later')
depends=('cairo' 'gcc-libs' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'pango' 'webkit2gtk')
makedepends=('cargo' 'libsoup' 'npm' 'yarn')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "${pkgname}.desktop")
sha256sums=('816b4db063d2ef4b127a0908819719fcbac8b8fa15cba2c1d05bf1dd68cd6343'
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
    cd "${pkgname}-${pkgver}/src-tauri"
    install -Dm755 -t "${pkgdir}/usr/bin/" "target/release/${pkgname}"
    install -Dm644 icons/icon.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 -t "${pkgdir}/usr/share/applications/" "${srcdir}/${pkgname}.desktop"
}
