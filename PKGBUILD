# Maintainer: snapetech <iptvtunerr@proton.me>
pkgname=iptvtunerr
pkgver=0.1.63
pkgrel=1
pkgdesc="IPTV to Plex, Emby, and Jellyfin bridge with HDHomeRun-style tuner and XMLTV guide support"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/snapetech/iptvtunerr"
license=('AGPL-3.0-or-later')
depends=('glibc')
makedepends=('go')
optdepends=(
    'ffmpeg: transcoding and packaged HLS/fMP4 stream profiles'
    'fuse3: VOD filesystem mount support'
)
provides=('iptvtunerr')
conflicts=('iptvtunerr-bin')
backup=('etc/iptvtunerr/iptvtunerr.env')
install=iptvtunerr.install
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/snapetech/iptvtunerr/archive/refs/tags/v${pkgver}.tar.gz"
    "iptvtunerr.service"
    "iptvtunerr.env"
    "iptvtunerr.sysusers"
    "iptvtunerr.tmpfiles"
)
sha256sums=('SKIP'
            '3ba54b6cd8f7ddd4d0e50f19bca2836e967cd21af79bc5799c87f3d9f47b1c20'
            '003bc691e90ca5e98797ed2347494920d9bda7eca45858bad4d836122adb1619'
            'f99639cf60b2c67c1cd1d839680ad665fec89beeac243fe2130e5cda75961db5'
            'aeda5941c781c7d809af74180eebac6978f3871bb17cd02ceadf74fb42aad06d')

build() {
    cd "${srcdir}/iptvtunerr-${pkgver}"

    local _goarch _goarm
    case "${CARCH}" in
        x86_64)
            _goarch=amd64
            ;;
        aarch64)
            _goarch=arm64
            ;;
        armv7h)
            _goarch=arm
            _goarm=7
            ;;
        *)
            echo "Unsupported Arch build architecture: ${CARCH}" >&2
            return 1
            ;;
    esac

    env \
        CGO_ENABLED=0 \
        GOOS=linux \
        GOARCH="${_goarch}" \
        GOARM="${_goarm:-}" \
        go build \
            -mod=vendor \
            -trimpath \
            -ldflags="-s -w -X main.Version=v${pkgver}" \
            -o iptv-tunerr \
            ./cmd/iptv-tunerr
}

package() {
    cd "${srcdir}/iptvtunerr-${pkgver}"

    install -Dm755 iptv-tunerr "${pkgdir}/usr/bin/iptv-tunerr"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "${srcdir}/iptvtunerr.service" "${pkgdir}/usr/lib/systemd/system/iptvtunerr.service"
    install -Dm644 "${srcdir}/iptvtunerr.env" "${pkgdir}/etc/iptvtunerr/iptvtunerr.env"
    install -Dm644 "${srcdir}/iptvtunerr.sysusers" "${pkgdir}/usr/lib/sysusers.d/iptvtunerr.conf"
    install -Dm644 "${srcdir}/iptvtunerr.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/iptvtunerr.conf"
}
