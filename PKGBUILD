# Maintainer: Oleksandr Chekhovskyi <oleksandr.chekhovskyi@gmail.com>

pkgname=hax
pkgver=0.6.1
pkgrel=1
pkgdesc="Minimalist, terminal-native coding agent written in C"
arch=("x86_64" "aarch64")
url="https://github.com/OleksandrChekhovskyi/hax"
license=("MIT")
depends=("bash" "curl" "glibc" "jansson")
makedepends=("meson" "ninja" "pkgconf")
optdepends=(
    "fzf: @file picker"
    "git: repository context and faster @file candidate listing"
    "less: default pager for the transcript view"
    "wl-clipboard: clipboard support on Wayland"
    "xclip: clipboard support and image paste on X11"
    "xsel: clipboard support on X11"
)
source=("$pkgname-$pkgver.tar.xz::$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=("b46c13187770dfab577cee3b0a77d0c7d62280c715c3b839602ca88a1ae37a1a")

build() {
    arch-meson "$pkgname-$pkgver" build
    meson compile -C build hax
}

check() {
    # Smoke test only. The full suite runs in upstream CI.
    build/hax --version | grep -qx "hax v$pkgver"
}

package() {
    meson install -C build --destdir "$pkgdir" --no-rebuild
    install -Dm644 "$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
