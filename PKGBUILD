# Maintainer: cohae <cohae@cohae.dev>

pkgname=sharey
pkgver=0.2.0
pkgrel=1
pkgdesc='Modern screen capturing tool'
url='https://codeberg.org/cohae/ShareY'
license=('GPL-2.0-or-later')
makedepends=('git' 'cargo')
depends=('pipewire' 'ffmpeg')
arch=('x86_64')
source=("${pkgname}::git+${url}#tag=v${pkgver}")
sha256sums=('17cf70eb2e4f951b9f807b1a8c439547a38dd60516937682c4e88eaf83e72053')
options=(!lto)

prepare() {
    cd "$srcdir/$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target host-tuple
}

build() {
    cd "$srcdir/$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname" # main executable

    install -Dm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications/" # desktop entry file
    install -Dm644 LICENSE   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" # license
	install -Dm644 "${pkgname}.png"   "${pkgdir}/usr/share/pixmaps/${pkgname}.png" # icon
}
