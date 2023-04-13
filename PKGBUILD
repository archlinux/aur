# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>
# Contributor: Erikas Rudinskas <erikmnkl@gmail.com>

pkgname=nbfc
pkgver=1.6.3
_pkgver=$(echo $pkgver | sed -r 's/_/-/g')
_pkgname=nbfc-${_pkgver}
pkgrel=4
pkgdesc="Cross-platform fan control service for notebooks (STABLE & BETA releases)"
url="https://github.com/hirschmann/nbfc"
arch=('i686' 'x86_64')
license=('GPL3')
install=${pkgname}.install
depends=('mono')
# makedepends=('mono-msbuild' 'nuget')
makedepends=('nuget')
source=("https://github.com/hirschmann/nbfc/archive/${_pkgver}.tar.gz"
        "nbfc"
        "ec-probe")
md5sums=("2b61dde6a98622b57d85448e611dd382"
         "2dc636f29fa935ea427e6e67bdb9f65d"
         "81686043a7fc44d620a00a171c917936")

build() {
	cd "${srcdir}/${_pkgname}/"

	nuget restore NoteBookFanControl.sln
	# msbuild -m /t:Build /p:Configuration=ReleaseLinux NoteBookFanControl.sln
	xbuild /t:Build /p:Configuration=ReleaseLinux NoteBookFanControl.sln
}

package() {
	cd "${srcdir}/${_pkgname}/"

	# Files installation:
	mkdir -p "${pkgdir}/opt/nbfc"
	cp -R Linux/bin/Release/* "${pkgdir}/opt/nbfc/"

	# Systemd services:
	install -D -m644 Linux/nbfc.service "${pkgdir}/usr/lib/systemd/system/nbfc.service"
	install -D -m644 Linux/nbfc-sleep.service "${pkgdir}/usr/lib/systemd/system/nbfc-sleep.service"

	# Executables:
	install -Dm755 "${srcdir}/nbfc" "${pkgdir}/usr/bin/nbfc"
	install -Dm755 "${srcdir}/ec-probe" "${pkgdir}/usr/bin/ec-probe"

	# License:
	mkdir -p "${pkgdir}/usr/share/licenses/nbfc"
	install -D -m755 LICENSE.md "${pkgdir}/usr/share/licenses/nbfc/LICENSE"
}
# vim:set ts=2 sw=2 et:
