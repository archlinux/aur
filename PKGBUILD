# Maintainer: Kevin S <aur@eldenring.mozmail.com>
pkgname=audiobookshelf-git
pkgver=v2.0.22.r0.g67f51c6
pkgrel=1
pkgdesc="Self-hosted audiobook server for managing and playing audiobooks"
arch=('any')
url="https://github.com/advplyr/audiobookshelf"
license=('GPL3')
depends=('ffmpeg')
makedepends=('nodejs' 'npm' 'git')
provides=("audiobookshelf")
conflicts=("audiobookshelf")
backup=('etc/conf.d/audiobookshelf')
options=(!strip)

source=(${pkgname}::git+"${url}".git
	'audiobookshelf.conf.d'
	'audiobookshelf.hook'
	'audiobookshelf.service'
        'audiobookshelf.sysusers'
        'audiobookshelf.tmpfiles')

md5sums=('SKIP'
	'5880b13a80fdc51b15604f0e5f30da09'
	'749322fc2b48a839a79a638d879e77a4'
	'52a8a90977335fdecf3ce6f8530830b1'
        '63619dfc5bb5b2dbecfb1d6037095338'
        '90e34ac4e5a79f71af3eaab8cebf1198')

pkgver() {
	cd "$pkgname"
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

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
	npm run generate
	cd ..

	echo ">>> Building Server"
	echo "--------------------"

	rm -rf node_modules
	npm ci --unsafe-perm=true --allow-root
}

package() {
	cd "${srcdir}/${pkgname}"

	install -d -m 755 "${pkgdir}/usr/share/audiobookshelf/"
	pkg -t node16-linux -o "${pkgdir}/usr/share/audiobookshelf/audiobookshelf" .
	install -D -m 644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -D -m 644 "${srcdir}/audiobookshelf.conf.d" "${pkgdir}/etc/conf.d/audiobookshelf"
	install -D -m 644 "${srcdir}/audiobookshelf.service" "${pkgdir}/usr/lib/systemd/system/audiobookshelf.service"
	install -D -m 644 "${srcdir}/audiobookshelf.sysusers" "${pkgdir}/usr/lib/sysusers.d/audiobookshelf.conf"
	install -D -m 644 "${srcdir}/audiobookshelf.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/audiobookshelf.conf"
	install -D -m 644 "${srcdir}/audiobookshelf.hook" "${pkgdir}/usr/share/doc/${pkgname}/audiobookshelf.hook"
}
