# Maintainer: Yonggang Li <gnaggnoyil@gmail.com>
# Contributor: Jove Yu <yushijun110@126.com>

pkgname=hardinfo-gtk3-git
pkgver=0.5.1.1369.g6ecebbd
pkgrel=1
pkgdesc="A system information and benchmark tool. (GTK3 version)"
arch=('x86_64')
url="https://github.com/lpereira/hardinfo"
license=('GPL2')
provides=('hardinfo')
conflicts=('hardinfo')
depends=('gtk3')
makedepends=('cmake' 'git')
source=($pkgname::git+https://github.com/lpereira/hardinfo)
sha1sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    # describe based on all tags
    git describe --tags --long | sed "s/^release-//;;s/-/./g"
}

build() {
    _cmake_args=(
        -DHARDINFO_GTK3=1
        -DCMAKE_BUILD_TYPE=Release
        -DCMAKE_INSTALL_PREFIX=/usr
        -DCMAKE_INSTALL_LIBDIR=lib
    )

    mkdir -p "${srcdir}/build"
    cd "${srcdir}/build"

    CFLAGS+=' -fcommon' # https://wiki.gentoo.org/wiki/Gcc_10_porting_notes/fno_common
    cmake ${_cmake_args[@]} "${srcdir}/${pkgname}"
    make
}

package() {
    cd "${srcdir}/build"
    make DESTDIR="${pkgdir}" install
}
