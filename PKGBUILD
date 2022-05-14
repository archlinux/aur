# Maintainer:       Misaka13514 <Misaka13514 at gmail dot com>
# Co-Maintainer:    zzjzxq33 <wojiushixxx at 126 dot com>
pkgname=bbg-git
pkgver=20220514.r1.4277326
pkgrel=1
pkgdesc="A static blog generator built with electron"
arch=('any')
url="https://github.com/baiyang-lzy/bbg"
license=('Unlicense')
depends=('electron16')
makedepends=('git' 'yarn' 'asar')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(
	'bbg.sh'
	'icon.png'
	'bbg.desktop'
	"${pkgname%-git}::git+${url}.git"
)
sha256sums=(
	'ef39a1c67ffe2228d8bb51256a5a666d8ecbbfbc935c1f515a6c087ba5fbe924'
	'b2055c02386eacb33fff9f53b2c1bf099d49e4c63d016704a220e9108ded262f'
	'f503d93639c1f4d4e050eceb11adf64d369908e5941cfdbda3af30b2f3c73d96'
	'SKIP'
)

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	yarn install
	asar pack . app.asar
}

package() {
	cd "$srcdir"
	install -dm755 "${pkgdir}/usr/share/${pkgname%-git}"
	install -Dm755 bbg.sh "${pkgdir}/usr/bin/${pkgname%-git}"
	install -Dm644 "${pkgname%-git}/app.asar" "${pkgdir}/usr/share/${pkgname%-git}/app.asar"
	install -Dm644 bbg.desktop "${pkgdir}/usr/share/applications/${pkgname%-git}.desktop"
	install -Dm644 icon.png "${pkgdir}/usr/share/icons/${pkgname%-git}.png"

	# install bbgvertype: https://github.com/baiyang-lzy/bbg/blob/f3d61ce4d79680329bad4cb014c909fb86037f38/App/start.js
	echo "aur-bbg-git-misaka13514" | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bbg/bbgvertype"
}
