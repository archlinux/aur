# Maintainer: Oleksandr Chekhovskyi <oleksandr.chekhovskyi@gmail.com>

pkgname=hax
pkgver=0.6.0
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
sha256sums=("491f4b707840babd4a7748aa85d2bf0ceab131a53f11be8e2aaa489f41ed500f")

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
