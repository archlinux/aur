# Maintainer: Étienne Deparis <etienne@depar.is>
pkgname=peeq
pkgver=0.6.1
pkgrel=1
pkgdesc="A Postgresql client with programmer utilities."
arch=(x86_64)
url=https://github.com/dbhowell/peeq
license=(GPL3)
depends=(granite gtksourceview3 postgresql-libs)
makedepends=(git meson vala)
source=("${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('27596c000e70f6d1f11e5fd1d7a827752d16658de1816d290cdc0fc9a8979679')
conflicts=(peeq-bin peeq-git)

build () {
    sed -i "s/dependency('libpq'),/meson.get_compiler('vala').find_library('libpq'),/" "${pkgname}-${pkgver}/src/meson.build"
    arch-meson "${pkgname}-${pkgver}" build
    # Trigger a project conversion from vala to c
    ninja -C build src/com.github.dbhowell.peeq.p/Application.c
    # Fix headers and linker for Archlinux
    sed -i 's|<postgresql/libpq-fe.h>|<libpq-fe.h>|' \
        build/src/com.github.dbhowell.peeq.p/Services/Connection.c \
        build/src/com.github.dbhowell.peeq.p/Utils/DataFormat.c \
        build/src/com.github.dbhowell.peeq.p/Services/QueryResult.c
    sed -i 's|/usr/lib/libz.so|/usr/lib/libz.so /usr/lib/libpq.so|' build/build.ninja
    # Finally make a full build
    ninja -C build
}

package() {
    DESTDIR="${pkgdir}" ninja -C build install
}
