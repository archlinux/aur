# Maintainer: Fahry-a <farhannzarm@gmail.com>

pkgname=odm-bin
pkgver=1.5.0
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

sha256sums_i686=('72a75f94da3b83eed048e733b580a06334b10a8e7364b7be7738ba848dedeb51'
                    'SKIP'
                    'SKIP'
                    'SKIP'
                    'SKIP')
sha256sums_x86_64=('b5f2362d1eb130dbf0c652efa1b43b831c256dbe9fe7faea577cbf592174bba0'
                    'SKIP'
                    'SKIP'
                    'SKIP'
                    'SKIP')
sha256sums_armv7h=('fd433c91d42c4b4718c9ae885a21105c34c16a6b4c49c74ca839551abfe84e46'
                    'SKIP'
                    'SKIP'
                    'SKIP'
                    'SKIP')
sha256sums_aarch64=('daff4b004ebc14d31cd2e40f12f633a889a60dabb0ceeedb7b7f248adf797327'
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
