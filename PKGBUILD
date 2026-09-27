# Maintainer: Fahry-a <farhannzarm@gmail.com>

pkgname=odm-bin
pkgver=1.9.1
pkgrel=1
pkgdesc="Oryn Download Manager — aria2c-inspired CLI download manager with Connection Balancer, parallel download acceleration, pacman/ILoveCandy progress bar, JSON-RPC + WebSocket daemon, and resume support"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/Fahry-a/odm"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!strip')

source_i686=(
    "${pkgname}-${pkgver}-linux_386.tar.gz::${url}/releases/download/v${pkgver}/odm_${pkgver}_linux_386.tar.gz"
    "${pkgname}-${pkgver}.1"
    "${pkgname}.conf-${pkgver}.example"
    "${pkgname}-${pkgver}.service"
    "${pkgname}-${pkgver}.LICENSE"
)
source_x86_64=(
    "${pkgname}-${pkgver}-linux_amd64.tar.gz::${url}/releases/download/v${pkgver}/odm_${pkgver}_linux_amd64.tar.gz"
    "${pkgname}-${pkgver}.1"
    "${pkgname}.conf-${pkgver}.example"
    "${pkgname}-${pkgver}.service"
    "${pkgname}-${pkgver}.LICENSE"
)
source_armv7h=(
    "${pkgname}-${pkgver}-linux_arm.tar.gz::${url}/releases/download/v${pkgver}/odm_${pkgver}_linux_arm.tar.gz"
    "${pkgname}-${pkgver}.1"
    "${pkgname}.conf-${pkgver}.example"
    "${pkgname}-${pkgver}.service"
    "${pkgname}-${pkgver}.LICENSE"
)
source_aarch64=(
    "${pkgname}-${pkgver}-linux_arm64.tar.gz::${url}/releases/download/v${pkgver}/odm_${pkgver}_linux_arm64.tar.gz"
    "${pkgname}-${pkgver}.1"
    "${pkgname}.conf-${pkgver}.example"
    "${pkgname}-${pkgver}.service"
    "${pkgname}-${pkgver}.LICENSE"
)

sha256sums_i686=('fac89822979ee847db33ba36a7edec44472426f513235d480360ac733e183307'
                    'SKIP'
                    'SKIP'
                    'SKIP'
                    'SKIP')
sha256sums_x86_64=('f34c226a4b8d3895d2774818918b117d6e5be50b4c9422fca32ef1f49863c6d0'
                    'SKIP'
                    'SKIP'
                    'SKIP'
                    'SKIP')
sha256sums_armv7h=('1eb1a594615ae623c6b452638019f7847640632e09e93159327fa48500681954'
                    'SKIP'
                    'SKIP'
                    'SKIP'
                    'SKIP')
sha256sums_aarch64=('6a923309af7df46e7eedb108574bc29a844de66d258e324250e5cc49e17967a2'
                    'SKIP'
                    'SKIP'
                    'SKIP'
                    'SKIP')

# Sanity-check the downloaded tarball before packaging: the binary inside must
# exist and report the pkgver we are about to ship. (makepkg already verified
# the sha256 of the tarball itself via the source array when it is not SKIP;
# the release pipeline fills it from checksums.txt.)
build() {
    local _tarball
    case "$CARCH" in
        i686)  _tarball="${pkgname}-${pkgver}-linux_386.tar.gz" ;;
        x86_64)  _tarball="${pkgname}-${pkgver}-linux_amd64.tar.gz" ;;
        armv7h) _tarball="${pkgname}-${pkgver}-linux_arm.tar.gz" ;;
        aarch64) _tarball="${pkgname}-${pkgver}-linux_arm64.tar.gz" ;;
    esac
    tar -xzf "$srcdir/$_tarball" -C "$srcdir"
    chmod +x "$srcdir/odm"
    "$srcdir/odm" --version | grep -qF "$pkgver"
}

package() {
    install -Dm755 "$srcdir/odm" "$pkgdir/usr/bin/odm"

    install -Dm644 "$srcdir/${pkgname}-${pkgver}.1" "$pkgdir/usr/share/man/man1/odm.1"
    install -Dm644 "$srcdir/${pkgname}.conf-${pkgver}.example" "$pkgdir/etc/odm/config.conf.example"
    install -Dm644 "$srcdir/${pkgname}-${pkgver}.service" "$pkgdir/usr/lib/systemd/system/odm.service"
    install -Dm644 "$srcdir/${pkgname}-${pkgver}.LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
