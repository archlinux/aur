# Maintainer: Carl George < arch at cgtx dot us >

_provider=github
_tld=com
_project=mholt
_repo=caddy
_import="$_provider.$_tld/$_project/$_repo"

pkgname=caddy
pkgver=0.10.3
pkgrel=1
pkgdesc='HTTP/2 web server with automatic HTTPS'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url='https://caddyserver.com'
license=('Apache')
backup=('etc/caddy/Caddyfile')
install='caddy.install'
makedepends=('go>=1.8.1' 'git')
source=("https://$_import/archive/v$pkgver/$_repo-$pkgver.tar.gz"
        'https://caddyserver.com/resources/images/brand/caddy-at-your-service-white.svg'
        'index.html'
        'caddy.service'
        'caddy.tmpfiles'
        'Caddyfile'
        'enable-dnsproviders.patch')
sha256sums=('fbbecb2eed383fd9deb9177f899ba8c8ebf15f767f4fefa0cc558f07ed337260'
            'e679dd79fd92dc351fc190c7af529c73e3896986aaa6b7c0ae01e561398d6b85'
            '6db7aec45e95bbbf770ce4d120a60d8e4992d2262a8ebf668521179279aa5ae7'
            'c1d4d1f295177f0963583b7ad29e04afdf9f39f9e916be6135868a327fb37ef4'
            'bd4d912d083be176727882ccc1bbe577a27cc160db09238e5edc05ba458aebce'
            '4e30255be85d3b4f138860f61264aea3960d8873955d3a96eb8e39f1baf9aa65'
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
    go get -v -d ./src/$_import/...
    go build -v -o ../caddy -ldflags "-X $_import/caddy/caddymain.gitTag=v$pkgver" $_import/caddy
}

package() {
    install --verbose -D --mode 0755 caddy "$pkgdir/usr/bin/caddy"
    install --verbose -D --mode 0644 caddy.service "$pkgdir/usr/lib/systemd/system/caddy.service"
    install --verbose -D --mode 0644 caddy.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/caddy.conf"
    install --verbose -D --mode 0644 Caddyfile "$pkgdir/etc/caddy/Caddyfile"
    install --verbose -D --mode 0644 index.html "$pkgdir/usr/share/caddy/index.html"
    install --verbose -D --mode 0644 caddy-at-your-service-white.svg "$pkgdir/usr/share/caddy/caddy-at-your-service-white.svg"
}
