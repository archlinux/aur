# Maintainer: Oleksandr Chekhovskyi <oleksandr.chekhovskyi@gmail.com>

pkgname=hax
pkgver=0.4.0
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
sha256sums=("449aea6931b85347d2aa6e333bd4b93af8f1b6fafca012e370a3da8a2ab23f26")

# The 0.3.0 tarball describes whatever repository encloses it, stamping this packaging clone's
# commit instead of the release. Capping the search makes git fail, which selects meson's
# fallback. Needed on every meson call: version.h is regenerated on install, and package() runs
# in a separate fakeroot process. Upstream guards this now; drop once a release carries the fix.
build() {
    arch-meson "$pkgname-$pkgver" build
    GIT_CEILING_DIRECTORIES="$srcdir" meson compile -C build
}

check() {
    # Smoke test only. The full suite runs in upstream CI.
    build/hax --version | grep -qx "hax v$pkgver"
}

package() {
    GIT_CEILING_DIRECTORIES="$srcdir" meson install -C build --destdir "$pkgdir"
    install -Dm644 "$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
