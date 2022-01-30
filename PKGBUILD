# Maintainer: Michael Riegert <michael at eowyn net>
# Contributor: Danilo Kuehn <dk at nogo-software dot de>

pkgname=nextcloud-client-git
_name=${pkgname/\-git/}
pkgver=3.4.0.rc2.r181.gc69cecced
pkgrel=1
pkgdesc="Nextloud client for linux"
arch=('i686' 'x86_64')
url="https://nextcloud.com/"
license=('GPL2')
depends=(openssl sqlite qtkeychain qt5-svg qt5-webengine xdg-utils qt5-webkit
    libcloudproviders qt5-graphicaleffects qt5-quickcontrols2 qt5-websockets inkscape)
makedepends=(doxygen extra-cmake-modules python-sphinx qt5-tools git cmocka)
optdepends=(
    'kio: integration with Dolphin'
    'nemo-python: integration with Nemo'
    'python-nautilus: integration with Nautilus'
    'python-caja: integration with Caja'
)
provides=('mirall' 'mirall-git' 'owncloud-client' 'nextcloud-client')
conflicts=('mirall-git' 'owncloud-client' 'owncloud-client-ngs' 'nextcloud-client' 'owncloud-client-git')
backup=('etc/Nextcloud/sync-exclude.lst')
source=("${_name}::git+https://github.com/nextcloud/desktop.git")
sha256sums=('SKIP')

pkgver() {
    cd ${srcdir}/${_name}
    git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd ${srcdir}/${_name}
    if [[ -n "${_version}" ]]; then
        git checkout "v${_version}"
    fi
    git submodule update --init --recursive
    mkdir -p build
}

build() {
    cd ${srcdir}/${_name}/build
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_BUILD_TYPE="Release" \
        -DWITH_DOC=FALSE
    make
}

package() {
    cd ${srcdir}/${_name}/build
    make DESTDIR=${pkgdir} install
}
