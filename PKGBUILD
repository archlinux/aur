# Maintainer: Oleksandr Chekhovskyi <oleksandr.chekhovskyi@gmail.com>

pkgname=hax
pkgver=0.3.0
pkgrel=2
pkgdesc="Minimalist, terminal-native coding agent written in C"
arch=("x86_64" "aarch64")
url="https://github.com/OleksandrChekhovskyi/hax"
license=("MIT")
depends=("bash" "curl" "glibc" "jansson")
makedepends=("meson" "ninja" "pkgconf")
checkdepends=("python")
optdepends=(
    "fzf: @file picker"
    "git: repository context and faster @file candidate listing"
    "less: default pager for the transcript view"
    "wl-clipboard: clipboard support on Wayland"
    "xclip: clipboard support and image paste on X11"
    "xsel: clipboard support on X11"
)
source=("$pkgname-$pkgver.tar.xz::$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=("5fa25dcb71bb462436b33f0272346745973c0c33fc614ca8683627e97432b6aa")

# The 0.3.0 tarball describes whatever repository encloses it, stamping this packaging clone's
# commit instead of the release. Capping the search makes git fail, which selects meson's
# fallback. Needed on every meson call: version.h is regenerated on install, and package() runs
# in a separate fakeroot process. Upstream guards this now; drop once a release carries the fix.
build() {
    arch-meson "$pkgname-$pkgver" build
    GIT_CEILING_DIRECTORIES="$srcdir" meson compile -C build
}

check() {
    GIT_CEILING_DIRECTORIES="$srcdir" meson test -C build --print-errorlogs
    # The version is stamped from the build environment; check what this build produced.
    build/hax --version | grep -qx "hax v$pkgver"
}

package() {
    GIT_CEILING_DIRECTORIES="$srcdir" meson install -C build --destdir "$pkgdir"
    install -Dm644 "$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
