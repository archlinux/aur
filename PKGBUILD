# Maintainer: Maertis <maertis at fastmail dot im>

pkgname=synclounge
pkgver=5.2.0
pkgrel=1
pkgdesc="Enjoy Plex with your friends. In Sync. Together."
url="https://github.com/synclounge/synclounge"
arch=('any')
license=('MIT')
depends=('nodejs')
makedepends=('npm' 'jq')
source=(
  "$pkgname-$pkgver.tgz::https://github.com/${pkgname}/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
  "settings.json"
  "synclounge.service"
)
noextract=("$pkgname-$pkgver.tgz")
sha512sums=('08fb40abd6de8f1e38ba0b4a3e5383e6480a780960188057afcc0174411a1383d16af4aecc5e2460863d35048d470d9538a014d1767c5d35ed90e0783f52b3b0'
            '5c9db47ae688d0d905807ca081a0fac0db159def40fa53c09a2cb2dec4cbbe60382f604a49a9ed65846fcec7489c6f7c24b9839fef0306ec1ca97ed732f0f1af'
            '0b32b104dd940f06b38e10a8f486e0734063d7b0d0a31b7af13c684106e04526de3be3b2bb0a44fe95857f703e932bfac82cf536a8645e5b6fbc12e4dc26f2d5')

package() {
	npm install -g --cache "${srcdir}/npm-cache" --prefix "$pkgdir/usr" "$srcdir/$pkgname-$pkgver.tgz"

	# Non-deterministic race in npm gives 777 permissions to random directories.
	# See https://github.com/npm/cli/issues/1103 for details.
	find "$pkgdir/usr" -type d -exec chmod 755 {} +

	# npm gives ownership of ALL FILES to build user
	# https://bugs.archlinux.org/task/63396
	chown -R root:root "${pkgdir}"

	# Remove references to $pkgdir
	find "$pkgdir" -type f -name package.json -print0 | xargs -0 sed -i "/_where/d"

	# Remove references to $srcdir
	local tmppackage="$(mktemp)"
	local pkgjson="$pkgdir/usr/lib/node_modules/$pkgname/package.json"
	jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
	mv "$tmppackage" "$pkgjson"
	chmod 644 "$pkgjson"

	find "$pkgdir" -type f -name package.json | while read pkgjson; do
		local tmppackage="$(mktemp)"
		jq 'del(.man)' "$pkgjson" > "$tmppackage"
		mv "$tmppackage" "$pkgjson"
		chmod 644 "$pkgjson"
	done

	install -Dm644 "$srcdir"/synclounge.service -t "$pkgdir"/usr/lib/systemd/system
	install -Dm644 "$srcdir"/settings.json -t "$pkgdir"/etc/synclounge
}
