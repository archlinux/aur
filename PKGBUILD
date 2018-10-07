# Maintainer: Erikas Rudinskas <erikmnkl@gmail.com>

pkgname=nbfc
pkgver=1.6_beta1
_pkgver=$(echo $pkgver | sed -r 's/_/-/g')
_pkgname=nbfc-${_pkgver}
pkgrel=1
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
md5sums=("1eee9e6e5a4cf2f6324e73000d5175f2"
         "b8c7ecbe7816a43deeb91426b1ba3fbe"
         "be72ba56253695932458f7cddc4a2194")

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
