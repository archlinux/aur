# Maintainer: Tobias Borgert <tobias.borgert@gmail.com>

pkgname=ecal
pkgver=5.9.3
pkgrel=1
pkgdesc="enhanced Communication Abstraction Layer"
arch=('x86_64' 'armv7h')
url="https://github.com/continental/ecal"
license=('Apache')
depends=('curl' 'protobuf' 'qt5-base' 'hdf5')
makedepends=('cmake' 'doxygen' 'git' 'graphviz')
optdepends=()
source=('git+https://github.com/continental/ecal.git')
sha256sums=('SKIP')
backup=('etc/ecal/ecal.ini' 'etc/ecal/ecaltime.ini')

prepare() {
    cd "${pkgname}"
    git checkout v"${pkgver}"
    git submodule init
    git submodule update
    #patch --forward --strip=1 --input="../Support_GCC_11.patch"
    #patch --forward --strip=1 --input="../Support_Protobuf_3_15_6.patch"
}

build() {
    cd "${pkgname}"
    mkdir -p _build
    cd _build
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr \
             -DCMAKE_BUILD_TYPE=Release \
             -DECAL_THIRDPARTY_BUILD_PROTOBUF=OFF \
             -DECAL_THIRDPARTY_BUILD_CURL=OFF \
             -DECAL_THIRDPARTY_BUILD_HDF5=OFF \
             -DCMAKE_INSTALL_SYSCONFDIR=/etc
    make
}

package() {
    install -D -m644 "${srcdir}"/"${pkgname}"/LICENSE.txt "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE.txt
    install -D -m644 "${srcdir}"/"${pkgname}"/licenses/asio/LICENSE_1_0.txt "${pkgdir}"/usr/share/licenses/"${pkgname}"/thirdparty/asio/LICENSE_1_0.txt
    install -D -m644 "${srcdir}"/"${pkgname}"/licenses/capnproto/LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/thirdparty/capnproto/LICENSE
    install -D -m644 "${srcdir}"/"${pkgname}"/licenses/convert-utf/license.txt "${pkgdir}"/usr/share/licenses/"${pkgname}"/thirdparty/convert-utf/license.txt
    install -D -m644 "${srcdir}"/"${pkgname}"/licenses/google-flatbuffers/LICENSE.txt "${pkgdir}"/usr/share/licenses/"${pkgname}"/thirdparty/google-flatbuffers/LICENSE.txt
    install -D -m644 "${srcdir}"/"${pkgname}"/licenses/google-protobuf/LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/thirdparty/google-protobuf/LICENSE
    install -D -m644 "${srcdir}"/"${pkgname}"/licenses/google-test/LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/thirdparty/google-test/LICENSE
    install -D -m644 "${srcdir}"/"${pkgname}"/licenses/npcap/LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/thirdparty/npcap/LICENSE
    install -D -m644 "${srcdir}"/"${pkgname}"/licenses/google-test/LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/thirdparty/google-test/LICENSE
    install -D -m644 "${srcdir}"/"${pkgname}"/licenses/qt/LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/thirdparty/qt/LICENSE
    install -D -m644 "${srcdir}"/"${pkgname}"/licenses/simpleini/LICENCE.txt "${pkgdir}"/usr/share/licenses/"${pkgname}"/thirdparty/simpleini/LICENCE.txt
    install -D -m644 "${srcdir}"/"${pkgname}"/licenses/spdlog/LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/thirdparty/spdlog/LICENSE
    install -D -m644 "${srcdir}"/"${pkgname}"/licenses/tclap/COPYING "${pkgdir}"/usr/share/licenses/"${pkgname}"/thirdparty/tclap/COPYING
    install -D -m644 "${srcdir}"/"${pkgname}"/licenses/termcolor/LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/thirdparty/termcolor/LICENSE
    cd "${pkgname}"
    cd _build
    DESTDIR="$pkgdir" make install
}
