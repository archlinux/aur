# Maintainer: silver hikari <kerrickethan@gmail.com>
pkgname=gridmonger-git
pkgver=1.2.0.r38.0cde3f8
pkgrel=2
pkgdesc="Your trusty old-school cRPG mapping companion"
arch=('x86_64')
url="https://gridmonger.johnnovak.net/"
license=('custom:WTFPL')
depends=('zenity' 'libxxf86vm' 'libglvnd' 'libxi' 'libxrandr' 'libx11' 'libxinerama' 'libxcursor')
makedepends=('git' 'nim' 'dart-sass' 'python-sphinx' 'gendesk')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/johnnovak/gridmonger' 'git+https://github.com/nim-lang/atlas')
md5sums=('SKIP' 'SKIP')
install=gridmonger.install

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
	gendesk -n -f --pkgname="${pkgname%-git}" --pkgdesc="$pkgdesc" --exec="/opt/gridmonger/gridmonger" --icon="/usr/share/pixmaps/gridmonger.png"

	#stop gap until arch update release
	cd "atlas"
	atlas init
	atlas use sat
	nim c -d:release src/atlas.nim
	mv src/atlas atlas
	cd ..
	./atlas/atlas init --deps=deps
	cd "${pkgname%-git}"
	echo -e "requires \"https://github.com/zevv/with\"\n\nrequires \"https://github.com/johnnovak/nim-osdialog\"\n\nrequires \"https://github.com/johnnovak/nim-riff\"\n\nrequires \"https://github.com/euantorano/semver.nim\"\n\nrequires \"https://github.com/johnnovak/koi\"" > 'gridmonger.nimble'
	#../atlas/atlas
	../atlas/atlas install gridmonger.nimble
}

build() {
	cd "$srcdir/${pkgname%-git}"
	nim release -d:osdialogZenity -t:-std=gnu18
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dm755 "gridmonger" "${pkgdir}/opt/gridmonger/gridmonger"
	cp -fr "Data" "${pkgdir}/opt/gridmonger/Data"
	cp -fr "Example Maps" "${pkgdir}/opt/gridmonger/Example Maps"
	cp -fr "Themes" "${pkgdir}/opt/gridmonger/Themes"

	#Docs
	install -d "${pkgdir}/usr/share/doc/gridmonger/"
	nim manual
	cp -fr "Manual" "${pkgdir}/usr/share/doc/gridmonger"
	chmod -R 775 "$pkgdir/opt/gridmonger"
	chgrp games "$pkgdir/opt/gridmonger"

	#desktop file and cmd executable
	install -Dm755 "${srcdir}/gridmonger.desktop" "${pkgdir}/usr/share/applications/gridmonger.desktop"
	install -Dm755 "extras/appicons/app-icon.png" "${pkgdir}/usr/share/pixmaps/gridmonger.png"
	install -d "$pkgdir/usr/bin"
	ln -s "/opt/gridmonger/gridmonger" "$pkgdir/usr/bin/gridmonger"
	install -Dm755 "COPYING" "$pkgdir/usr/share/licenses/gridmonger/LICENSE"
}
