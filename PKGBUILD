pkgname=immich
pkgrel=0
pkgver=1.66.1
pkgdesc='Self-hosted photos and videos backup tool'
url='https://github.com/immich-app/immich'
license=('MIT')
arch=(x86_64)
makedepends=('npm' 'nodejs-lts-hydrogen')
depends=('redis' 'postgresql' 'nodejs')
source=("https://github.com/immich-app/immich/archive/refs/tags/v${pkgver}.tar.gz"
	"${pkgname}-server.service"
	"${pkgname}-microservices.service"
	"${pkgname}-web.service"
	"${pkgname}.sysusers"
	"immich.conf"
	"nginx.immich.conf"
)
sha256sums=('24de5af9305469560e463e2e42e06414eafdecb0161e431870802c10288eac15'
            'e1989ebeb442e2415931467f50c0923325e5bac7944dc91a1e34a8c214424fbd'
            '91d9bbe2bb28f568586ae8b9aa51ebd2e2be36cbefa45b59d4eee368c3552987'
            '64fd6dcbe66ffb47805221a4122da3defe421bcb636a4ce0fdaa64bd2c7e8bc0'
            'c7db0e5e2eb50bd48892a7e669a2ced65988af43fb82ad67d8e2cc607a6aeb47'
            '1dfee9417b18e5ae9c98ab3f4d13854ef72ad50268e0a347ebe495b531303b74'
            'a56e17b6bcde900a4abc6e0b04fa9363979d3e2cda21f27421b3727a7e9320e9')

backup=("etc/immich.conf")

build() {
	#Build web frontend
	cd "${srcdir}/${pkgname}-${pkgver}/web"
	npm ci
	npm run build
	npm prune --omit=dev

	#Build Server
	cd "${srcdir}/${pkgname}-${pkgver}/server"
	npm ci
	npm run build
	npm prune --omit=dev --omit=optional
}

package() {
	#install server
	install -Dm755 "${srcdir}/${pkgname}-${pkgver}/server/package.json" "${pkgdir}/var/lib/immich/app/server/package.json"
	install -Dm755 "${srcdir}/${pkgname}-${pkgver}/server/package-lock.json" "${pkgdir}/var/lib/immich/app/server/package-lock.json"
	cp -r "${srcdir}/${pkgname}-${pkgver}/server/node_modules" "${pkgdir}/var/lib/immich/app/server/node_modules"
	cp -r "${srcdir}/${pkgname}-${pkgver}/server/dist" "${pkgdir}/var/lib/immich/app/server/dist"
	cp -r "${srcdir}/${pkgname}-${pkgver}/server/bin" "${pkgdir}/var/lib/immich/app/server/bin"

	#install web frontend
	cp -r "${srcdir}/${pkgname}-${pkgver}/web" "${pkgdir}/var/lib/immich/app/web"

	#link directories
	ln -s /var/lib/immich/upload "${pkgdir}/var/lib/immich/app/server/upload"

	#install systemd service files
	install -Dm644 "${srcdir}/immich-server.service" "${pkgdir}/usr/lib/systemd/system/immich-server.service"
	install -Dm644 "${srcdir}/immich-web.service" "${pkgdir}/usr/lib/systemd/system/immich-web.service"
	install -Dm644 "${srcdir}/immich-microservices.service" "${pkgdir}/usr/lib/systemd/system/immich-microservices.service"

	#install configuration files
	install -Dm644 "${srcdir}/immich.sysusers" "${pkgdir}/usr/lib/sysusers.d/immich.conf"
	install -Dm644 "${srcdir}/immich.conf" "${pkgdir}/etc/immich.conf"
	install -Dm644 "${srcdir}/nginx.immich.conf" "${pkgdir}/etc/nginx/sites-available/immich.conf"
}
