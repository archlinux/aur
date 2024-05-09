pkgname=kakoune-git
pkgver=2023.08.05+r366+g8bb0f44c2
pkgrel=1
pkgdesc="Multiple-selection, UNIX-flavored modal editor"
arch=("x86_64" "armv7h")
url="https://github.com/mawww/kakoune"
license=("custom:unlicense")
depends=("gcc-libs")
optdepends=(
    "aspell: spell check, correct text"
    "clang: error reporting and diagnostics, completion"
    "ctags-git: complete and describe a symbol, jump to its definition"
    "editorconfig-core-c: set formatting options project-wide"
    "git: display and cycle through hunks, blame lines, handle file status"
    "kak-lsp: Language Server Protocol (LSP) client"
    "tmux: split windows, spawn tabs"
    "xdotool: X11 window management"
    "xorg-xmessage: print detailed crash information in a separate window"
)
makedepends=(
    "git"
)
provides=("kakoune=${pkgver}")
conflicts=("kakoune")
source=("${pkgname}::git+https://github.com/mawww/kakoune.git")
sha256sums=("SKIP")
options=("!buildflags")

pkgver() {
    cd "${srcdir}/${pkgname}"
    git describe --tags | sed 's/^v//;s/[^-]*-g/r&/;s/-/+/g'
}

check() {
    cd "${srcdir}/${pkgname}"
    make test
}

build() {
    cd "${srcdir}/${pkgname}"
    make
}

package() {
    cd "${srcdir}/${pkgname}"
    make install-strip DESTDIR="${pkgdir}" PREFIX=/usr libexecdir="${pkgdir}"/usr/lib/kak
    install -D UNLICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
