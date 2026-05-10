# Maintainer: Wojciech Kucjas <wojciech.kucjas@gmail.com>
# Maintainer: Michał Walenciak <michalwalenciak@gmail.com>
pkgname=rdhm-monitor
pkgver=0.2.0
pkgrel=1
pkgdesc='Remote Disc Health Monitor - Monitor GUI'
arch=('x86_64')
license=('GPL-3.0-or-later')
url='https://github.com/Kicer86/RemoteDiskHealthMonitor'
depends=('qt6-declarative' 'avahi')
makedepends=('cmake' 'gcc' 'git' 'qt6-base' 'qt6-declarative' 'avahi')
_pkgsrc="RemoteDiskHealthMonitor-$pkgver"
_cpp_restapi_commit='d440c5ac83b4dda821a2679e4f6c4330cc4875d9'
_googletest_commit='52eb8108c5bdec04579160ae17225d66034bd723'
_nlohmann_json_commit='f534f4f75e12893716ea688679aeb768bff426c4'
_qtzeroconf_commit='81701d6a92d09a9ae091e755a55079f647f5f46c'
source=(
    "${_pkgsrc}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "cpp_restapi::git+https://github.com/Kicer86/cpp_restapi.git#commit=${_cpp_restapi_commit}"
    "googletest::git+https://github.com/google/googletest.git#commit=${_googletest_commit}"
    "nlohmann-json::git+https://github.com/nlohmann/json.git#commit=${_nlohmann_json_commit}"
    "QtZeroConf::git+https://github.com/jbagg/QtZeroConf.git#commit=${_qtzeroconf_commit}"
)
sha256sums=('0bd0bc318485f9f2ceab1f0ef4f5f786ae22694a099752e1bb785543ba24f022'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
    cd "$srcdir/$_pkgsrc"

    rm -rf external/cpp_restapi external/googletest external/nlohmann-json external/QtZeroConf
    cp -a "$srcdir/cpp_restapi" external/cpp_restapi
    cp -a "$srcdir/googletest" external/googletest
    cp -a "$srcdir/nlohmann-json" external/nlohmann-json
    cp -a "$srcdir/QtZeroConf" external/QtZeroConf
}

build() {
    cmake -B build -S "$srcdir/$_pkgsrc" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_AGENT=OFF \
        -DBUILD_MONITOR=ON
    cmake --build build --target monitor
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
