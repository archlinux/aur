# Maintainer: Edouard Lafon <dev+arch@elafon.98.wf>

pkgname=nodejs-mumble-web
pkgver=0.5.1
pkgrel=1
pkgdesc="An HTML5 Mumble client - stable"
arch=('any')
url="https://github.com/johni0702/mumble-web"
license=('custom:ISC')
optdepends=(
	'websockify: Websocket support between the HTML5 client and a Mumble server'
	'nginx: supported reverse proxy'
	'apache: supported reverse proxy'
	'caddy: supported reverse proxy'
	'hiawatha: supported reverse proxy'
	## Work in progress
	#'mumble-web-runit: running websockify as a runit service'
	#'mumble-web-systemd: running websockify as a SystemD service'
)
makedepends=('npm' 'jq')
backup=("usr/lib/node_modules/$pkgname/dist/config.local.js")
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz"
        "LICENSE")
noextract=("$pkgname-$pkgver.tgz")
sha512sums=('87de66921c5ac00cfd91c6dde064d3427dbbc979c6e94f18cc3e84e77799e9f2bba361818f08ceedc08ded91865decde24da306e6e3d74f3a42ec5d231105bf6'
            '0ccf490943b514c97243b5761c798e1af8cb79793b0b10063ee7ffdfc67e73bc0f962d8ebadc1b3cb88dab7ccd3d98b448e2242313adc528beb5211ea0ca7f2a')

package() {
	npm install -g --user root --prefix "$pkgdir/usr" "$srcdir/$pkgname-$pkgver.tgz"
	find "$pkgdir/usr" -type d -exec chmod 755 {} +

	# Remove references to $pkgdir
	find "$pkgdir" -type f -name package.json -print0 | xargs -0 sed -i "/_where/d"

	# Remove references to $srcdir
	local tmppackage="$(mktemp)"
	local pkgjson="$pkgdir/usr/lib/node_modules/$pkgname/package.json"
	jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
	mv "$tmppackage" "$pkgjson"
	chmod 644 "$pkgjson"

	# Install license since the package doesn't include it
	install -Dm 644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	# Move README to doc
	install -dm 755 $pkgdir/usr/share/doc/$pkgname/
	mv "$pkgdir/usr/lib/node_modules/$pkgname/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"

	# npm gives ownership of ALL FILES to build user
	# https://bugs.archlinux.org/task/63396
	chown -R root:root "${pkgdir}"
}

