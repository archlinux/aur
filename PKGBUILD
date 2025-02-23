# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>
# shellcheck disable=SC2034
# Contributor: Filipe Laíns (FFY00) <filipe.lains@gmail.com>
# Contributor: Alexander Hunziker <alex.hunziker@gmail.com>
# Contributor: Alessio Biancalana <dottorblaster@gmail.com>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Salamandar <felix@piedallu.me>

# Configure env vars:
# Use: {yay,paru} --mflags=VAR1=0,VAR2=1
ENABLE_DOC=${ENABLE_DOC:-1}
((ENABLE_DOC)) && _build_doc=true || _build_doc=false

_pkgname=babl
pkgname="${_pkgname}-git"
pkgver=0.1.111.r1907.f11a454
pkgrel=1
pkgdesc="Dynamic, any to any, pixel format translation library."
arch=('x86_64')
url="https://www.gegl.org/babl"
license=('LGPL3')
depends=('glibc' 'lcms2>=2.8')
makedepends=('git' 'gobject-introspection>=1.32.0' 'meson' 'vala')
((ENABLE_DOC)) && makedepends+=('gi-docgen')
provides=("babl=${pkgver%%.r*}")
conflicts=('babl')
options=(!libtool)
source=(git+https://gitlab.gnome.org/GNOME/babl)
md5sums=('SKIP')

pkgver() {
  cd ${srcdir}/${_pkgname}
  printf "%s.r%s.%s" \
    $(grep -ozP "(?s)^project\('babl'.*?version: *'\K[0-9.]*" meson.build|tr '\0' '\n') \
    $(git rev-list --count HEAD) \
    $(git rev-parse --short HEAD)
}

build() {
    meson "${srcdir}/${_pkgname}"\
          "${srcdir}/build" \
        --prefix=/usr \
        -Dbuildtype=release \
        -Db_lto=true \
        -Dwith-docs=${_build_doc}
    export NINJA_STATUS="[%p | %f<%r<%u | %cbps ] "
    ninja -C "${srcdir}/build"
}

package() {
    DESTDIR="${pkgdir}" ninja -C "${srcdir}/build" install
}

check() {
    meson test -C "${srcdir}/build"
}
