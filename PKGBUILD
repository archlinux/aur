# Package maintainer: Leonid B <leonid dot bloch at esrf dot fr>
pkgname=hdf5-lz4-filter-git
pkgver=r149.gcabe5fd
pkgrel=1
pkgdesc="LZ4 filter for the HDF5 data format"
arch=('i686' 'x86_64')
url="https://github.com/nexusformat/HDF5-External-Filter-Plugins/tree/master/LZ4"
license=('BSD')
depends=('hdf5' 'lz4')
makedepends=('git')
source=("${pkgname%-git}::git+https://github.com/nexusformat/HDF5-External-Filter-Plugins.git"
        "hdf5_env.sh")
sha256sums=('SKIP'
            '643d90a15a5105d891adea12806d468aef134f902a38761e864a1085370fb4f9')

pkgver() {
    cd "${pkgname%-git}"
    printf "r%s.g%s" "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${pkgname%-git}"
    git rm -r docs
}

build() {
    cd "${pkgname%-git}"
    cmake . -DENABLE_LZ4_PLUGIN=yes -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd "${pkgname%-git}"
    make DESTDIR="${pkgdir}/" install
    install -D -m755 "${srcdir}/hdf5_env.sh" \
        "${pkgdir}/etc/profile.d/hdf5_env.sh"
    install -D -m644 "LZ4/COPYING" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
