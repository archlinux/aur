# Maintainer: Lukas Probsthain <lukas.probsthain@google.com>
pkgdesc="A GUI for Modem-Manager. Build from source with patches."
url='https://linuxonly.ru/page/modem-manager-gui/'

pkgname='modem-manager-gui-hg'
_pkgname="${pkgname%-hg}"
pkgver=r85+.3f6d6c4ee74c+
arch=('x86_64')
pkgrel=3
license=('GPL-3.0-or-later')

conflicts=(modem-manager-gui)
provides=(modem-manager-gui)

makedepends=(
    mercurial
    po4a
    itstool
)

depends=(
    libayatana-appindicator
    gtk3
    glib2
    gdbm
    gtkspell3
    python
    cairo
    hicolor-icon-theme
    gdk-pixbuf2
)

optdepends=(
)

source=("${_pkgname}::hg+http://hg.code.sf.net/p/modem-manager-gui/code"
    "fix_notification_segfault.patch"
    "fix_segfault_on_DNS_entries.patch")

sha256sums=('SKIP'
    '593ba269cef6168c14e4bdd5098753b3603a78fe702cd20bd634cdd213198114'
    '2a21a7ab4ae78e4296a28e46a337eee042a8d7855a8af5d116ebcfcd989e9892'
)

pkgver() {
    cd "${_pkgname}"
    printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

prepare() {
    cd "${_pkgname}"
    patch --forward --strip=1 --input="${srcdir}/fix_segfault_on_DNS_entries.patch"
    patch --forward --strip=1 --input="${srcdir}/fix_notification_segfault.patch"
}

build() {
    cd "${_pkgname}"
    #meson build
    #cd build
    #ninja
    sh configure
    make
}


package() {
    cd "${_pkgname}"
    make DESTDIR="${pkgdir}" install

    cd "$pkgdir/usr/lib"
    rmdir -p "ofono/plugins" || true
}
