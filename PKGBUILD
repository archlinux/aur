# Maintainer: Charles Dong <chardon_cs@proton.me>

pkgname=ollama-lab
pkgver=0.4.1
_version=${pkgver/+/-}
pkgrel=1
epoch=
pkgdesc="Yet another (unofficial) Ollama GUI"
arch=('x86_64')
url="https://github.com/ollama-lab/ollama-lab"
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
options=(!strip !lto)
install=
changelog=
source=(
    "https://github.com/ollama-lab/${pkgname}/archive/refs/tags/v${_version}.tar.gz"
    'ollama-lab.desktop'
)
noextract=()
sha256sums=(
    'e1185444b95be464e17c7a1f89e0399df29805945b1e0cc787d850e91a6e48f1'
    'ca14ad8184e6f04439e3f8484bdffd121dc0e81159de260a1b1da560df2ade49'
)
validpgpkeys=()

prepare() {
	cd "$pkgname-$_version"

    bun install
}

build() {
	cd "$pkgname-$_version"

    bun run tauri build --no-bundle
}

package() {
    icons=('128x128' '32x32')

    for icon in ${icons[@]}; do
        install -D -m644 -t "$pkgdir/usr/share/icons/hicolor/${icon}/apps/" "$srcdir/$pkgname-$_version/src-tauri/icons/${icon}.png"
    done

    install -D -m644 "$srcdir/$pkgname-$_version/src-tauri/icons/128x128@2x.png" "$pkgdir/usr/share/icons/hicolor/256x256@2/apps/256x256@2.png"
    install -D -m644 -t $pkgdir/usr/share/applications/ ollama-lab.desktop

    install -D -t $pkgdir/usr/bin/ $srcdir/$pkgname-$_version/target/release/$pkgname
}
