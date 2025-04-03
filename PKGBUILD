# Maintainer: bziemons <ben@rs485.network>
pkgname=chr-editor-git
pkgver=r953.ff621e4
pkgrel=1
pkgdesc="Retro-style terminal-based text editor with desktop-like shortcuts utilizing Tui Widgets and integration with KDE's syntax highlighting engine."
arch=("x86_64")
url="https://github.com/istoph/editor"
license=('Boost')
depends=('tuiwidgets-git' 'qt5-base' 'icu' 'gcc-libs')
makedepends=(meson git)
provides=(chr-editor)
conflicts=(chr-editor)
source=("git+https://github.com/istoph/editor.git")
sha512sums=('SKIP')

# if you want to build chr-editor without syntax highlighting, set CHR_NO_SYNTAX_HIGHLIGHTING to anything
if [[ "${CHR_NO_SYNTAX_HIGHLIGHTING:+1}" != "1" ]]; then
    depends=("${depends[@]}" 'syntax-highlighting5')
    makedepends=("${makedepends[@]}" 'cmake')
    CHR_EXTRA_MESON_ARGS="${CHR_EXTRA_MESON_ARGS:-} -D syntax_highlighting=true"
fi

pkgver() {
    cd "editor"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    arch-meson ${CHR_EXTRA_MESON_ARGS:-} editor _build
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
