# Maintainer: Silvan Gümüsdere <silvan@trollbox.org>

pkgname=meshtastic-sniffer
pkgver=1.0.0
pkgrel=2
pkgdesc="Wideband Meshtastic LoRa receiver with multi-station fusion and offline PSK recovery"
arch=(
    'x86_64'
    'armv7h'
    'aarch64'
)
url="https://github.com/alphafox02/meshtastic-sniffer"
license=('GPL-3.0-or-later')
depends=(
    'fftw'
    'glibc'
    'libgcc'
    'libgomp'
    'openssl'
    'zlib'
)
makedepends=(
    'cmake'
    'go'
)
optdepends=(
    'airspy'
    'bladerf'
    'hackrf'
    'libuhd'
    'libsdrplay'
    'libsodium'
    'mosquitto'
    'rtl-sdr'
    'soapysdr'
    'zeromq'
)
provides=(
    'meshtastic-sniffer'
    'meshtastic-recover'
    'meshtastic-fusion'
#    'meshtastic-wardrive'
)
conflicts=(
    'meshtastic-sniffer-git'
)
source=("$pkgname-$pkgver::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('892207febe903682d5c08acd0c2b626f92ad452ed9a2bd5a056f495cc06bd30a')

build() {
    local cmake_options=(
        -B build
        -S "$pkgname-$pkgver"
        -W no-dev
        -D CMAKE_BUILD_TYPE=None
        -D CMAKE_INSTALL_PREFIX=/usr
    )
    cmake "${cmake_options[@]}"
    cmake --build build

    cd "$pkgname-$pkgver"
    export GOPATH="${srcdir}/gopath"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    
    cd fusion
    go build -v -o meshtastic-fusion .
#    cd ../wardrive
#    go build -v -o meshtastic-wardrive .
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    
    cd "$pkgname-$pkgver"
    install -Dm755 "fusion/meshtastic-fusion" "$pkgdir/usr/bin/meshtastic-fusion"
#    install -Dm755 "wardrive/meshtastic-wardrive" "$pkgdir/usr/bin/meshtastic-wardrive"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

