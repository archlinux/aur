# Maintainer: Jesse R Codling <codling@umich.edu>
# Contributor: Daniel Goß <developer@flashsystems.de>
_npmname=tiddlywiki
pkgname=nodejs-${_npmname}
pkgver=5.3.7
pkgrel=1
pkgdesc='TiddlyWiki, a non-linear personal web notebook that anyone can use and keep forever, independently of any corporation. This is the nodejs server edition.'
arch=('any')
url="https://tiddlywiki.com/#TiddlyWiki%20on%20Node.js"
license=('BSD')
depends=('nodejs')
makedepends=('npm' 'jq')
source=("https://registry.npmjs.org/tiddlywiki/-/$_npmname-$pkgver.tgz"
        "${pkgname}-${pkgver}.license::https://raw.githubusercontent.com/Jermolene/TiddlyWiki5/v${pkgver}/license")
sha256sums=('3f0dd67d5c1a8efd08e374bc14dc9f096974933ccd789b90cd5611fb6e233af8'
            '563955ffb71c1ff7090634d68164a68b8c76f1f9048a98fc6a0526124f447513')
noextract=("$_npmname-$pkgver.tgz")

package() {
	npm install -g --cache "${srcdir}/npm-cache" --prefix "${pkgdir}/usr" "${srcdir}/${_npmname}-${pkgver}.tgz"

	# Fix https://github.com/npm/npm/issues/9359
	find "${pkgdir}/usr" -type d -exec chmod 755 {} +

	# Fix https://bugs.archlinux.org/task/63396
	chown -R root:root "${pkgdir}"

	# Remove references to $pkgdir
	find "${pkgdir}" -type f -name package.json -print0 | xargs -r -0 sed -i "/_where/d"

	# Remove references to $srcdir
	local tmppackage="$(mktemp)"
	local pkgjson="${pkgdir}/usr/lib/node_modules/${_npmname}/package.json"
	jq '.|=with_entries(select(.key|test("_.+")|not))' "${pkgjson}" > "${tmppackage}"
	mv "${tmppackage}" "${pkgjson}"
	chmod 644 "${pkgjson}"

	# Install license from github
	install -Dm 644 "${srcdir}/${pkgname}-${pkgver}.license" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
