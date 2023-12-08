# Maintainer: ZhangHua <zhanghuadedn at gmail dot com>
# Contributor: Nicolas Stalder <n+archlinux@stalder.io>

pkgname=caddy-trojan
pkgver=2.7.6
pkgrel=1
pkgdesc="Caddy web server with trojan support"
arch=('x86_64' 'aarch64')
url="https://github.com/imgk/caddy-trojan"
license=('GPL3')
makedepends=('go' 'xcaddy')
provides=("caddy")
conflicts=("caddy")
source=(
    "caddy.hook"
    "caddy.sysusers"
    "caddy.tmpfiles"
    "https://raw.githubusercontent.com/caddyserver/dist/v${pkgver}/init/caddy.service"
    "https://raw.githubusercontent.com/caddyserver/dist/v${pkgver}/init/caddy-api.service"
    "https://raw.githubusercontent.com/caddyserver/dist/v${pkgver}/config/Caddyfile"
    "https://raw.githubusercontent.com/caddyserver/dist/v${pkgver}/welcome/index.html"
)
sha256sums=('dfadb1f4a1f82024a11c110624680f98b3818305a16dd013363ca398020611ad'
            'a9294eeba17a8fd57cf11cef21e2eb3719a016646eeac0764a0d9f9f380a40ef'
            '99282b1a57857d23b97883dfd7dd147005956cc04405630d6e4d73bb7069f5ba'
            '86634b4325be1fbdf2e566f27b1e88febb0cc0104c3317784d8e37399d370423'
            '551bc43abc356690cc9712d237472ecf8a7c6b01a9c133f9e5496dc12210e154'
            '66177d46fa761acb07208065db9b0274cb1b12c02ac43b9bfc9857b698b1ccfe'
            '46e68c485ddce12932910cdc4034a7c2cda77d4de1df0f7b809b93a9153bcd3e')

build() {
    MODULES=(
        github.com/caddy-dns/route53
        github.com/caddy-dns/cloudflare
        github.com/caddy-dns/alidns
        github.com/caddy-dns/vultr
        github.com/caddy-dns/dnspod
        github.com/caddy-dns/duckdns
        #github.com/caddy-dns/gandi
        # Checksum mismatch issue, see https://github.com/libdns/gandi/issues/9
        github.com/hairyhenderson/caddy-teapot-module
        github.com/caddyserver/transform-encoder
        github.com/mholt/caddy-webdav
        github.com/imgk/caddy-trojan
        github.com/imgk/caddy-pprof
        # Let caddy truse CDN's X-Forwarded-For header
        # Only cloudflare is found now.
        github.com/WeidiDeng/caddy-cloudflare-ip
    )
    xcaddy build v${pkgver} ${MODULES[@]/#/--with }

}

package() {
    install -Dm755 caddy "${pkgdir}/usr/bin/caddy"

    install -Dm644 "${srcdir}/Caddyfile" "${pkgdir}/usr/share/caddy/Caddyfile"
    install -Dm644 "${srcdir}/index.html" "${pkgdir}/usr/share/caddy/index.html"

    install -Dm644 "${srcdir}/caddy.service" "${pkgdir}/usr/lib/systemd/system/caddy.service"
    install -Dm644 "${srcdir}/caddy-api.service" "${pkgdir}/usr/lib/systemd/system/caddy-api.service"
    install -Dm644 "${srcdir}/caddy.sysusers" "${pkgdir}/usr/lib/sysusers.d/caddy.conf"
    install -Dm644 "${srcdir}/caddy.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/caddy.conf"

    install -Dm644 "${srcdir}/caddy.hook" "${pkgdir}/usr/share/libalpm/hooks/caddy-trojan.hook"
}
