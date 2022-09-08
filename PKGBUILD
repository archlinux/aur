# Maintainer: ZhangHua <zhanghuadedn at gmail dot com>
# Contributor: Nicolas Stalder <n+archlinux@stalder.io>

pkgname=caddy-trojan
pkgver=2.5.2
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
    "caddy.service"
    "caddy.sysusers"
    "https://raw.githubusercontent.com/caddyserver/dist/master/config/Caddyfile"
    "https://raw.githubusercontent.com/caddyserver/dist/master/welcome/index.html"
)
sha256sums=('fca52680914605bdf88e015ca3d79bb89def95877fb7369b67e9a0bfe3f85aca'
            'c525a5f83459ff0abf73b38352fb8663884e1b4b6175f48bb7a3698e3c673074'
            '07436f8aa8fff8de61467e97ce4300431d6de763693b152160b21cca4a2a9629'
            '66177d46fa761acb07208065db9b0274cb1b12c02ac43b9bfc9857b698b1ccfe'
            '19dfa250bdb962c50a49eb94706482c5c3d4ecd6df41f667a4bb5649d0490ce4')

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
    )
    xcaddy build v${pkgver} ${MODULES[@]/#/--with }

}

package() {
    install -Dm755 caddy "${pkgdir}/usr/bin/caddy"

    install -Dm644 "${srcdir}/Caddyfile" "${pkgdir}/usr/share/caddy/Caddyfile"
    install -Dm644 "${srcdir}/index.html" "${pkgdir}/usr/share/caddy/index.html"

    install -Dm644 "${srcdir}/caddy.service" "${pkgdir}/usr/lib/systemd/system/caddy.service"
    install -Dm644 "${srcdir}/caddy.sysusers" "${pkgdir}/usr/lib/sysusers.d/caddy.conf"

    install -Dm644 "${srcdir}/caddy.hook" "${pkgdir}/usr/share/libalpm/hooks/caddy-trojan.hook"
}
