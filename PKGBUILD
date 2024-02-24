# Maintainer: jason.nader@protonmail.com
# Based on PKGBUILD by Kevin S <aur@eldenring.mozmail.com>
pkgname=audiobookshelf
pkgver=v2.8.0
pkgrel=5
pkgdesc="Self-hosted audiobook server for managing and playing audiobooks"
arch=('any')
url="https://github.com/advplyr/audiobookshelf"
license=('GPL3')
depends=('ffmpeg')
makedepends=('nodejs' 'npm' 'git')
optdepends=('tone-bin')
provides=("audiobookshelf")
conflicts=("audiobookshelf")
backup=('etc/conf.d/audiobookshelf')
options=(!strip)

source=(
	"git+${url}#tag=${pkgver}"
	'audiobookshelf.conf.d'
	'audiobookshelf.hook'
	'audiobookshelf.service'
    'audiobookshelf.sysusers'
    'audiobookshelf.tmpfiles'
)

md5sums=(
	'SKIP'
	'4832a71a50f33831b6b4be53555e05f5'
	'3c4d1ab715f9221cb625b8248e3023df'
	'ed4711d3ce7d76fc173fb0e10915b80c'
	'f8a4833710760dd16a89906052dff322'
	'b741beeaf0fc232734c9d20ee5b988aa'
)

prepare() {    
	cd "${srcdir}/${pkgname}"
	# install build dependencies
	npm install pkg
}

build() {
	cd "${srcdir}/${pkgname}"
	echo ">>> Building Client"
	echo "--------------------"

	cd client
	rm -rf node_modules
	npm ci --unsafe-perm=true --allow-root
	NODE_OPTIONS=--openssl-legacy-provider	npm run generate
	cd ..

	echo ">>> Building Server"
	echo "--------------------"

	rm -rf node_modules
	npm ci --unsafe-perm=true --allow-root
}

package() {
	cd "${srcdir}/${pkgname}"

	"${srcdir}/${pkgname}"/node_modules/.bin/pkg -t node16-linux -o "${pkgdir}/usr/bin/audiobookshelf" .
	install -D -m 644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -D -m 644 "${srcdir}/audiobookshelf.conf.d" "${pkgdir}/etc/conf.d/audiobookshelf"
	install -D -m 644 "${srcdir}/audiobookshelf.service" "${pkgdir}/usr/lib/systemd/system/audiobookshelf.service"
	install -D -m 644 "${srcdir}/audiobookshelf.sysusers" "${pkgdir}/usr/lib/sysusers.d/audiobookshelf.conf"
	install -D -m 644 "${srcdir}/audiobookshelf.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/audiobookshelf.conf"
	install -D -m 644 "${srcdir}/audiobookshelf.hook" "${pkgdir}/usr/share/doc/${pkgname}/audiobookshelf.hook"
}
