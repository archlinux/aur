# Maintainer: s3rj1k <evasive dot gyron at gmail dot com>
# Do not forget to run `makepkg --printsrcinfo > .SRCINFO`

_pkgname=gnome-panel
_pkgver=3.44.0
pkgname=${_pkgname}-minimal
pkgver=3.44.0+0a5a7081f
pkgrel=7
pkgdesc='Panel of GNOME Flashback (minimal build)'
arch=('x86_64')
url='https://wiki.gnome.org/Projects/GnomePanel'
license=('GPL')
depends=('libwnck3' 'pango')
makedepends=('autoconf-archive' 'git' 'gtk-doc' 'itstool' 'yelp-tools')
provides=("${_pkgname}=${pkgver%%+*}")
conflicts=("${_pkgname}")
source=("git+https://gitlab.gnome.org/GNOME/gnome-panel.git#tag=${_pkgver}"
        'minimize.patch')
sha256sums=('SKIP'
            'cb6fa877bdd0434339109e1f61ad1a30ff0f5de0bf539dffff12cfda55c26741')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "%s+%s" "${_pkgver}" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${_pkgname}"

  patch -Np1 -i "$srcdir/minimize.patch"
}

build() {
  cd "${_pkgname}"

  ./autogen.sh \
    --prefix=/usr \
    --disable-schemas-compile \
    --enable-compile-warnings=minimum

  make
}

package() {
  cd "${_pkgname}"
  make DESTDIR="${pkgdir}" install
}
