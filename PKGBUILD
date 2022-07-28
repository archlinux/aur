# Maintainer: Tobias Borgert <tobias (dot) borgert (at) gmail (dot) com>

pkgname=ecal
pkgver=5.10.1
pkgrel=1
pkgdesc="enhanced Communication Abstraction Layer"
arch=('x86_64' 'armv7h')
url="https://github.com/eclipse-ecal/ecal"
license=('Apache')
depends=('curl' 'protobuf' 'qt5-base' 'qwt' 'hdf5')
makedepends=('cmake' 'doxygen' 'git' 'graphviz')
optdepends=()
source=("https://github.com/eclipse-ecal/ecal/releases/download/v${pkgver}/ecal-fat-source.tar.gz"
        "ecal_utils.filesystem.cpp.patch"
        "fineftp-server.filesystem.cpp.patch"
        "samples.proto_dyn.cpp.patch")
sha256sums=('023b8022cf3913118fe0bfff0d96aa48e2210067287ed20a957d6e67c26e31ca'
            '7f95ec10aba6695a2d2f2bf6a1bb8bd949c83217fdd077446763e8059d759791'
            'ebbc58b792f402c43d83f05e4dec59b714ae455077a5e93aff5a040fffd3bb72'
            'ee8cd9e12873961c56f4b8f032ce31a7aec8c058b8ba236e8081ea2b9d40975e')
backup=('etc/ecal/ecal.ini' 'etc/ecal/ecaltime.ini')

prepare() {
    patch --forward --strip=1 --input="../ecal_utils.filesystem.cpp.patch" "$pkgname/lib/ecal_utils/src/filesystem.cpp"
    patch --forward --strip=1 --input="../fineftp-server.filesystem.cpp.patch" "$pkgname/thirdparty/fineftp-server/fineftp-server/src/filesystem.cpp"
    patch --forward --strip=1 --input="../samples.proto_dyn.cpp.patch" "$pkgname/samples/cpp/misc/proto_dyn/src/proto_dyn.cpp"
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
