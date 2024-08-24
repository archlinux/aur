# Maintainer: 30p87 <30p87@30p87.de>
pkgname='piped-frontend-git'
pkgver=r4399.dad59e0
pkgrel=1
pkgdesc='An open-source alternative frontend for YouTube which is efficient by design'
arch=('x86_64')
url="https://docs.piped.video/"
license=('AGPL-3.0')
groups=('piped-git')
makedepends=('git' 'pnpm')
source=('git+https://github.com/TeamPiped/Piped.git'
		'configure-piped-frontend.sh')
sha256sums=('SKIP'
            '010b44ff4ca400acc6ac75d76ef67cd2619cbc4e563039c96723864b215b172c')

pkgver() {
	cd Piped
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	cd Piped
	pnpm install vite
	pnpm run build
}

package() {
	generaldest="/usr/share/webapps/piped"
	dest="${generaldest}/frontend"

	sed -i "s|/usr/share/nginx/html|${dest}|" "${srcdir}/Piped/docker/nginx.conf"
	sed -i "s|DEST|${dest}|" "${srcdir}/configure-piped-frontend.sh"

	install -Dm644 "${srcdir}/Piped/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 "${srcdir}/Piped/docker/nginx.conf" "${pkgdir}/usr/share/doc/piped/piped-frontend-nginx.conf"

	install -dm755 "${pkgdir}${dest}"
	cp -ra ${srcdir}/Piped/dist/* "${pkgdir}/${dest}"
	chmod -R 755 "${pkgdir}${dest}"
	install -Dm755 "${srcdir}/configure-piped-frontend.sh" "${pkgdir}/usr/bin/configure-piped-frontend"

#chown -R root:root "${pkgdir}${dest}"
#chmod -R u+rw,g+r,o+r "${pkgdir}${dest}"
#find "${pkgdir}${dest}" -type d -exec chmod u+x,g+x,o+x {} \;
}
