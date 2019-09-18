# Maintainer: Wei Congrui < crvv.mail at gmail dot com >
# Maintainer: Carl George < arch at cgtx dot us >
# Contributor: Eric Engeström <eric at engestrom dot ch>
# Contributor: Andreas Linz <klingt.net at gmail dot com>

_gopkgname='github.com/caddyserver/caddy'
_forwardproxy_pkgname='github.com/caddyserver/forwardproxy'

# if you're building with gcc-go, then it'll fail to
# build some asm files needed by quic-go
if `pacman -Qq gcc-go >/dev/null 2>/dev/null`
then
	USING_GCCGO=y
	GOFLAGS="-gccgoflags -O2"
	depends=('gcc-libs')
	makedepends=('gcc-go>=9.1.0')
else
	makedepends=('go>=1.12')
fi

pkgname=caddy-with-quic
_pkgbase=caddy
pkgver=1.0.3
_forwardproxy_ver=1.0.1
pkgrel=1
pkgdesc='HTTP/2 Web Server with Automatic HTTPS, with forwardproxy plugin and quic support, works best with naiveproxy'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url='https://github.com/klzgrad/naiveproxy/wiki/Caddy-with-QUIC'
license=('Apache')
backup=('etc/caddy/caddy.conf')
install='caddy.install'
provides=('caddy')
conflicts=('caddy')
source=("https://$_gopkgname/archive/v$pkgver/$_pkgbase-$pkgver.tar.gz"
	"https://$_forwardproxy_pkgname/archive/$_forwardproxy_ver.tar.gz"
	'https://caddyserver.com/resources/images/brand/caddy-at-your-service-white.svg'
	'index.html'
	'caddy.service'
	'caddy.tmpfiles'
	'caddy.conf'
	'plugins.patch')
sha256sums=('c1c7b337a5008d28c1956fd4f057104a78d0e24b74c30867cea988369b61fed3'
            '7df120d88633a545b5e31a90528611bd0267871f086f2fb00effaeb0c9499beb'
            'e679dd79fd92dc351fc190c7af529c73e3896986aaa6b7c0ae01e561398d6b85'
            '6db7aec45e95bbbf770ce4d120a60d8e4992d2262a8ebf668521179279aa5ae7'
            '69e25def317a6172011472bd060655142f3085a0c81392f8a7a9c42b6a58bbd9'
            'bd4d912d083be176727882ccc1bbe577a27cc160db09238e5edc05ba458aebce'
            '80520b80ccabf077a3269f6a1bf55faa3811ef5adce115131b35ef2044d37b64'
            '3bbd27ce67ec977544eb9980932bf8d1ad88da344cd7f6a25e0583893d14c9fd')

prepare() {
	export GO111MODULE=on
        pushd "$srcdir/$_pkgbase-$pkgver"
        patch -p0 -i "$srcdir/plugins.patch"
        # fix rewrite: rewrite the URI instead of just the path
        # https://github.com/mholt/caddy/issues/2129
        sed -i 's/URL.Path/URL.RequestURI()/g' caddyhttp/rewrite/rewrite.go
        if [ "$USING_GCCGO" == y ]
        then
        	patch -p1 -i "$srcdir/noquic_aesni.patch"
        fi
	go mod download
	go mod verify
	go mod vendor
	sed -i -e 's,len(path) == 0 || ,,g' ./vendor/github.com/lucas-clemente/quic-go/h2quic/request.go
}

build() {
	export GO111MODULE=on
	cd "$srcdir/$_pkgbase-$pkgver/caddy"
	go build -mod=vendor -v -o $srcdir/caddy $GOFLAGS $_gopkgname/caddy
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
