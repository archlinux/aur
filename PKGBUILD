# Maintainer: LaserHydra <contact at laserhydra dot com>
pkgname=wows-monitor-git
pkgver=1.2.1.r350
pkgrel=1
pkgdesc="Matchmaking Monitor for World of Warships"
arch=('any')
url="https://wows-monitor.com/"
license=('unknown')
depends=()
makedepends=('git' 'nodejs' 'npm')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/SakuraIsayeki/wows-monitor-linux.git#branch=master"
		'Fix-filesaverjs-capitalization.patch'
		'Avoid-building-unnecessary-packages.patch'
		"${pkgname%-git}.desktop")
sha512sums=('SKIP'
            '039a304efaccafeeffb8b20a44b6ea1aa620c7372f339aa97ac425e8f860f217a5935bfb2f9033a5052a82abbdee14e01122b39c1d890db7dd4883d3c52e6fea'
            '89aa27ace75ac9e12b17a46007c82e6d4afc3f9e36711c3479d9f4916238c8581a832cf83970dfc4b05f289d91220c635db6106981d42d93a04f33c3462d5a17'
            'b3e0739aecd40f93a360d9272997e7465e7831278be1b794367f0e4e994c61ffb9699c01ff11f2727adeead0adc1fd29f065cd996feddf85d35a6555bef0b43c')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	version=$(grep -oP '\"version\":\s\"\K(\d+\.\d+.\d+)(?=\")' package.json)
	commits=$(git rev-list --count HEAD)

	printf "%s.r%s" $version $commits
}

prepare() {
	cd "$srcdir/${pkgname%-git}"

	patch -p1 -i "$srcdir/Fix-filesaverjs-capitalization.patch"
	patch -p1 -i "$srcdir/Avoid-building-unnecessary-packages.patch"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	npm install && npm run electron:build:linux
	#npm run electron:build:linux
}

package() {
	cd "$srcdir/${pkgname%-git}"

	install -d "${pkgdir}/usr/share/${pkgname%-git}"
	cp -dr --no-preserve=ownership release/linux-unpacked/* "${pkgdir}/usr/share/${pkgname%-git}/"

	install -Dm644 "$srcdir/${pkgname%-git}.desktop" -t "$pkgdir/usr/share/applications"
}
