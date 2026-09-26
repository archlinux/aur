# Maintainer: Deva Chandra <devachandra@protonmail.com>

_pkgname=zathura-markdown
pkgname=zathura-markdown-git
pkgver=2026.05.10.r3.6589e98
pkgrel=1
pkgdesc="Markdown support for Zathura (cmark + MuPDF backend)"
url="https://github.com/demetrio108/zathura-markdown"
arch=('x86_64')
license=('Zlib')
depends=('cairo' 'cmark' 'girara' 'glib2' 'gumbo-parser' 'jbig2dec'
         'libjpeg-turbo' 'libmupdf' 'openjpeg2' 'openssl' 'zathura')
makedepends=('meson' 'ninja' 'git' 'appstream' 'appstream-glib' 'desktop-file-utils')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/demetrio108/zathura-markdown.git")
sha512sums=('SKIP')

pkgver() {
        cd "${_pkgname}"
        # Use the version declared in meson.build, suffixed with the git revision
        # count and short hash so rebuilds from newer commits bump cleanly.
        local mesonver
        mesonver=$(sed -nE "s/^\s*version:\s*'([^']+)'.*/\1/p" meson.build | head -1)
        printf '%s.r%s.%s' "${mesonver}" \
                "$(git rev-list --count HEAD)" \
                "$(git rev-parse --short HEAD)"
}

build() {
        # AUR helpers keep $srcdir between builds and makepkg only wipes it with
        # -C/--cleanbuild, so a leftover build/ makes ninja report "no work to do"
        # and the previously linked module gets repackaged unchanged. mupdf bumps
        # its SONAME on every point release (libmupdf.so.X.Y), so that stale module
        # then fails to load. Always configure from scratch.
        rm -rf build
        arch-meson "${_pkgname}" build
        ninja -C build
}

package() {
        DESTDIR="${pkgdir}" ninja -C build install
        install -Dm 644 "${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
