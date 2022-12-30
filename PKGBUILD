pkgname=immich
pkgrel=0
pkgver=1.40.1_63
pkgdesc='Self-hosted photos and videos backup tool'
url='https://github.com/immich-app/immich'
license=('MIT')
arch=(x86_64)
makedepends=('npm' 'nodejs-lts-hydrogen')
depends=('redis' 'postgresql' 'nodejs')
source=("https://github.com/immich-app/immich/archive/refs/tags/v${pkgver}-dev.tar.gz"
	"${pkgname}-server.service"
	"${pkgname}-microservices.service"
	"${pkgname}-machine-learning.service"
	"${pkgname}-web.service"
	"${pkgname}.sysusers"
	"immich.conf"
	"nginx.immich.conf"
)

sha256sums=('7429bd20ee66fccfbe897a8d32fa8b2fe50bb5325bf03942ead3a2d53e227b69'
            '4610abec7e1d14eb4b9c33dcbf1362537281e46c96eb79c9a0cef72ad03bd0e2'
            'dc16ca71d9e1644653570562e672f8e3b9a3c06a95893b20181c9bf2500c03ff'
            '9ca54531c5671e9a1eb3e26bb41fee24f1ba9a4bd5ba95cf45377a2ee803cd1f'
            '64fd6dcbe66ffb47805221a4122da3defe421bcb636a4ce0fdaa64bd2c7e8bc0'
            'c7db0e5e2eb50bd48892a7e669a2ced65988af43fb82ad67d8e2cc607a6aeb47'
            '45350c8b032783360eec0619d4cccb30c26f590c771561026f78e02d9b12ebc5'
            'a56e17b6bcde900a4abc6e0b04fa9363979d3e2cda21f27421b3727a7e9320e9')

backup=("etc/immich.conf")

build() {
	#Build web frontend
	cd "${srcdir}/${pkgname}-${pkgver}-dev/web"	
	npm ci
	npm run build
	#npm prune --production

	#Build machine-learning
	cd "${srcdir}/${pkgname}-${pkgver}-dev/machine-learning"	
	npm ci
	npm rebuild @tensorflow/tfjs-node --build-from-source
	npm run build
	npm prune --production

	#Build Server
	cd "${srcdir}/${pkgname}-${pkgver}-dev/server"
	npm ci
	npm run build
	npm prune --production


}

package() {
	#install server
	install -Dm755 "${srcdir}/${pkgname}-${pkgver}-dev/server/package.json" "${pkgdir}/var/lib/immich/app/server/package.json"
	install -Dm755 "${srcdir}/${pkgname}-${pkgver}-dev/server/package-lock.json" "${pkgdir}/var/lib/immich/app/server/package-lock.json"
	cp -r "${srcdir}/${pkgname}-${pkgver}-dev/server/node_modules" "${pkgdir}/var/lib/immich/app/server/node_modules"
	cp -r "${srcdir}/${pkgname}-${pkgver}-dev/server/dist" "${pkgdir}/var/lib/immich/app/server/dist"

	#install web frontend
	cp -r "${srcdir}/${pkgname}-${pkgver}-dev/web" "${pkgdir}/var/lib/immich/app/web"

	#install macheine-learning
	install -Dm755 "${srcdir}/${pkgname}-${pkgver}-dev/machine-learning/package.json" "${pkgdir}/var/lib/immich/app/machine-learning/package.json"
	install -Dm755 "${srcdir}/${pkgname}-${pkgver}-dev/machine-learning/package-lock.json" "${pkgdir}/var/lib/immich/app/machine-learning/package-lock.json"
	cp -r "${srcdir}/${pkgname}-${pkgver}-dev/machine-learning/node_modules" "${pkgdir}/var/lib/immich/app/machine-learning/node_modules"
	cp -r "${srcdir}/${pkgname}-${pkgver}-dev/machine-learning/dist" "${pkgdir}/var/lib/immich/app/machine-learning/dist"

	#link directories
	ln -s /var/lib/immich/upload "${pkgdir}/var/lib/immich/app/server/upload"
	ln -s /var/lib/immich/upload "${pkgdir}/var/lib/immich/app/machine-learning/upload"

	#install systemd service files
	install -Dm644 "${srcdir}/immich-server.service" "${pkgdir}/usr/lib/systemd/system/immich-server.service"
	install -Dm644 "${srcdir}/immich-machine-learning.service" "${pkgdir}/usr/lib/systemd/system/immich-machine-learning.service"
	install -Dm644 "${srcdir}/immich-web.service" "${pkgdir}/usr/lib/systemd/system/immich-web.service"
	install -Dm644 "${srcdir}/immich-microservices.service" "${pkgdir}/usr/lib/systemd/system/immich-microservices.service"

	#install configuration files
	install -Dm644 "${srcdir}/immich.sysusers" "${pkgdir}/usr/lib/sysusers.d/immich.conf"
	install -Dm644 "${srcdir}/immich.conf" "${pkgdir}/etc/immich.conf"
	install -Dm644 "${srcdir}/nginx.immich.conf" "${pkgdir}/etc/nginx/sites-available/immich.conf"
}
