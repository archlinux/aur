# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Matěj Týč <matej.tyc@gmail.com>
pkgname=osquery-git
pkgver=1.8.0.r4.gc1d004e
pkgrel=1
epoch=
pkgdesc="SQL powered operating system instrumentation, monitoring, and analytics."
arch=(any)
url="https://osquery.io"
license=('BSD')
groups=()
depends=('asio' 'audit' 'aws-sdk-cpp-git' 'boost' 'boost-libs' 'clang' 'cmake'
         'doxygen' 'gflags' 'git' 'google-glog' 'lsb-release' 'make' 'python'
         'python-jinja' 'python-pip' 'sleuthkit' 'snappy' 'thrift' 'yara')
makedepends=('python-jinja' 'python-psutil' 'python-pexpect' 'rocksdb'
             'rocksdb-static' 'cpp-netlib' 'magic' 'unzip' 'wget')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=('etc/osquery/osquery.conf')
options=()
install=
changelog=
source=("${pkgname}::git+https://github.com/facebook/osquery"
        "osqueryd.service"
        "arch-linux.patch")
noextract=()
sha256sums=('SKIP'
            '1fa367325d4a7ad7dfef3b7b817b3c7588ad02a8d08fc11db24de66b486c6503'
            '745e4561eb065d05826d8f96d1cd06640463a5a85f38d2581ea85d2e33fd8d24')
validpgpkeys=()

_gitname=${pkgname}

pkgver() {
    cd $_gitname

    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd $_gitname

    git submodule update --init
    patch -p1 -i "${srcdir}/arch-linux.patch"
}

build() {
    cd $_gitname

    make deps
    cmake -Wno-dev -DCMAKE_INSTALL_PREFIX=/usr
    make -j $(nproc)
}

package() {
    cd $_gitname

    make DESTDIR="${pkgdir}" install

    install -dm755 "${pkgdir}/var/osquery/"
    install -dm755 "${pkgdir}/var/log/osquery/"

    install -Dm755 "${pkgdir}/usr/share/osquery/osquery.example.conf" \
        "${pkgdir}/etc/osquery/osquery.conf"

    install -Dm755 "${srcdir}/osqueryd.service" \
        "${pkgdir}/usr/lib/systemd/system/osqueryd.service"
}
