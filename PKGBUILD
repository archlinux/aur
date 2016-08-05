# Maintainer: Tony Lambiris <tony@criticalstack.com>

pkgname=osquery-git
pkgver=1.8.2.r12.g85ed298
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
makedepends=('python-jinja' 'python-psutil' 'python-pexpect' 'rocksdb-lite'
             'cpp-netlib' 'magic' 'unzip' 'wget')
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
validpgpkeys=()
sha256sums=('SKIP'
            '1fa367325d4a7ad7dfef3b7b817b3c7588ad02a8d08fc11db24de66b486c6503'
            '8fb9a37c2704647268e20ca6a8fd77b4866e054801cd2ab86362a2c028f03a8a')

_gitname=${pkgname}
# last known working commit-ish
_githash=85ed298fb9b35b4e2c1d690f7b207dbe368c8735

pkgver() {
    cd $_gitname

    git describe --long --tags $_githash | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd $_gitname

    git reset HEAD --hard
    git checkout $_githash
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
