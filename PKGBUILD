# Maintainer: Ben Towali <ben@bentowali.com>

pkgname=raindrop
pkgver='5.6.90'
pkgrel=1
pkgdesc="All-in-one bookmark manager"
arch=('x86_64')
url="https://raindrop.io"
license=('MIT')
depends=()
makedepends=('git' 'nodejs' 'jq')
provides=(raindrop)
source=('raindrop::git+https://github.com/raindropio/desktop'
				'remove-sentry.patch'
				'raindrop.desktop')
sha512sums=('SKIP' 'SKIP' 'SKIP')

prepare() {
	# Clone submodule directly because the linked submodule commit is outdated
	git clone https://github.com/raindropio/app "${pkgname}/webapp"
	cd "${pkgname}/webapp"
	# Remove sentry because it requires an API key
	git apply "${srcdir}/remove-sentry.patch"
}

pkgver() {
	cd "${pkgname}/webapp"
	jq -r '.version' package.json
}

build() {
	cd "${pkgname}"
	npm i
	npm run pre:build
	npm run build:linux
}

package() {
	cd "${srcdir}/${pkgname}"

	# Make necessary directories
	install -d "${pkgdir}/opt/${pkgname}"
	install -d "${pkgdir}/usr/bin"

	# Install Files
	## Copy electron app
	cp -r "dist/linux-unpacked/." "${pkgdir}/opt/${pkgname}"
	## Desktop Entry
	install -Dm644 "../${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	## Symlink binary
	ln -s "/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin"
	## License
	install -Dm644 "webapp/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
	## Icons
	for _icons in 16 32 48 64 128 256 512; do
		install -Dm644 "build/linux/${_icons}x${_icons}.png" "${pkgdir}/usr/share/icons/hicolor/${_icons}x${_icons}/apps/${pkgname}.png"
	done
}
