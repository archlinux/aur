# Maintainer: jason.nader@protonmail.com
# Based on PKGBUILD by Kevin S <aur@eldenring.mozmail.com>
pkgname=audiobookshelf
pkgver=v2.16.2
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

sha256sums=('06477bc1a0550dd032ee3e0c4442f84aa2683e180893e8912b906dd08d3aeb0e'
            '839c778b8ae951d82a602d370452d702ad9b1d8ab6844984c934a3d2af0b710a'
            '91d00bbc9800f80cde439fd9b5343cf031b6a09557f03172c92d40f2f0775c2b'
            '4f37d8e407eda555231dc23d1cd35d329075ae6686acbb89d0b4612a824d594d'
            'cd5db44865de6f7401093b60869f937703213f196220e8c3325fa7f1b02db1fa'
            'ec04988b13dd049fbd021a51275c92120179f74f1e71fd9141bd720633e5f99f')

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
