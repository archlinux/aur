# Maintainer: Adam Fontenot <adam.m.fontenot@gmail.com>
# Contributor: Dušan Simić <dusan.simic1810@gmail.com>
# Contributor: Philip Goto <philip.goto@gmail.com>

pkgname=crosswords
pkgver=0.3.13.3
pkgrel=4
pkgdesc='Crossword player and editor for GNOME'
arch=(x86_64 aarch64)
url='https://gitlab.gnome.org/jrb/crosswords'
license=(GPL-3.0-or-later)
depends=(
    dconf
    cairo
    gdk-pixbuf2
    glib2
    graphene
    gtk4
    hicolor-icon-theme
    json-glib
    libadwaita
    libipuz
    librsvg
    pango
    python-beautifulsoup4
    python-lxml
    python-puzpy
    python-regex
)
makedepends=(glib2-devel meson)
source=("${url}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz"
        "${url}/-/commit/b4689c2426cf24e944f8ae419ed23f1969745995.patch"
        "${url}/-/commit/3891aecfe538864cfc31561d21ccbcd007a94d2d.patch"
        "${url}/-/commit/5d0807d013aa492f07c6e2542e82102183c365b4.patch"
        "${url}/-/commit/7aa9f6da72c2821a467989a8458e5b204184598e.patch")
sha256sums=('7ca253695842c32e3355ebac3392b3070a747d8bb6eaf53e20c4096fa6c98a65'
            'c9b5ae319784b1c217b87775eab8d064d7ce4e7dcb37bbfa3a2081e76b2d231a'
            '98d13c615b0a2a953357c621163cea4602ce97a29f307cd6ea99334e4929a4f4'
            'b30d201bd479f1215d37e4e029dd8ff4292d3facfeb9eb6d2cdf2f2e54669c15'
            '3f1acb61e002ed59d80e3ae90c56dd5bea188753d044dbbb97b287a3b872fa81')

prepare() {
    # Fix race condition in build with upstream patch
    cd "${pkgname}-${pkgver}"
    patch -p1 < "${srcdir}/3891aecfe538864cfc31561d21ccbcd007a94d2d.patch"
    patch -p1 < "${srcdir}/b4689c2426cf24e944f8ae419ed23f1969745995.patch"

    # Broken build caused by invalid JSON strings
    patch -p1 < "${srcdir}/7aa9f6da72c2821a467989a8458e5b204184598e.patch"

    # Don't fail in convertor when dependencies we don't need are missing
    patch -p1 < "${srcdir}/5d0807d013aa492f07c6e2542e82102183c365b4.patch"
}

build() {
    arch-meson ${pkgname}-${pkgver} build -Ddevelopment=false
    meson compile -C build
}

# requires creation of runtime dbus files, doesn't work in container / rua
#check() {
#    meson test -C build --print-errorlogs
#}

package() {
    meson install -C build --destdir "${pkgdir}"
}
