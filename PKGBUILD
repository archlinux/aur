# Maintainer: MGislv <mgislv at ceppo dot xyz>
# Contributor: INhBQfUQO2eFzulN <281587887a at protonmail dot ch>

pkgname=teddit-git
pkgver=r747.799bc83
pkgrel=1
pkgdesc='Alternative Reddit front-end focused on privacy'
arch=('any')
url='https://codeberg.org/teddit/teddit'
license=('AGPL')
depends=('nodejs')
makedepends=('git' 'npm')
optdepends=('redis: works as a cache for Reddit API calls'
            'ffmpeg: video support')
provides=('teddit')
conflicts=('teddit')
backup=('opt/teddit/config.js')
source=("git+$url"
        'teddit.service'
        'teddit.sysusers')
sha512sums=('SKIP'
            'deb1a75aeb56a0d838ccb335da3588148405c285095ea14cf2fbbe35614103379971c5129602170534f0d17c7174a683b4a7352640a336abe5623d3c67fc6a8e'
            '2e4bb29adb1dff9bcb659ac6226ea77dd5c0d819a9ef7e014f3527ca06d7ee1637b9e6f7b6fb745eeb9e31c45dc93c456b2763e66e918bb198e184ae2fcf289c')

pkgver() {
	cd teddit
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd teddit
	npm install --no-optional --cache "$srcdir/npm-cache"

	install -d "$pkgdir/opt/teddit"
	cp -a * "$pkgdir/opt/teddit"

	# npm gives ownership of ALL FILES to build user
	# https://bugs.archlinux.org/task/63396
	chown -R root:root "$pkgdir"

	install -Dm644 "$srcdir/teddit.service" -t "$pkgdir/usr/lib/systemd/system"
	install -Dm644 "$srcdir/teddit.sysusers" "$pkgdir/usr/lib/sysusers.d/teddit.conf"
	install -Dm644 config.js.template "$pkgdir/opt/teddit/config.js"
}
