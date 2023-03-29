# Maintainer: bziemons <ben@rs485.network>
pkgname=chr-editor-git
pkgver=r652.b3a4c07
pkgrel=1
pkgdesc="Console-based editor designed for simplified use like gedit"
arch=("x86_64")
url="https://github.com/istoph/editor"
license=('Boost')
depends=('tuiwidgets-git' 'qt5-base' 'icu' 'gcc-libs')
makedepends=(meson git)
provides=(chr-editor)
conflicts=(chr-editor)
options=(strip)
source=("git+https://github.com/istoph/editor.git"
        "meson-install.patch")
sha512sums=('SKIP'
            '09b695d213523e1774c51d068400c7a6ea6f53c13b184ca3a02884e2c668cf2f221312d61f70a855f2b3793ba72782366684e46faaffbc52be8a36a08618a852')

pkgver() {
    cd "editor"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "editor"
    patch --forward --strip=1 --input="${srcdir}/meson-install.patch"
}

build() {
    arch-meson editor _build
    meson compile -C _build
}

check() {
    meson test -C _build
}

package() {
    DESTDIR="$pkgdir" meson install -C _build

    # install manpages
    install -d "${pkgdir}/usr/share/man/man1/"
    install -pm 644 "${srcdir}/editor/manpages/"* "${pkgdir}/usr/share/man/man1"
}
