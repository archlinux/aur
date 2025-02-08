# Maintainer: Charles Dong <chardon_cs@proton.me>

pkgname=ollama-lab
pkgver=0.1.0
pkgrel=1
epoch=
pkgdesc="Yet another (unofficial) Ollama GUI"
arch=('x86_64')
url="https://github.com/chardoncs/ollama-lab"
license=('MIT')
groups=()
depends=(
    'gtk3'
    'sqlite'
    'webkit2gtk-4.1'
)
makedepends=(
    'gtk3'
    'sqlite'
    'webkit2gtk-4.1'

    'rust'
    'cargo'
    'bun'
)
checkdepends=()
optdepends=('ollama')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(
    "https://github.com/chardoncs/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
    'ollama-lab.desktop'
)
noextract=()
sha256sums=(
    'b7326a70f4455fe4a1fabd3aa833328cd0b36ed5c8e71f05315a13210feeb248'
    '539ab77a90f2ff7c3f5cac339e5048625bb1b3bcaa927c20731f0fd8551b0e34'
)
validpgpkeys=()

prepare() {
	cd "$pkgname-$pkgver"

    bun install
}

build() {
	cd "$pkgname-$pkgver"

    CFLAGS+=" -ffat-lto-objects"
    unset CC CXX
    bun run tauri build --no-bundle
}

package() {
    icons=('128x128' '32x32')

    for icon in ${icons[@]}; do
        install -D -m644 -t "$pkgdir/usr/share/icons/hicolor/${icon}/apps/" "$srcdir/$pkgname-$pkgver/src-tauri/icons/${icon}.png"
    done

    install -D -m644 "$srcdir/$pkgname-$pkgver/src-tauri/icons/128x128@2x.png" "$pkgdir/usr/share/icons/hicolor/256x256@2/apps/256x256@2.png"
    install -D -m644 -t $pkgdir/usr/share/applications/ ollama-lab.desktop

    install -D -t $pkgdir/usr/bin/ $srcdir/$pkgname-$pkgver/target/release/$pkgname
}
