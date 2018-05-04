# Maintainer: Wei Congrui < crvv.mail at gmail dot com >
# Maintainer: Carl George < arch at cgtx dot us >
# Contributor: Eric Engeström <eric at engestrom dot ch>
# Contributor: Andreas Linz <klingt.net at gmail dot com>

_gopkgname='github.com/mholt/caddy'
_cgipkgname='github.com/jung-kurt/caddy-cgi'

# if you're building with gcc-go, then it'll fail to
# build some asm files needed by quic-go
if `pacman -Qq gcc-go >/dev/null 2>/dev/null`
then
	NOQUIC=y
	GOFLAGS="-gccgoflags -O2"
fi

pkgname=caddy-with-cgi
_pkgbase=caddy
pkgver=0.10.14
_cgiver=1.6
pkgrel=2
pkgdesc='HTTP/2 Web Server with Automatic HTTPS, with caddy-cgi plugin and gcc-go support'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url='https://caddyserver.com'
license=('Apache')
backup=('etc/caddy/caddy.conf')
install='caddy.install'
makedepends=('go>=1.9')
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
sha256sums=('13feb836e85af3525b3e95f42635566f14d171edc9776881f59fbf61fa45d345'
	'7c5b82831f496a182f2631fac840fc0712b41afcbf4b6ce3d4e6a235eef88580'
	'e679dd79fd92dc351fc190c7af529c73e3896986aaa6b7c0ae01e561398d6b85'
	'6db7aec45e95bbbf770ce4d120a60d8e4992d2262a8ebf668521179279aa5ae7'
	'69e25def317a6172011472bd060655142f3085a0c81392f8a7a9c42b6a58bbd9'
	'bd4d912d083be176727882ccc1bbe577a27cc160db09238e5edc05ba458aebce'
	'80520b80ccabf077a3269f6a1bf55faa3811ef5adce115131b35ef2044d37b64'
	'aea16a7850fed36899a0134e564f59657169e338c51e55054d9553a7dee209de'
	'c8d56b2295e04720ae8fe9493a7931bb2dba5c568fbcae469887ac143bd6b934')

prepare() {
	export GOPATH="$srcdir/build"
	rm -rf "$GOPATH/src/$gopkgname" "$GOPATH/src/$_cgipkgname"
	mkdir --parents `dirname "$GOPATH/src/$_gopkgname"` `dirname "$GOPATH/src/$_cgipkgname"`
	mv -Tv "$srcdir/$_pkgbase-$pkgver" "$GOPATH/src/$_gopkgname"
	mv -Tv "$srcdir/caddy-cgi-$_cgiver" "$GOPATH/src/$_cgipkgname"
	cd "$GOPATH/src/$_gopkgname"
	patch -p0 -i "$srcdir/plugins.patch"
	# fix rewrite: rewrite the URI instead of just the path
	# https://github.com/mholt/caddy/issues/2129
	sed -i 's/URL.Path/URL.RequestURI()/g' caddyhttp/rewrite/rewrite.go
	if [ "$NOQUIC" == y ]
	then
		patch -p1 -i "$srcdir/noquic_aesni.patch"
	fi
}

build() {
	export GOPATH="$srcdir/build"
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
