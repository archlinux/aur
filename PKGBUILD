# Maintainer: Winícius Cota <winicius.cota@gmail.com>
pkgname=lumine-capture-git
_pkgname=lumine-capture
pkgver=0.2.0.r1.g56df4d6
pkgrel=1
pkgdesc='Screenshot and annotation tool for Wayland with built-in OCR (git version)'
arch=(x86_64)
url='https://github.com/Netflate/LumineCapture'
license=('MIT OR Apache-2.0' 'OFL-1.1')
depends=(gcc-libs glibc libpipewire libxkbcommon openssl zlib)
makedepends=(cargo clang git)
provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")
options=(!debug !lto)
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    # the build script downloads the ONNX Runtime it links against
    cargo build --frozen --profile dist
}

package() {
    cd "$pkgname"
    install -Dm755 target/dist/$_pkgname -t "$pkgdir/usr/bin"
    # KWin grants screenshot access by the Exec= path of this file, so it has to be /usr/bin/lumine-capture
    install -Dm644 assets/lumine-capture.desktop -t "$pkgdir/usr/share/applications"

    local icon
    for icon in assets/hicolor/*/apps/*; do
        install -Dm644 "$icon" "$pkgdir/usr/share/icons/${icon#assets/}"
    done

    install -Dm644 LICENSE-MIT LICENSE-APACHE -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 assets/fonts/LICENSE-OFL.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE-OFL-Inter.txt"
    install -Dm644 README.md docs/lumine-capture-shortcuts-kde.kksrc -t "$pkgdir/usr/share/doc/$pkgname"
}
