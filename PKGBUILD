# Maintainer: Tobias Borgert <tobias (dot) borgert (at) gmail (dot) com>

pkgname=ecal
pkgver=5.11.3
pkgrel=2
pkgdesc="enhanced Communication Abstraction Layer"
arch=('x86_64' 'armv7h')
url="https://github.com/eclipse-ecal/ecal"
license=('Apache')
depends=('curl' 'protobuf' 'python' 'python-protobuf' 'qt5-base' 'qwt' 'hdf5' 'yaml-cpp')
makedepends=('cmake' 'doxygen' 'git' 'graphviz' 'patchelf' 'python-build' 'python-installer' 'python-wheel')
optdepends=()
source=("https://github.com/eclipse-ecal/ecal/releases/download/v${pkgver}/ecal-fat-source.tar.gz")
sha256sums=('6bd89248cb487cc30d599f89f160ef705749fabf1c2a263aaf269adb508ee4a1')
backup=('etc/ecal/ecal.ini' 'etc/ecal/ecaltime.ini')

prepare() {
#    patch --forward --strip=1 --input="../fineftp-server.filesystem.cpp.patch" "$pkgname/thirdparty/fineftp-server/fineftp-server/src/filesystem.cpp"
    :
}

build() {
    cd "${pkgname}"
    mkdir -p _build
    cd _build
    cmake -E env CXXFLAGS="-Wno-error=restrict" \
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr \
             -DCMAKE_BUILD_TYPE=Release \
             -DBUILD_PY_BINDING=ON \
             -DBUILD_STANDALONE_PY_WHEEL=ON \
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
    cd python
    python -m build --wheel --no-isolation
    python -m installer --destdir="${pkgdir}" dist/*.whl   
}
