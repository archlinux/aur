# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor:

pkgname=marker-git
pkgver=2018.03.09.r78.g54ba2b64
pkgrel=1
pkgdesc='Markdown editor for linux made with Gtk+-3.0'
arch=('x86_64')
url='https://github.com/fabiocolacio/Marker'
license=('GPL3')
depends=('gtksourceview3' 'gtkspell3' 'webkit2gtk')
makedepends=('git' 'meson')
optdepends=('pandoc: export to HTML, PDF, RTF, OTF, DOCX, LaTeX')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("git+${url}.git"
        'scidown::git+https://github.com/Mandarancio/scidown.git'
        'charter::git+https://github.com/Mandarancio/charter.git'
        'tinyexpr::git+https://github.com/codeplea/tinyexpr.git')
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')

pkgver() {
    cd Marker
    git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
    cd Marker
    git submodule init
    git config submodule.src/scidown.url "$srcdir/scidown"
    git submodule update src/scidown
    cd src/scidown
    git submodule init
    git config submodule.src/charter.url "$srcdir/charter"
    git submodule update src/charter
    cd src/charter
    git submodule init
    git config submodule.src/tinyexpr.url "$srcdir/tinyexpr"
    git submodule update src/tinyexpr
}

build() {
    cd Marker
    meson --prefix=/usr build
    ninja -C build
}

package() {
    cd Marker
    DESTDIR="$pkgdir" ninja install -C build
}
