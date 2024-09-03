# Maintainer: jason.nader@protonmail.com
# Based on PKGBUILD by Kevin S <aur@eldenring.mozmail.com>
pkgname=audiobookshelf
pkgver=v2.13.3
pkgrel=1
pkgdesc="Self-hosted audiobook server for managing and playing audiobooks"
arch=('x86_64')
url="https://github.com/advplyr/audiobookshelf"
license=('GPL-3.0-only')
depends=('ffmpeg')
makedepends=('nodejs' 'npm' 'git')
backup=('etc/conf.d/audiobookshelf')
options=(!debug !strip)

source=(
	"git+${url}#tag=${pkgver}"
	'audiobookshelf.conf'
	'audiobookshelf.hook'
	'audiobookshelf.service'
	'audiobookshelf.sysusers'
	'audiobookshelf.tmpfiles'
)

md5sums=('5d3442133959384888d7fc7b28773876'
         'd02fc1fc9aa5ba5f744a84180a1ed527'
         '3c4d1ab715f9221cb625b8248e3023df'
         '7331c1ddab80eb373ee92d2c1284d0ef'
         'f8a4833710760dd16a89906052dff322'
         'b741beeaf0fc232734c9d20ee5b988aa')

prepare() {    
	cd "${srcdir}/${pkgname}"
	# install build dependencies
	npm install @yao-pkg/pkg
}

build() {
	cd "${srcdir}/${pkgname}"
	echo ">>> Building Client"
	echo "--------------------"

	cd client
	rm -rf node_modules
	npm ci --unsafe-perm=true --allow-root
	NODE_OPTIONS=--openssl-legacy-provider npm run generate
	cd ..

	echo ">>> Building Server"
	echo "--------------------"

	rm -rf node_modules
	npm ci --unsafe-perm=true --allow-root --only=production
}

package() {
	cd "${srcdir}/${pkgname}"

	"${srcdir}/${pkgname}"/node_modules/.bin/pkg -t node20-linux-x64 -o "${pkgdir}/usr/bin/audiobookshelf" .
	install -D -m 644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -D -m 644 "${srcdir}/audiobookshelf.conf" "${pkgdir}/etc/conf.d/audiobookshelf"
	install -D -m 644 "${srcdir}/audiobookshelf.service" "${pkgdir}/usr/lib/systemd/system/audiobookshelf.service"
	install -D -m 644 "${srcdir}/audiobookshelf.sysusers" "${pkgdir}/usr/lib/sysusers.d/audiobookshelf.conf"
	install -D -m 644 "${srcdir}/audiobookshelf.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/audiobookshelf.conf"
	install -D -m 644 "${srcdir}/audiobookshelf.hook" "${pkgdir}/usr/share/doc/${pkgname}/audiobookshelf.hook"
}
