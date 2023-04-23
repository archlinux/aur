# Maintainer:       Misaka13514 <Misaka13514 at gmail dot com>
# Co-Maintainer:    zzjzxq33 <wojiushixxx at 126 dot com>
pkgname=bbg-git
_pkgname=${pkgname%-git}
pkgver=20230219.r20.1393a0c
pkgrel=1
pkgdesc="A static blog generator built with electron"
arch=('any')
url="https://github.com/bbg-contributors/bbg"
license=('Unlicense')
depends=('electron')
makedepends=('git' 'yarn' 'asar')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=(
	'icon.png'::'https://github.com/bbg-contributors/bbg-resources/raw/main/icon.png'
	"${_pkgname}::git+${url}.git"
)
sha256sums=(
	'SKIP'
	'SKIP'
)

pkgver() {
	cd "$srcdir/${_pkgname}"
	printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
	cd "$srcdir/${_pkgname}"
	git submodule update --init --recursive
}

build() {
	cd "$srcdir/${_pkgname}"
	yarn install
	asar pack . app.asar
	mv app.asar ../"app-${pkgver}.asar"
}

package() {
	cd "$srcdir"
	install -dm755 "${pkgdir}/usr/share/${_pkgname}"
	install -Dm644 "app-${pkgver}.asar" "${pkgdir}/usr/share/${_pkgname}/app.asar"
	install -Dm644 icon.png "${pkgdir}/usr/share/icons/${_pkgname}.png"
    install -Dm755 /dev/stdin ${pkgdir}/usr/bin/${_pkgname} << EOF
#!/bin/sh

exec electron /usr/share/bbg/app.asar "\$@"
EOF
	install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/${_pkgname}.desktop" << EOF
[Desktop Entry]
Name=bbg
Comment=blog generator
Keywords=
Exec=/usr/bin/bbg
TryExec=
Terminal=false
Icon=/usr/share/icons/bbg.png
Type=Application
StartupNotify=false
Categories=Office
EOF

	# install bbgvertype: https://github.com/bbg-contributors/bbg/blob/f3d61ce4d79680329bad4cb014c909fb86037f38/App/start.js
	echo "aur-bbg-git-misaka13514" | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bbg/bbgvertype"
}
