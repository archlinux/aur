# Maintainer: Erikas Rudinskas <erikmnkl@gmail.com>

pkgname=nbfc
pkgver=1.6_beta2
_pkgver=$(echo $pkgver | sed -r 's/_/-/g')
_pkgname=nbfc-${_pkgver}
pkgrel=2
pkgdesc="Cross-platform fan control service for notebooks (STABLE & BETA releases)"
arch=("i686" "x86_64")
url="https://github.com/hirschmann/nbfc"
conflicts=('nbfc-beta' 'nbfc-git')
license=("GPL3")
install=${pkgname}.install
depends=("mono")
makedepends=('ncurses<=6.0-4')
provides=('nbfc' 'ec-probe')
makedepends=('nuget')
source=("https://github.com/hirschmann/nbfc/archive/${_pkgver}.tar.gz"
        "nbfc"
        "ec-probe")
md5sums=("d2b890d4fcee961024aa61e14a61d741"
         "2dc636f29fa935ea427e6e67bdb9f65d"
         "81686043a7fc44d620a00a171c917936")

build() {
	cd "${srcdir}/${_pkgname}/"
	nuget restore NoteBookFanControl.sln
	xbuild /t:Build /p:Configuration=ReleaseLinux NoteBookFanControl.sln
}

package() {
	# Files installation:
	mkdir -p "${pkgdir}/opt/nbfc"
	cp -R "${srcdir}/${_pkgname}/Linux/bin/Release/"* "${pkgdir}/opt/nbfc/"

	# Systemd services:
	install -D -m644 "${srcdir}/${_pkgname}/Linux/nbfc.service" "${pkgdir}/etc/systemd/system/nbfc.service"
	install -D -m644 "${srcdir}/${_pkgname}/Linux/nbfc-sleep.service" "${pkgdir}/etc/systemd/system/nbfc-sleep.service"
	
	# Executables:
	install -Dm755 "${srcdir}/nbfc" "${pkgdir}/usr/bin/nbfc"
	install -Dm755 "${srcdir}/ec-probe" "${pkgdir}/usr/bin/ec-probe"

	# License:
	mkdir -p "${pkgdir}/usr/share/licenses/nbfc"
	install -D -m755 "${srcdir}/${_pkgname}/LICENSE.md" "${pkgdir}/usr/share/licenses/nbfc/LICENSE"
}
