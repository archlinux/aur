# Maintainer: 30p87 <aur@30p87.de>

pkgname='piped-frontend-git'
_componentname="${pkgname%'-git'}"
_componentnameshort="${_componentname#'piped-'}"
pkgver=r4797.c4e6f40
pkgrel=1
pkgdesc='An alternative privacy-friendly YouTube frontend which is efficient by design. Frontend component, calling [piped-backend-git](https://aur.archlinux.org/piped-backend-git) for Metadata'
arch=('x86_64')
url='https://github.com/TeamPiped/Piped'
license=('AGPL-3.0')
groups=('piped-git')
makedepends=('git' 'pnpm')
install=piped-frontend.install
source=('git+https://github.com/TeamPiped/Piped.git'
		'example-config.properties'
		'configure-piped-frontend.sh')
sha256sums=('SKIP'
            '7e310112487f7a77b5fe7b5721e6f077edaeda8009b3881f39dee2ee584e1922'
            'ea0d3bb44c46223b8fbbfe06a5397ee103d77a74f6e29ed636d02bbfebe0f77a')
dest="/usr/share/webapps/piped/${_componentnameshort}"

pkgver() {
	cd Piped
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
	sed -i "s|/usr/share/nginx/html|${dest}|g" "${srcdir}/Piped/docker/nginx.conf"
}

build() {
	cd Piped
	pnpm install vite
	pnpm run build
}

package() {
	install -dm755 "${pkgdir}/etc/webapps/piped"

	install -Dm644 "${srcdir}/Piped/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 "${srcdir}/Piped/docker/nginx.conf" "${pkgdir}/usr/share/doc/piped/${_componentnameshort}/nginx.conf"
	install -Dm644 "${srcdir}/example-config.properties" "${pkgdir}/usr/share/doc/piped/${_componentnameshort}/example-config.properties"

	install -dm755 "${pkgdir}${dest}"
	cp -ra ${srcdir}/Piped/dist/* "${pkgdir}${dest}"
	chmod -R 755 "${pkgdir}${dest}"
	install -Dm755 "${srcdir}/configure-piped-frontend.sh" "${pkgdir}/usr/bin/configure-piped-frontend"
}
