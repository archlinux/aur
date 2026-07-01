# Maintainer: cN3rd <subs.in.tokyo@gmail.com>
pkgname=squad-cli
_npmname=@bradygaster/squad-cli
pkgver=0.11.0
pkgrel=1
pkgdesc="Squad CLI — Human-led AI agent teams for any project (command-line interface for the Squad multi-agent runtime)"
arch=('any')
url="https://github.com/bradygaster/squad"
license=('MIT')
depends=('nodejs>=22.5.0')
makedepends=('npm')
provides=('squad')
options=('!emptydirs' '!strip')
source=("https://registry.npmjs.org/${_npmname}/-/squad-cli-${pkgver}.tgz"
        "LICENSE-${pkgver}::https://raw.githubusercontent.com/bradygaster/squad/v${pkgver}/LICENSE")
noextract=("squad-cli-${pkgver}.tgz")
sha256sums=('e335719d8f4448187819f0056de0a5a4593e89ea1a650e5657b3e9a69d192872'
            'a29fbca40ece55cf400b003960c6523d909eacde076d32567a4ef2d1af252eb1')

package() {
	npm install -g --prefix "${pkgdir}/usr" "${srcdir}/squad-cli-${pkgver}.tgz"

	# Fix non-deterministic permissions set by npm.
	find "${pkgdir}" -type d -exec chmod 755 {} +

	# Strip references to $pkgdir that npm bakes into package.json files.
	find "${pkgdir}" -type f -name package.json -print0 | while IFS= read -r -d '' pkgjson; do
		sed -i "\|${pkgdir}|d" "${pkgjson}"
	done

	# Remove npm-generated cache/log artifacts that leak the build path.
	rm -rf "${pkgdir}/usr/etc"

	# Drop node-gyp build intermediates that embed the buildroot path.
	# Only the compiled build/Release/*.node artifacts are needed at runtime.
	find "${pkgdir}" -type d -name build -path '*/node_modules/*' | while IFS= read -r builddir; do
		find "${builddir}" -maxdepth 1 -type f \
			\( -name 'Makefile' -o -name 'binding.Makefile' \
			-o -name '*.target.mk' -o -name 'config.gypi' \) -delete
	done

	install -Dm644 "${srcdir}/LICENSE-${pkgver}" \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
