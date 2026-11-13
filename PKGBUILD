# Maintainer: Martin Rys <https://rys.rs/contact>

pkgname=haste-server-git
_gitname=haste-server
pkgver=r423.2743a1a
pkgrel=1
pkgdesc="Prettiest, easiest to use pastebin ever made"
arch=('any')
url="https://github.com/C0rn3j/haste-server"
license=('MIT')
depends=('nodejs')
makedepends=('git' 'npm')
provides=('haste-server')
conflicts=('haste-server')
options=(!emptydirs)
source=('git+https://github.com/C0rn3j/haste-server.git'
	'haste-server.service')
sha256sums=('SKIP'
	'43be29b72a580e6b6b215fe376d75de754dcfa8c6969fcec8131ec1d25cae6da')

pkgver() {
	cd "${srcdir}/${_gitname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${srcdir}/${_gitname}"

	# Pack the current folder
	npm pack
}

package() {
	cd "${srcdir}/${_gitname}"
	install -Dm644 "${srcdir}/${_gitname}.service" -t "${pkgdir}/usr/lib/systemd/system"
	local _haste_tarball
	_haste_tarball="${srcdir}/${_gitname}/$(node -p 'const {name, version} = require("./package.json"); `${name}-${version}.tgz`')"
	npm install \
		--allow-scripts="${_haste_tarball}" \
		--cache ../cache \
		-g \
		--prefix "${pkgdir}/usr" \
		"${_haste_tarball}"
}
