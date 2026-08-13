# Maintainer: 30p87 <aur@30p87.de>

pkgname='piped-frontend-git'
_componentname="${pkgname%'-git'}"
_componentnameshort="${_componentname#'piped-'}"
pkgver=r4906.da7ab35
pkgrel=1
pkgdesc='An alternative privacy-friendly YouTube frontend which is efficient by design. Frontend component, calling [piped-backend-git](https://aur.archlinux.org/piped-backend-git) for Metadata'
arch=('x86_64')
url='https://github.com/TeamPiped/Piped'
license=('AGPL-3.0')
groups=('piped-git')
makedepends=('git' 'pnpm')
install=piped-frontend.install
source=("git+${url}"
		'configure-piped-frontend.sh'
		'config.properties')
sha256sums=('SKIP'
            'ea0d3bb44c46223b8fbbfe06a5397ee103d77a74f6e29ed636d02bbfebe0f77a'
            '7e310112487f7a77b5fe7b5721e6f077edaeda8009b3881f39dee2ee584e1922')
_dest="/usr/share/webapps/piped/${_componentnameshort}"

pkgver() {
	cd Piped
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
	sed -i "s|/usr/share/nginx/html|${_dest}|g" "${srcdir}/Piped/docker/nginx.conf"
}

build() {
	cd Piped
	if pnpm install vite; then :; fi
	pnpm approve-builds core-js esbuild vue-demi
	pnpm install vite
	pnpm run build
}

package() {
	install -dm755 "${pkgdir}/etc/webapps/piped"

	install -Dm644 "${srcdir}/Piped/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 "${srcdir}/Piped/docker/nginx.conf" "${pkgdir}/usr/share/doc/piped/${_componentnameshort}/nginx.conf"
	install -Dm644 "${srcdir}/config.properties" "${pkgdir}/usr/share/doc/piped/${_componentnameshort}/config.properties"

	install -dm755 "${pkgdir}${_dest}"
	cp -ra ${srcdir}/Piped/dist/* "${pkgdir}${_dest}"
	chmod -R 755 "${pkgdir}${_dest}"
	install -Dm755 "${srcdir}/configure-piped-frontend.sh" "${pkgdir}/usr/bin/configure-piped-frontend"
}
