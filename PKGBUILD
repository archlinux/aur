# Maintainer: Silvan Gümüsdere <silvan@trollbox.org>

pkgname=meshtastic-sniffer-git
pkgver=r262.5c0ae65
pkgrel=1
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
    'git'
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
    'meshtastic-wardrive'
)
conflicts=(
    'meshtastic-sniffer'
)
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    local cmake_options=(
        -B build
        -S "$pkgname"
        -W no-dev
        -D CMAKE_BUILD_TYPE=None
        -D CMAKE_INSTALL_PREFIX=/usr
    )
    cmake "${cmake_options[@]}"
    cmake --build build

    cd "$pkgname"
    export GOPATH="${srcdir}/gopath"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    
    cd fusion
    go build -v -o meshtastic-fusion .
    cd ../wardrive
    go build -v -o meshtastic-wardrive .
}

package() {
    DESTDIR="$pkgdir" cmake --install build

    cd "$pkgname"
    install -Dm755 "fusion/meshtastic-fusion" "$pkgdir/usr/bin/meshtastic-fusion"
    install -Dm755 "wardrive/meshtastic-wardrive" "$pkgdir/usr/bin/meshtastic-wardrive"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

