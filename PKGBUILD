# Maintainer: bziemons <ben@rs485.network>
pkgname=chr-editor-git
pkgver=r497.fbb59e3
pkgrel=1
pkgdesc="Console-based editor designed for simplified use like gedit"
arch=("x86_64")
url="https://github.com/istoph/editor"
license=('Boost')
depends=(tuiwidgets-git 'qt5-base' 'icu' 'gcc-libs')
makedepends=(meson git)
provides=(chr-editor)
conflicts=(chr-editor)
options=(!strip)
source=("git+https://github.com/istoph/editor.git"
        "meson-install.patch")
sha512sums=('SKIP'
            '10f3b013970d7e82f885facd4d666251ed1f0df35ee50d746ff9c5c3a91db92fd43a60deac50e1c376291236a3798630923d81e880bb4aea2c50511ef06545dd')

pkgver() {
    cd "editor"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "editor"
    patch --forward --strip=1 --input="${srcdir}/meson-install.patch"
}

build() {
    meson setup --prefix /usr --buildtype=plain --wrap-mode nodownload -Db_lot=true -Db_pie=true -Ddefault_library=static editor _build
    meson compile -C _build

    # install manpages
}

check() {
    meson test -C _build
}

package() {
    DESTDIR="$pkgdir" meson install -C _build
    install -d "${pkgdir}/usr/share/man/man1/"
    install -pm 644 "${srcdir}/editor/manpages/"* "${pkgdir}/usr/share/man/man1"
}
