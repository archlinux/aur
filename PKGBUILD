# Maintainer: Fahry-a <farhannzarm@gmail.com>

pkgname=odm-bin
pkgver=1.3.1
pkgrel=2
pkgdesc="Oryn Download Manager — aria2c-inspired CLI download manager with Connection Balancer, parallel download acceleration, pacman/ILoveCandy progress bar, JSON-RPC + WebSocket daemon, and resume support"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/Fahry-a/odm"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!strip')

source_i686=(
    "${pkgname}-${pkgver}-linux_386::https://github.com/Fahry-a/odm/releases/download/v${pkgver}/odm_${pkgver}_linux_386"
    "${pkgname}-${pkgver}.1"
    "${pkgname}-${pkgver}.conf.example"
    "${pkgname}-${pkgver}.service"
    "${pkgname}-${pkgver}.LICENSE"
)
source_x86_64=(
    "${pkgname}-${pkgver}-linux_amd64::https://github.com/Fahry-a/odm/releases/download/v${pkgver}/odm_${pkgver}_linux_amd64"
    "${pkgname}-${pkgver}.1"
    "${pkgname}-${pkgver}.conf.example"
    "${pkgname}-${pkgver}.service"
    "${pkgname}-${pkgver}.LICENSE"
)
source_armv7h=(
    "${pkgname}-${pkgver}-linux_arm::https://github.com/Fahry-a/odm/releases/download/v${pkgver}/odm_${pkgver}_linux_arm"
    "${pkgname}-${pkgver}.1"
    "${pkgname}-${pkgver}.conf.example"
    "${pkgname}-${pkgver}.service"
    "${pkgname}-${pkgver}.LICENSE"
)
source_aarch64=(
    "${pkgname}-${pkgver}-linux_arm64::https://github.com/Fahry-a/odm/releases/download/v${pkgver}/odm_${pkgver}_linux_arm64"
    "${pkgname}-${pkgver}.1"
    "${pkgname}-${pkgver}.conf.example"
    "${pkgname}-${pkgver}.service"
    "${pkgname}-${pkgver}.LICENSE"
)

sha256sums_i686=('aa67b94b76646c030a63b004354962bcf1bd23964ba4d9eb1dc15c5c50599baf'
                    'SKIP'
                    'SKIP'
                    'SKIP'
                    'SKIP')
sha256sums_x86_64=('b14b45ac9d59e03f1562f9bfe5b0984f172219a0e98352cd1d7c4545050e09dd'
                    'SKIP'
                    'SKIP'
                    'SKIP'
                    'SKIP')
sha256sums_armv7h=('46be33738266dd2b509e57f4dfc6df46704fe8ba629c4ed801b7a5a823ae6173'
                    'SKIP'
                    'SKIP'
                    'SKIP'
                    'SKIP')
sha256sums_aarch64=('c829af49be49ad4767754f036444af8313902716207d03f892c862e059b49ce6'
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
    install -Dm644 "$srcdir/${pkgname}-${pkgver}.conf.example" "$pkgdir/etc/odm/config.conf.example"
    install -Dm644 "$srcdir/${pkgname}-${pkgver}.service" "$pkgdir/usr/lib/systemd/system/odm.service"
    install -Dm644 "$srcdir/${pkgname}-${pkgver}.LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
