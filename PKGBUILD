# Maintainer: Damian "G'lek" Mulligan <glek@glektarssza.com>
# Contributor: tobias <tobias@archlinux.org>

# shellcheck shell=bash
# shellcheck disable=SC2034,SC2154,SC2164

pkgname='gtk-sharp-2'
pkgver='2.12.45'
pkgrel='8'
pkgdesc='GTK2 bindings for C#.'
arch=('x86_64')
license=('LGPL')
url='https://www.mono-project.com/docs/gui/gtksharp/'
depends=('mono' 'gtk2')
makedepends=('monodoc')
optdepends=('perl: for gapi2xml.pl and gapi_pp.pl')
provides=('glade-sharp')
conflicts=('glade-sharp')
options=('!makeflags')
source=(
    "https://github.com/glektarssza/gtk-sharp-2/raw/refs/heads/main/gtk-sharp-${pkgver}.tar.gz"
    'gtk-sharp2-2.12.12-gtkrange.patch'
    'gtk-sharp2-invalid-gpointer-cast.patch'
)
sha256sums=(
    '02680578e4535441064aac21d33315daa009d742cab8098ac8b2749d86fffb6a'
    '26a1ade869ba1b54f37e544332e6e40cc6d3c93414a712d8605cb44fc212acf9'
    '82482309cab86f8321cd5ccccf41adf6026b8464c70f5a34266c8ab64ed78540'
)

prepare() {
    cd gtk-sharp-${pkgver}
    patch -Np1 -i ../gtk-sharp2-2.12.12-gtkrange.patch
    patch -Np1 -i ../gtk-sharp2-invalid-gpointer-cast.patch
}

build() {
    cd gtk-sharp-${pkgver}
    ./configure --prefix=/usr --sysconfdir=/etc --disable-static

    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

    make
}

package() {
    cd gtk-sharp-${pkgver}
    make DESTDIR="${pkgdir}" install
}
