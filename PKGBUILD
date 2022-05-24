# Maintainer: s3rj1k <evasive dot gyron at gmail dot com>
# Do not forget to run `makepkg --printsrcinfo > .SRCINFO`

_pkgname=gnome-panel
_pkgver=3.44.0
pkgname=${_pkgname}-minimal
pkgver=3.44.0+0a5a7081f
pkgrel=9
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
            '0a863238aa585521183ccb56cc1c98fac84ccf9b733e2998b60fa04fc9461b7b')

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
