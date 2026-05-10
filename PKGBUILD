# Maintainer: Wojciech Kucjas <wojciech.kucjas@gmail.com>
# Maintainer: Michał Walenciak <michalwalenciak@gmail.com>
pkgname=rdhm-agent
pkgver=0.2.0
pkgrel=2
pkgdesc='Remote Disc Health Monitor - Agent daemon'
arch=('x86_64')
license=('GPL-3.0-or-later')
url='https://github.com/Kicer86/RemoteDiskHealthMonitor'
depends=('smartmontools' 'util-linux')
makedepends=('cmake' 'gcc' 'git')
install=rdhm-agent.install
_pkgsrc="RemoteDiskHealthMonitor-$pkgver"
_cpp_httplib_commit='68fa9bce0f1abb27fc7507c372c6ac0b75f8a878'
_googletest_commit='52eb8108c5bdec04579160ae17225d66034bd723'
_mdns_commit='a569c4759bd47e0f2a7bfc4d4c19620445782806'
_nlohmann_json_commit='f534f4f75e12893716ea688679aeb768bff426c4'
source=(
    "${_pkgsrc}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "cpp-httplib::git+https://github.com/yhirose/cpp-httplib.git#commit=${_cpp_httplib_commit}"
    "googletest::git+https://github.com/google/googletest.git#commit=${_googletest_commit}"
    "mdns::git+https://github.com/mjansson/mdns.git#commit=${_mdns_commit}"
    "nlohmann-json::git+https://github.com/nlohmann/json.git#commit=${_nlohmann_json_commit}"
)
sha256sums=('0bd0bc318485f9f2ceab1f0ef4f5f786ae22694a099752e1bb785543ba24f022'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
    cd "$srcdir/$_pkgsrc"

    rm -rf external/cpp-httplib external/googletest external/mdns external/nlohmann-json
    cp -a "$srcdir/cpp-httplib" external/cpp-httplib
    cp -a "$srcdir/googletest" external/googletest
    cp -a "$srcdir/mdns" external/mdns
    cp -a "$srcdir/nlohmann-json" external/nlohmann-json

    sed -i 's#/usr/sbin/rdhm-agent#/usr/bin/rdhm-agent#' \
        packaging/systemd/rdhm-agent.service
}

build() {
    cmake -B build -S "$srcdir/$_pkgsrc" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_SBINDIR=bin \
        -DBUILD_MONITOR=OFF \
        -DBUILD_AGENT=ON
    cmake --build build --target agent
}

package() {
    DESTDIR="$pkgdir" cmake --install build

    install -Dm644 "$srcdir/$_pkgsrc/packaging/systemd/rdhm-agent.service" \
        "$pkgdir/usr/lib/systemd/system/rdhm-agent.service"

    install -Dm644 "$srcdir/$_pkgsrc/packaging/conf/agent.conf" \
        "$pkgdir/etc/rdhm/agent.conf"
}
