# Maintainer: Fernando Barillas < aur at fbis251 dot com >
# Contributor: Wei Congrui < crvv.mail at gmail dot com >
# Contributor: Carl George < arch at cgtx dot us >
# Contributor: Eric Engeström <eric at engestrom dot ch>
# Contributor: Andreas Linz <klingt.net at gmail dot com>

_gopkgname='github.com/mholt/caddy'
_name="caddy"

pkgname="${_name}-no-telemetry"
pkgver=1.0.0
pkgrel=1
pkgdesc='HTTP/2 Web Server with Automatic HTTPS. Telemetry disabled in source'
arch=('x86_64' 'i686' 'armv6h' 'armv7h' 'aarch64')
url='https://caddyserver.com'
license=('Apache')
backup=('etc/caddy/caddy.conf')
provides=("$_name")
conflicts=("$_name")
install='caddy.install'
makedepends=('go>=1.12' 'git')
source=("https://$_gopkgname/archive/v$pkgver/$_name-$pkgver.tar.gz"
        'https://caddyserver.com/resources/images/brand/caddy-at-your-service-white.svg'
        'index.html'
        'caddy.service'
        'caddy.tmpfiles'
        'caddy.conf'
        'plugins.go'
        '0001-disable-telemetry.patch')
sha256sums=('1c8b435a79e21b9832c7a8a88c44e70bc80434ca3719853d2b1092ffbbbbff7d'
            'e679dd79fd92dc351fc190c7af529c73e3896986aaa6b7c0ae01e561398d6b85'
            '6db7aec45e95bbbf770ce4d120a60d8e4992d2262a8ebf668521179279aa5ae7'
            '0466a41290db84402ca41cf32c0fc5b66b112a9d85b71d1619ae97b5a3dd2740'
            'c8f002f5ba59985a643600dc3c871e18e110903aa945ef3f2da7c9edd39fbd7a'
            '80520b80ccabf077a3269f6a1bf55faa3811ef5adce115131b35ef2044d37b64'
            'f5a0fbb961e7c9ecf99e88d0959a3164cbea54660c1c08c3ba3cdf1d45563929'
            'e0183ff5631283e259dffe92d64974cf1d17c9f7d758fb24b9dcb4cf1d2586d4')

patch_plugins() {
    IFS=''
    n=0
    while read -r line; do
        echo "$line"
        if [[ $n = 0 && $line =~ ^import ]]; then
            go run $srcdir/plugins.go "${plugins[@]}"
            n=1
        fi
    done
}

prepare() {
    export GOPATH="$srcdir/build"
    rm -rf "$GOPATH/src/$_gopkgname"
    mkdir --parents `dirname "$GOPATH/src/$_gopkgname"`
    mv -Tv "$srcdir/$_name-$pkgver" "$GOPATH/src/$_gopkgname"

    if [ ${#plugins[@]} -gt 0 ]; then
        echo enabled plugins: ${plugins[@]}
        cd $GOPATH/src/$_gopkgname/caddy/caddymain/
        patch_plugins < run.go > run1.go
        mv run1.go run.go
        go get -v -d $_gopkgname/caddy/caddymain
    fi

    # Disable telemetry collection
    cd "${srcdir}/build/src/$_gopkgname"
    patch -p1 < "${srcdir}/0001-disable-telemetry.patch"
}

build() {
    export GO111MODULE=on
    export GOPATH="$srcdir/build"
    cd "${srcdir}/build/src/$_gopkgname"
    go build -v -o $srcdir/caddy -ldflags "-X $_gopkgname/caddy/caddymain.gitTag=v$pkgver" $_gopkgname/caddy
    go clean --modcache
}

package() {
    install -D -m 0755 caddy "$pkgdir/usr/bin/caddy"
    install -D -m 0644 caddy-at-your-service-white.svg "$pkgdir/usr/share/caddy/caddy-at-your-service-white.svg"
    install -D -m 0644 index.html "$pkgdir/usr/share/caddy/index.html"
    install -D -m 0644 caddy.service "$pkgdir/usr/lib/systemd/system/caddy.service"
    install -D -m 0644 caddy.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/caddy.conf"
    install -D -m 0644 caddy.conf "$pkgdir/etc/caddy/caddy.conf"
    install -d -m 0755 "$pkgdir/etc/caddy/caddy.conf.d"
}

plugins=(
#    'dns'
#    'docker'
#    'dyndns'
#    'hook.service'
#    'http.authz'
#    'http.awses'
#    'http.awslambda'
#    'http.cache'
#    'http.cgi'
#    'http.cors'
#    'http.datadog'
#    'http.expires'
#    'http.filemanager'
#    'http.filter'
#    'http.forwardproxy'
#    'http.geoip'
#    'http.git'
#    'http.gopkg'
#    'http.grpc'
#    'http.hugo'
#    'http.ipfilter'
#    'http.jekyll'
#    'http.jwt'
#    'http.locale'
#    'http.login'
#    'http.mailout'
#    'http.minify'
#    'http.nobots'
#    'http.prometheus'
#    'http.proxyprotocol'
#    'http.ratelimit'
#    'http.realip'
#    'http.reauth'
#    'http.restic'
#    'http.upload'
#    'http.webdav'
#    'net'
#    'tls.dns.auroradns'
#    'tls.dns.azure'
#    'tls.dns.cloudflare'
#    'tls.dns.cloudxns'
#    'tls.dns.digitalocean'
#    'tls.dns.dnsimple'
#    'tls.dns.dnsmadeeasy'
#    'tls.dns.dnspod'
#    'tls.dns.dyn'
#    'tls.dns.exoscale'
#    'tls.dns.gandi'
#    'tls.dns.gandiv5'
#    'tls.dns.godaddy'
#    'tls.dns.googlecloud'
#    'tls.dns.lightsail'
#    'tls.dns.linode'
#    'tls.dns.namecheap'
#    'tls.dns.ns1'
#    'tls.dns.otc'
#    'tls.dns.ovh'
#    'tls.dns.powerdns'
#    'tls.dns.rackspace'
#    'tls.dns.rfc2136'
#    'tls.dns.route53'
#    'tls.dns.vultr'
)
