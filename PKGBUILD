# Maintainer: Fahry-a <farhannzarm@gmail.com>

pkgname=odm-bin
pkgver=1.4.2
pkgrel=1
pkgdesc="Oryn Download Manager — aria2c-inspired CLI download manager with Connection Balancer, parallel download acceleration, pacman/ILoveCandy progress bar, JSON-RPC + WebSocket daemon, and resume support"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/Fahry-a/odm"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!strip')

source_i686=(
    "${pkgname}-${pkgver}-linux_386::${url}/releases/download/v${pkgver}/odm_${pkgver}_linux_386"
    "${pkgname}-${pkgver}.1"
    "${pkgname}.conf-${pkgver}.example"
    "${pkgname}-${pkgver}.service"
    "${pkgname}-${pkgver}.LICENSE"
)
source_x86_64=(
    "${pkgname}-${pkgver}-linux_amd64::${url}/releases/download/v${pkgver}/odm_${pkgver}_linux_amd64"
    "${pkgname}-${pkgver}.1"
    "${pkgname}.conf-${pkgver}.example"
    "${pkgname}-${pkgver}.service"
    "${pkgname}-${pkgver}.LICENSE"
)
source_armv7h=(
    "${pkgname}-${pkgver}-linux_arm::${url}/releases/download/v${pkgver}/odm_${pkgver}_linux_arm"
    "${pkgname}-${pkgver}.1"
    "${pkgname}.conf-${pkgver}.example"
    "${pkgname}-${pkgver}.service"
    "${pkgname}-${pkgver}.LICENSE"
)
source_aarch64=(
    "${pkgname}-${pkgver}-linux_arm64::${url}/releases/download/v${pkgver}/odm_${pkgver}_linux_arm64"
    "${pkgname}-${pkgver}.1"
    "${pkgname}.conf-${pkgver}.example"
    "${pkgname}-${pkgver}.service"
    "${pkgname}-${pkgver}.LICENSE"
)

sha256sums_i686=('588409f48aa77d59805f424128a479ef7494848357a146365a4e2a9203393c38'
                    'SKIP'
                    'SKIP'
                    'SKIP'
                    'SKIP')
sha256sums_x86_64=('8cb101426172d045fbae85b26bbd51ad055a1b33bbdb6abe6fc1d4127ca8ac31'
                    'SKIP'
                    'SKIP'
                    'SKIP'
                    'SKIP')
sha256sums_armv7h=('b822c031d457729e34fc55b192af42db9d34de410e63e4f42061ea4142a19be4'
                    'SKIP'
                    'SKIP'
                    'SKIP'
                    'SKIP')
sha256sums_aarch64=('2d01a91164651a3be174fb06a5245754e0450098a46ae9bfbb61a7ce933b1ab3'
                    'SKIP'
                    'SKIP'
                    'SKIP'
                    'SKIP')

# Sanity-check the downloaded binary before packaging: it must exist, run on
# the build machine, and report the pkgver we are about to ship.
check() {
    local _bin
    case "$CARCH" in
        i686)  _bin="${pkgname}-${pkgver}-linux_386" ;;
        x86_64)  _bin="${pkgname}-${pkgver}-linux_amd64" ;;
        armv7h) _bin="${pkgname}-${pkgver}-linux_arm" ;;
        aarch64) _bin="${pkgname}-${pkgver}-linux_arm64" ;;
    esac
    # The downloaded binary is not executable on arrival (the download agent
    # writes plain files), so grant +x before running it.
    chmod +x "$srcdir/$_bin"
    "$srcdir/$_bin" --version | grep -qF "$pkgver"
}

package() {
    local _bin
    case "$CARCH" in
        i686)  _bin="${pkgname}-${pkgver}-linux_386" ;;
        x86_64)  _bin="${pkgname}-${pkgver}-linux_amd64" ;;
        armv7h) _bin="${pkgname}-${pkgver}-linux_arm" ;;
        aarch64) _bin="${pkgname}-${pkgver}-linux_arm64" ;;
    esac
    install -Dm755 "$srcdir/$_bin" "$pkgdir/usr/bin/odm"

    install -Dm644 "$srcdir/${pkgname}-${pkgver}.1" "$pkgdir/usr/share/man/man1/odm.1"
    install -Dm644 "$srcdir/${pkgname}.conf-${pkgver}.example" "$pkgdir/etc/odm/config.conf.example"
    install -Dm644 "$srcdir/${pkgname}-${pkgver}.service" "$pkgdir/usr/lib/systemd/system/odm.service"
    install -Dm644 "$srcdir/${pkgname}-${pkgver}.LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
