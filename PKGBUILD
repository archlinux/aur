pkgname=immich
pkgrel=0
pkgver=1.55.1
pkgdesc='Self-hosted photos and videos backup tool'
url='https://github.com/immich-app/immich'
license=('MIT')
arch=(x86_64)
makedepends=('npm' 'nodejs-lts-hydrogen')
depends=('redis' 'postgresql' 'nodejs' 'python-pytorch' 'python-transformers' 'python-tqdm' 'python-numpy' 'python-scikit-learn' 'python-scipy' 'python-nltk' 'python-sentencepiece-git' 'python-flask' 'python-pillow' 'python-sentence-transformers' 'numactl')
source=("https://github.com/immich-app/immich/archive/refs/tags/v${pkgver}.tar.gz"
	"${pkgname}-server.service"
	"${pkgname}-microservices.service"
	"${pkgname}-machine-learning.service"
	"${pkgname}-web.service"
	"${pkgname}.sysusers"
	"immich.conf"
	"nginx.immich.conf"
)
sha256sums=('c9f336c888ab31618463474b1291e903d8f9a498dacabb5d407625fcf4f87394'
            '4610abec7e1d14eb4b9c33dcbf1362537281e46c96eb79c9a0cef72ad03bd0e2'
            'dc16ca71d9e1644653570562e672f8e3b9a3c06a95893b20181c9bf2500c03ff'
            '7507075f88cf2757aca8d8a480c69674c9be92d65927c4eb643064d6b66bf728'
            '64fd6dcbe66ffb47805221a4122da3defe421bcb636a4ce0fdaa64bd2c7e8bc0'
            'c7db0e5e2eb50bd48892a7e669a2ced65988af43fb82ad67d8e2cc607a6aeb47'
            'd8d1e3da01efd56bccd864235604118e0d3e5b3c412c2412a4be997225b41c4f'
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

	#install web frontend
	cp -r "${srcdir}/${pkgname}-${pkgver}/web" "${pkgdir}/var/lib/immich/app/web"

	#install machine-learning
	install -Dm755 "${srcdir}/${pkgname}-${pkgver}/machine-learning/src/main.py" "${pkgdir}/var/lib/immich/app/machine-learning/main.py"
	mkdir "${pkgdir}/var/lib/immich/.cache"

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
