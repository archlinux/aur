# Maintainer: ZhangHua <zhanghuadedn at gmail dot com>
# Contributor: Nicolas Stalder <n+archlinux@stalder.io>

pkgname=caddy-trojan
pkgver=2.10.2
pkgrel=1
pkgdesc="Caddy web server with trojan support"
arch=('x86_64' 'aarch64')
url="https://github.com/imgk/caddy-trojan"
license=('GPL-3.0-only')
depends=("glibc")
makedepends=('go')
provides=("caddy=${pkgver}")
conflicts=("caddy")
source=("caddy.hook"
        "caddy.sysusers"
        "caddy.tmpfiles"
        "https://raw.githubusercontent.com/caddyserver/dist/v${pkgver}/init/caddy.service"
        "https://raw.githubusercontent.com/caddyserver/dist/v${pkgver}/init/caddy-api.service"
        "https://raw.githubusercontent.com/caddyserver/dist/v${pkgver}/config/Caddyfile"
        "https://raw.githubusercontent.com/caddyserver/dist/v${pkgver}/welcome/index.html"
        "caddy-${pkgver}.tar.gz::https://github.com/caddyserver/caddy/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('dfadb1f4a1f82024a11c110624680f98b3818305a16dd013363ca398020611ad'
            'a9294eeba17a8fd57cf11cef21e2eb3719a016646eeac0764a0d9f9f380a40ef'
            '99282b1a57857d23b97883dfd7dd147005956cc04405630d6e4d73bb7069f5ba'
            '6c271e030644bd36a0c8956885934f16c928f88202bc126f12cde519ef9693ff'
            'a794bbf7d890eb9e1231bbad251890f87870815a96e3820b28a71819ba9f9c14'
            '66177d46fa761acb07208065db9b0274cb1b12c02ac43b9bfc9857b698b1ccfe'
            '70a45d667679109cd6b25502554597f21536ee995ada0549251167bd171533b9'
            'f63f46b7ae68ced0a5c2e31df1b6dfc7656117d162a1bc7fed4bd4afd14ddc8f')

prepare() {
    local -a MODULES=(
        #github.com/caddy-dns/route53
        github.com/caddy-dns/cloudflare
        github.com/caddy-dns/alidns
        github.com/caddy-dns/vultr
        #github.com/caddy-dns/dnspod
        github.com/caddy-dns/duckdns
        github.com/caddy-dns/gandi
        github.com/hairyhenderson/caddy-teapot-module
        github.com/caddyserver/transform-encoder
        github.com/mholt/caddy-webdav
        github.com/imgk/caddy-trojan
        github.com/imgk/caddy-pprof
        # Let caddy trust CDN's X-Forwarded-For header
        # Only cloudflare is found now.
        github.com/WeidiDeng/caddy-cloudflare-ip
    )
    cd "${srcdir}/caddy-${pkgver}/cmd/caddy"
    for m in "${MODULES[@]}"
    do
        echo "Adding module $m..."
        sed -i "/plug in Caddy modules here/a _ \"$m\"" main.go
        go get -modcacherw "$m"
    done
    go get -modcacherw .
}
build() {
    cd "${srcdir}/caddy-${pkgver}/cmd/caddy"
    export CGO_LDFLAGS="${LDFLAGS}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build .

    for i in zsh bash fish; do
        ./caddy completion $i >caddy.${i}
    done

}

package() {
    install -Dm755 "${srcdir}/caddy-${pkgver}/cmd/caddy/caddy" "${pkgdir}/usr/bin/caddy"
    install -Dm644 "${srcdir}/caddy-${pkgver}/cmd/caddy/caddy.zsh" "${pkgdir}/usr/share/zsh/site-functions/_caddy"
    install -Dm644 "${srcdir}/caddy-${pkgver}/cmd/caddy/caddy.bash" "${pkgdir}/usr/share/bash-completion/completions/caddy"
    install -Dm644 "${srcdir}/caddy-${pkgver}/cmd/caddy/caddy.fish" -t "${pkgdir}/usr/share/fish/vendor_completions.d"

    install -Dm644 "${srcdir}/Caddyfile" "${pkgdir}/usr/share/caddy/Caddyfile"
    install -Dm644 "${srcdir}/index.html" "${pkgdir}/usr/share/caddy/index.html"

    install -Dm644 "${srcdir}/caddy.service" "${pkgdir}/usr/lib/systemd/system/caddy.service"
    install -Dm644 "${srcdir}/caddy-api.service" "${pkgdir}/usr/lib/systemd/system/caddy-api.service"
    install -Dm644 "${srcdir}/caddy.sysusers" "${pkgdir}/usr/lib/sysusers.d/caddy.conf"
    install -Dm644 "${srcdir}/caddy.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/caddy.conf"

    install -Dm644 "${srcdir}/caddy.hook" "${pkgdir}/usr/share/libalpm/hooks/caddy-trojan.hook"
}
