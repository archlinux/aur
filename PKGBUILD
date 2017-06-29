# Maintainer: Carl George < arch at cgtx dot us >

_gopkgname='github.com/mholt/caddy'

pkgname=caddy
pkgver=0.10.4
pkgrel=2
pkgdesc='HTTP/2 Web Server with Automatic HTTPS'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url='https://caddyserver.com'
license=('Apache')
backup=('etc/caddy/caddy.conf')
install='caddy.install'
makedepends=('go>=1.8.1' 'git')
source=("https://$_gopkgname/archive/v$pkgver/$pkgname-$pkgver.tar.gz"
        'https://caddyserver.com/resources/images/brand/caddy-at-your-service-white.svg'
        'index.html'
        'caddy.service'
        'caddy.tmpfiles'
        'caddy.conf'
        'plugins.go')
sha256sums=('411e6bf10520e938712887a31f2132bfd19e2c79543e7aef158f7c77d03ae2bf'
            'e679dd79fd92dc351fc190c7af529c73e3896986aaa6b7c0ae01e561398d6b85'
            '6db7aec45e95bbbf770ce4d120a60d8e4992d2262a8ebf668521179279aa5ae7'
            '69e25def317a6172011472bd060655142f3085a0c81392f8a7a9c42b6a58bbd9'
            'bd4d912d083be176727882ccc1bbe577a27cc160db09238e5edc05ba458aebce'
            '80520b80ccabf077a3269f6a1bf55faa3811ef5adce115131b35ef2044d37b64'
            'f5a0fbb961e7c9ecf99e88d0959a3164cbea54660c1c08c3ba3cdf1d45563929')

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
    rm -rf "$GOPATH/src/$gopkgname"
    mkdir --parents `dirname "$GOPATH/src/$_gopkgname"`
    mv -Tv "$srcdir/$pkgname-$pkgver" "$GOPATH/src/$_gopkgname"

    if [ ${#plugins[@]} -gt 0 ]; then
        echo enabled plugins: ${plugins[@]}
        cd $GOPATH/src/$_gopkgname/caddy/caddymain/
        patch_plugins < run.go > run1.go
        mv run1.go run.go
        go get -v -d $_gopkgname/caddy/caddymain
    fi
}

build() {
    export GOPATH="$srcdir/build"
    go build -v -o $srcdir/caddy -ldflags "-X $_gopkgname/caddy/caddymain.gitTag=v$pkgver" $_gopkgname/caddy
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
#    'hook.pluginloader'
#    'hook.service'
#    'http.authz'
#    'http.awslambda'
#    'http.cgi'
#    'http.cors'
#    'http.datadog'
#    'http.expires'
#    'http.filemanager'
#    'http.filter'
#    'http.git'
#    'http.grpc'
#    'http.hugo'
#    'http.ipfilter'
#    'http.jwt'
#    'http.login'
#    'http.mailout'
#    'http.minify'
#    'http.prometheus'
#    'http.proxyprotocol'
#    'http.ratelimit'
#    'http.realip'
#    'http.reauth'
#    'http.upload'
#    'net'
#    'tls.dns.cloudflare'
#    'tls.dns.digitalocean'
#    'tls.dns.dnsimple'
#    'tls.dns.dnspod'
#    'tls.dns.dyn'
#    'tls.dns.exoscale'
#    'tls.dns.gandi'
#    'tls.dns.googlecloud'
#    'tls.dns.linode'
#    'tls.dns.namecheap'
#    'tls.dns.ovh'
#    'tls.dns.rackspace'
#    'tls.dns.rfc2136'
#    'tls.dns.route53'
#    'tls.dns.vultr'
)
