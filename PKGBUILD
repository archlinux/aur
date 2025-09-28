# Maintainer: Ben Towali <ben@bentowali.com>

pkgname=raindrop
pkgver='5.6.94'
pkgrel=1
pkgdesc="All-in-one bookmark manager"
arch=('x86_64')
url="https://raindrop.io"
license=('MIT')
depends=()
makedepends=('git' 'nodejs' 'npm' 'jq')
provides=(raindrop)
source=('raindrop::git+https://github.com/raindropio/desktop#tag=v5.6.94'
	'git+https://github.com/raindropio/app'
	'remove-sentry.patch'
	'raindrop.desktop')
sha512sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')

prepare() {
	cd ${pkgname}
	git submodule init
	git config submodule.webapp.url "${srcdir}/app"
	git -c protocol.file.allow=always submodule update
	cd webapp
	# Remove sentry because it requires an API key
	git apply "${srcdir}/remove-sentry.patch"
}

build() {
	cd "${pkgname}"
	npm i
	# npm run pre:build
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
