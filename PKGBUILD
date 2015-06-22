# Maintainer: Alex "grevus" Lobtsov <alex@lobtsov.com>
pkgname=postgresql-ip4r
pkgver=2.0.2
pkgrel=2
pkgdesc="ip4r support for postgresql"
url="http://ip4r.projects.pgfoundry.org/"
arch=('x86_64' 'i686')
license=('BSD')
depends=(
    'postgresql>=9.2'
)
makedepends=()

_pkg_name=ip4r-extension
_folder_name=ip4r

source=(
    'ip4r.tgz::http://pgfoundry.org/frs/download.php/3650/$_pkg_name-$pkgver.tgz'
)
md5sums=(
    'ae4d6eb8b7949f791c14041e7fe07464'
)

conflicts=()

build() {
    cd "${srcdir}/${_folder_name}-${pkgver}"

    make || return 1
    make DESTDIR="${srcdir}/pkg-all" install || return 1
}

package() {
    mkdir -p ${pkgdir}/usr/lib/postgresql
    mkdir -p ${pkgdir}/usr/share/postgresql/extension
    mkdir -p ${pkgdir}/usr/share/doc/postgresql/extension

    cp -p ${srcdir}/pkg-all/usr/lib/postgresql/ip4r.so ${pkgdir}/usr/lib/postgresql/ || return 1

    cp -p ${srcdir}/pkg-all/usr/share/postgresql/extension/ip4r--2.0.sql \
          ${srcdir}/pkg-all/usr/share/postgresql/extension/ip4r--unpackaged1--2.0.sql \
          ${srcdir}/pkg-all/usr/share/postgresql/extension/ip4r--unpackaged2.0--2.0.sql \
          ${srcdir}/pkg-all/usr/share/postgresql/extension/ip4r.control \
          ${pkgdir}/usr/share/postgresql/extension/ || return 1

    cp -p ${srcdir}/pkg-all/usr/share/doc/postgresql/extension/README.ip4r \
          ${pkgdir}/usr/share/doc/postgresql/extension/ || return 1
}
