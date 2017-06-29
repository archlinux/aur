# Maintainer: Carl George < arch at cgtx dot us >

_provider=github
_tld=com
_project=mholt
_repo=caddy
_import="$_provider.$_tld/$_project/$_repo"

pkgname=caddy
pkgver=0.10.4
pkgrel=1
pkgdesc='HTTP/2 web server with automatic HTTPS'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url='https://caddyserver.com'
license=('Apache')
backup=('etc/caddy/caddy.conf')
install='caddy.install'
makedepends=('go>=1.8.1' 'git')
source=("https://$_import/archive/v$pkgver/$_repo-$pkgver.tar.gz"
        'https://caddyserver.com/resources/images/brand/caddy-at-your-service-white.svg'
        'index.html'
        'caddy.service'
        'caddy.tmpfiles'
        'caddy.conf'
        'enable-dnsproviders.patch')
sha256sums=('411e6bf10520e938712887a31f2132bfd19e2c79543e7aef158f7c77d03ae2bf'
            'e679dd79fd92dc351fc190c7af529c73e3896986aaa6b7c0ae01e561398d6b85'
            '6db7aec45e95bbbf770ce4d120a60d8e4992d2262a8ebf668521179279aa5ae7'
            '69e25def317a6172011472bd060655142f3085a0c81392f8a7a9c42b6a58bbd9'
            'bd4d912d083be176727882ccc1bbe577a27cc160db09238e5edc05ba458aebce'
            '80520b80ccabf077a3269f6a1bf55faa3811ef5adce115131b35ef2044d37b64'
            '158c9a0f4327384c244846badc5295eab2a4cf16c354a3669fc0cce1c34e4a91')

prepare() {
    cd $_repo-$pkgver
    patch -p1 < ../enable-dnsproviders.patch
    mkdir -p src/$_provider.$_tld/$_project
    ln -s ../../.. src/$_import
}

build() {
    cd $_repo-$pkgver
    export GOPATH=$(pwd)
    go get -v -d github.com/caddyserver/dnsproviders/...
    go build -v -o ../caddy -ldflags "-X $_import/caddy/caddymain.gitTag=v$pkgver" $_import/caddy
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
