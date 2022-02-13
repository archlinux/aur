# Maintainer: Misaka13514 <Misaka13514 at gmail dot com>
pkgname=bbg-git
pkgver=20220213.r4.381d3df
pkgrel=1
pkgdesc="A static blog generator built with electron"
arch=('any')
url="https://github.com/baiyang-lzy/bbg"
license=('Unlicense')
depends=('electron' 'gtk3' 'libxcb')
makedepends=('git' 'npm')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(
	'bbg.sh'
	'icon.png'
	'bbg.desktop'
	"${pkgname%-git}::git+${url}.git"
)
sha256sums=(
	'b24a2718e870311aa07ae4e1c106218a87042e76102023236c006558f727ea09'
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
	npm install
	npm run package_linux
}

package() {
	cd "$srcdir"
	mkdir -p "${pkgdir}/usr/lib/${pkgname%-git}"
	install -Dm 755 bbg.sh "${pkgdir}/usr/bin/${pkgname%-git}"
	install -Dm 644 "${pkgname%-git}/bbg-linux-x64/resources/app.asar" "${pkgdir}/usr/lib/${pkgname%-git}/app.asar"
	install -Dm 644 bbg.desktop "${pkgdir}/usr/share/applications/${pkgname%-git}.desktop"
	install -Dm 644 icon.png "${pkgdir}/usr/share/icons/${pkgname%-git}.png"
}
