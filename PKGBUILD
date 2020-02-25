# Maintainer: Brad Erhart <brae.04+aur@gmail.com>

pkgname=musixmatch-bin
_pkgname=${pkgname%-bin}
pkgver=3.10.4043
_pkgver=master.20200211001
pkgrel=1
pkgdesc='Lyrics for your music'
arch=('x86_64')
url='https://about.musixmatch.com/apps'
license=('custom')
depends=(
	'dconf'
	'desktop-file-utils'
	'electron'
	'hicolor-icon-theme'
	'libnotify'
	'libxtst'
	'nss'
)
optdepends=('spotify: Instant synchronised lyrics')
source=(
	"https://download-app.musixmatch.com/download/${_pkgname}_$pkgver-${_pkgver}_amd64.deb"
	'eula.md'
)
sha256sums=(
	'f1dbb249f5622a7b5bb62bc53616c5579b79029aee8c7ff7ecc27f11c12e7bd1'
	'98debf3d134d676f8188406d03b880c0ccde743b882b8d1e0bcaf02dd2eb0705'
)

prepare() {
	tar xf data.tar.xz
	sed -i 's,;x-scheme-handler/mxm,,' usr/share/mime/packages/$_pkgname.xml
	sed -i 's,/opt/Musixmatch/,,' usr/share/applications/$_pkgname.desktop
	mkdir -p usr/lib/$_pkgname "$pkgdir"
	mv opt/Musixmatch/resources/app.asar usr/lib/$_pkgname
}

package() {
	mv usr "$pkgdir"
	install -D eula.md -t "$pkgdir/usr/share/licenses/$_pkgname"
	echo -e '#!/bin/sh\n\nexec electron /usr/lib/musixmatch/app.asar "$@"' | install -Dm 755 /dev/stdin "$pkgdir/usr/bin/$_pkgname"
}
