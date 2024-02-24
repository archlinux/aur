# Maintainer: jason.nader@protonmail.com
# Based on PKGBUILD by Kevin S <aur@eldenring.mozmail.com>
pkgname=audiobookshelf
pkgver=v2.8.0
pkgrel=3
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
	'de5fab845f7f96b49956c7dc21268593'
	'749322fc2b48a839a79a638d879e77a4'
	'ce89e5d2ce27de70b5e6b53cbaf595f0'
    '63619dfc5bb5b2dbecfb1d6037095338'
    '90e34ac4e5a79f71af3eaab8cebf1198'
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

    install -d -m 755 "${pkgdir}/usr/bin"
	"${srcdir}/${pkgname}"/node_modules/.bin/pkg -t node16-linux -o "${pkgdir}/usr/share/audiobookshelf/audiobookshelf" . 
	install -D -m 644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -D -m 644 "${srcdir}/audiobookshelf.conf.d" "${pkgdir}/etc/conf.d/audiobookshelf"
	install -D -m 644 "${srcdir}/audiobookshelf.service" "${pkgdir}/usr/lib/systemd/system/audiobookshelf.service"
	install -D -m 644 "${srcdir}/audiobookshelf.sysusers" "${pkgdir}/usr/lib/sysusers.d/audiobookshelf.conf"
	install -D -m 644 "${srcdir}/audiobookshelf.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/audiobookshelf.conf"
	install -D -m 644 "${srcdir}/audiobookshelf.hook" "${pkgdir}/usr/share/doc/${pkgname}/audiobookshelf.hook"
}
