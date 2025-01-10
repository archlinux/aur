# Maintainer: zoorat <zoorat [at] protonmail [dot] com>

_npmname=bittorrent-tracker
pkgname=webtorrent-$_npmname
pkgver=11.2.0
pkgrel=1

pkgdesc="Simple, robust, BitTorrent tracker (client & server) implementation"
arch=('x86_64')
url="https://github.com/webtorrent/bittorrent-tracker"
license=("MIT")

depends=("glibc" "nodejs")
makedepends=("npm" "jq")
# provides=("$_npmname")
# conflicts=("$_npmname")
changelog="changelog.md"

source=("https://registry.npmjs.org/${_npmname}/-/${_npmname}-${pkgver}.tgz"
	"https://raw.githubusercontent.com/webtorrent/bittorrent-tracker/master/LICENSE"
	"file://webtorrent-bittorrent-tracker.service"
	"file://webtorrent-bittorrent-tracker.conf")
noextract=("${_npmname}-${pkgver}.tgz")
b2sums=('c1788337a04c697c6c36233519e659b6549ef9f67ccbe12d219c91fcf8ed0873d1982d98193d321282a738a22989bea2e35956fdf4b0304b3fb946cb5a6e4a66'
	'3890a8cd095787f6ab383fe3ca0a0bf0999d80a7ea65627bb1a50f1c2690987f53e0619df5745ba47d6ef46d32e03573b5a52330a7c857220e4db96a33203019'
	'04597f1a6ab59151a31df5fb5d9220b1bea69faba6f6bc19dfd9f1091800a195c7bb4ac2307a8d59a0039f46877961136ca19e1351f8a07a244044067ba26c99'
	'72f2b302238d243cd3d5673404deeecd92a05b610b036625ff1c57f12be324312a6495fdf351e37299470157ed6adea97b699ffdba431e9389c426ba1224053b')

# Document: https://wiki.archlinux.org/title/Node.js_package_guidelines
package() {
	# Install using Using npm
	npm install -s -g \
		--cache "${srcdir}/npm-cache" \
		--prefix "${pkgdir}/usr" \
		"${srcdir}/${_npmname}-${pkgver}.tgz"

	# Fix ownership of ALL FILES
	find "${pkgdir}/usr" -type d -exec chmod 755 {} +
	chown -R root:root "${pkgdir}"

	# Remove references to $pkgdir
	find "$pkgdir" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'

	local tmppackage="$(mktemp)"
	local pkgjson="$pkgdir/usr/lib/node_modules/$_npmname/package.json"
	jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" >"$tmppackage"
	mv "$tmppackage" "$pkgjson"
	chmod 644 "$pkgjson"

	find "$pkgdir" -type f -name package.json | while read pkgjson; do
		local tmppackage="$(mktemp)"
		jq 'del(.man)' "$pkgjson" >"$tmppackage"
		mv "$tmppackage" "$pkgjson"
		chmod 644 "$pkgjson"
	done

	# Install LICENSE file
	install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	# custom systemd service
	install -Dm 644 webtorrent-bittorrent-tracker.service "$pkgdir/usr/lib/systemd/system/webtorrent-bittorrent-tracker.service"
	install -Dm 644 webtorrent-bittorrent-tracker.service "$pkgdir/usr/lib/systemd/user/webtorrent-bittorrent-tracker.service"
	install -Dm 644 webtorrent-bittorrent-tracker.conf "$pkgdir/etc/webtorrent-bittorrent-tracker.conf"
}
