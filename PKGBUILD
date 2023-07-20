# Maintainer: Helle Vaanzinn <glitsj16@riseup.net>

_pkgname=sniffnet
pkgname=${_pkgname}-glow
pkgver=1.2.1
pkgrel=1
pkgdesc="Application to comfortably monitor your network traffic - glow renderer branch"
arch=(x86_64)
url="https://github.com/GyulyVGC/sniffnet"
license=('Apache' 'MIT')
depends=(
    alsa-lib
    fontconfig
    freetype2
    glibc
    libpcap
)
makedepends=(
    cargo
    git
)
provides=("$_pkgname")
conflicts=("$_pkgname")
install=${_pkgname}.install
options=(!lto)
source=("${_pkgname}::git+${url}.git#branch=glow-renderer"
    build.patch)
b2sums=('SKIP'
        'e3504d0dab24225c116ff94052428e6bb55378434c2ef368d031fc41fe379b1a6ada1f984846c5a0c760055a83ac99dbde67f2f1d250378d52146f5721f7792c')

prepare() {
	cd "$_pkgname"
    # patches
    for _patch in ../*.patch; do
        patch -Np1 -i "$_patch"
    done
	cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$_pkgname"
	cargo build --frozen --release
}

package() {
	cd "$_pkgname"
	install -Dm 755 target/release/${_pkgname} -t "$pkgdir"/usr/bin
	install -Dm 644 README.md -t "$pkgdir"/usr/share/doc/${_pkgname}
	install -Dm 644 resources/logos/raw/icon.png "$pkgdir"/usr/share/pixmaps/${_pkgname}.png
	install -Dm 644 resources/packaging/LICENSE -t "$pkgdir"/usr/share/licenses/${pkgname}
	install -Dm 644 resources/packaging/linux/${_pkgname}.desktop -t "$pkgdir"/usr/share/applications
}
