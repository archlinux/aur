# Maintainer: komagata <komagata@gmail.com>
pkgname=mark-preview-git
_pkgname=mark-preview
pkgver=r1.0000000
pkgrel=1
pkgdesc="Simple Markdown viewer with GFM + KaTeX + Mermaid + highlight.js, built with wxWidgets and cmark-gfm"
arch=('x86_64')
url="https://github.com/komagata/mark-preview"
license=('MIT')
depends=('wxwidgets-gtk3' 'webkit2gtk-4.1' 'cmark-gfm')
makedepends=('git' 'cmake' 'python' 'curl' 'pkgconf')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/$_pkgname"
    # Bundled third-party assets (KaTeX / Mermaid / highlight.js /
    # github-markdown-css) are pulled from jsDelivr at build time and
    # embedded into the binary.
    ./scripts/fetch-assets.sh
}

build() {
    cd "$srcdir/$_pkgname"
    cmake -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build -j"$(nproc)"
}

package() {
    cd "$srcdir/$_pkgname"
    DESTDIR="$pkgdir" cmake --install build
}
