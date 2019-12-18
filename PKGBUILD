# Maintainer: Wei Congrui < crvv.mail at gmail dot com >
# Maintainer: Carl George < arch at cgtx dot us >
# Contributor: Eric Engeström <eric at engestrom dot ch>
# Contributor: Andreas Linz <klingt.net at gmail dot com>

_gopkgname='github.com/caddyserver/caddy'
_cgipkgname='github.com/jung-kurt/caddy-cgi'

# if you're building with gcc-go, then it'll fail to
# build some asm files needed by quic-go
if `pacman -Qq gcc-go >/dev/null 2>/dev/null`
then
	echo "gcc-go not supported yet."
	exit 1
#	USING_GCCGO=y
#	GOFLAGS="-gccgoflags -O2"
#	depends=('gcc-libs')
#	makedepends=('gcc-go>=9.1.0')
else
	makedepends=('go>=1.13')
fi

pkgname=caddy-with-cgi
_pkgbase=caddy
pkgver=1.0.4
_cgiver=1.11.4
pkgrel=1
pkgdesc='HTTP/2 Web Server with Automatic HTTPS, with caddy-cgi plugin and gcc-go support'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url='https://caddyserver.com'
license=('Apache')
backup=('etc/caddy/caddy.conf')
install='caddy.install'
provides=('caddy')
conflicts=('caddy')
source=("https://$_gopkgname/archive/v$pkgver/$_pkgbase-$pkgver.tar.gz"
	"https://$_cgipkgname/archive/v$_cgiver.tar.gz"
	'https://caddyserver.com/resources/images/brand/caddy-at-your-service-white.svg'
	'index.html'
	'caddy.service'
	'caddy.tmpfiles'
	'caddy.conf'
	'noquic_aesni.patch'
	'plugins.patch')
sha256sums=('bf81245d2b347c89a8e8aa358a224b722d55cb6e1c266bbdffbe6acc54d130a5'
	'a1c3982093f599b11b05ed9040fb3c0d8da960023226c82f125dbbb0cac9634f'
	'e679dd79fd92dc351fc190c7af529c73e3896986aaa6b7c0ae01e561398d6b85'
	'6db7aec45e95bbbf770ce4d120a60d8e4992d2262a8ebf668521179279aa5ae7'
	'69e25def317a6172011472bd060655142f3085a0c81392f8a7a9c42b6a58bbd9'
	'bd4d912d083be176727882ccc1bbe577a27cc160db09238e5edc05ba458aebce'
	'80520b80ccabf077a3269f6a1bf55faa3811ef5adce115131b35ef2044d37b64'
	'1c121388b2741bc8b02fe01950d2241e67fef5d2bd806486c108775007461c8a'
	'1ca21fbf9b865f340aa6e6e5be31d1a5a6c422d23ab9a5b9d37cda589bbf829c')

prepare() {
	export GO111MODULE=on
	mv -Tv "$srcdir/caddy-cgi-$_cgiver" "$srcdir/$_pkgbase-$pkgver/caddy-cgi"
	cd "$srcdir/$_pkgbase-$pkgver"
	rm -v "$srcdir/$_pkgbase-$pkgver/caddy-cgi/go.mod" "$srcdir/$_pkgbase-$pkgver/caddy-cgi/go.sum"
	patch -p1 -i "$srcdir/plugins.patch"
	# fix rewrite: rewrite the URI instead of just the path
	# https://github.com/mholt/caddy/issues/2129
	sed -i 's/URL.Path/URL.RequestURI()/g' caddyhttp/rewrite/rewrite.go
#	if [ "$USING_GCCGO" == y ]
#	then
#		true#patch -p1 -i "$srcdir/noquic_aesni.patch"
#	fi
	go mod download
	go mod verify
}

build() {
	export GO111MODULE=on
	cd "$srcdir/$_pkgbase-$pkgver/caddy"
	go build -v -o $srcdir/caddy $GOFLAGS $_gopkgname/caddy
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
