# Maintainer: silver hikari <kerrickethan@gmail.com>
pkgname=gridmonger-git
pkgver=1.1.0.r85.0ac13d0
epoch=1
pkgrel=2
pkgdesc="Your trusty old-school cRPG mapping companion"
arch=('x86_64')
url="https://gridmonger.johnnovak.net/"
license=('custom:WTFPL')
depends=('zenity' 'libxxf86vm' 'libglvnd' 'libxi' 'libxrandr' 'libx11' 'libxinerama' 'libxcursor')
makedepends=('git' 'nim' 'dart-sass' 'python-sphinx' 'gendesk')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/johnnovak/gridmonger' 'git+https://github.com/johnnovak/koi' 'git+https://github.com/johnnovak/nim-glfw#branch=gridmonger')
md5sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
	gendesk -n -f --pkgname="${pkgname%-git}" --pkgdesc="$pkgdesc" --exec="/opt/gridmonger/gridmonger" --icon="/usr/share/pixmaps/gridmonger.png"
	atlas init --deps=deps
	cd "${pkgname%-git}"
	echo -e "requires \"nanovg\"\nrequires \"osdialog\"\nrequires \"riff\"\nrequires \"winim\"\nrequires \"file://$srcdir/nim-glfw\"\nrequires \"file://$srcdir/koi\"" > 'gridmonger.nimble'
	atlas install gridmonger.nimble
}

build() {
	cd "$srcdir/${pkgname%-git}"
	nim release -d:osdialogZenity
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -d "${pkgdir}/opt/gridmonger/Config"
	strip "gridmonger"
	install -Dm755 "gridmonger" "${pkgdir}/opt/gridmonger/gridmonger"
	cp -fr "Data" "${pkgdir}/opt/gridmonger/Data"
	cp -fr "Example Maps" "${pkgdir}/opt/gridmonger/Example Maps"
	cp -fr "Themes" "${pkgdir}/opt/gridmonger/Themes"

	#Docs
	install -d "${pkgdir}/usr/share/doc/gridmonger/"
	nim manual
	cp -fr "Manual" "${pkgdir}/usr/share/doc/gridmonger"
	chmod -R 777 "$pkgdir/opt/gridmonger"

	#desktop file and cmd executable
	install -Dm755 "${srcdir}/gridmonger.desktop" "${pkgdir}/usr/share/applications/gridmonger.desktop"
	install -Dm755 "extras/appicons/app-icon.png" "${pkgdir}/usr/share/pixmaps/gridmonger.png"
	install -d "$pkgdir/usr/bin"
	ln -s "/opt/gridmonger/gridmonger" "$pkgdir/usr/bin/gridmonger"
	install -Dm755 "COPYING" "$pkgdir/usr/share/licenses/gridmonger/LICENSE"
}
