# Maintainer: Erikas Rudinskas <erikmnkl@gmail.com>

pkgname=nbfc
pkgver=1.5.3
#_version="${pkgver}"
_version="${pkgver}-beta"
pkgrel=2
pkgdesc="Cross-platform fan control service for notebooks (STABLE & BETA release)"
arch=("i686" "x86_64")
url="https://github.com/hirschmann/nbfc"
conflicts=('nbfc-beta' 'nbfc-git')
license=("GPL3")
depends=("mono")
provides=('nbfc')
makedepends=("nuget")
source=("https://github.com/hirschmann/nbfc/archive/${_version}.tar.gz")
md5sums=("55a344ee11d0ff5351bab0f4a583c36a")

build() {
	cd "${srcdir}/nbfc-${_version}/"
	nuget restore NoteBookFanControl.sln
	xbuild /t:Build /p:Configuration=ReleaseLinux NoteBookFanControl.sln
}

package() {

	# Files/executables installation:
	mkdir -p "${pkgdir}/opt/nbfc"
	cp -R "${srcdir}/nbfc-${_version}/Linux/bin/Release/"* "${pkgdir}/opt/nbfc/"
	chmod -R 0755 "${pkgdir}/opt/nbfc"

	# Systemd services:
	install -D -m644 "${srcdir}/nbfc-${_version}/Linux/nbfc.service" "${pkgdir}/etc/systemd/system/nbfc.service"
	install -D -m644 "${srcdir}/nbfc-${_version}/Linux/nbfc-sleep.service" "${pkgdir}/etc/systemd/system/nbfc-sleep.service"

	# Make nbfc executable from CLI:
	mkdir -p "${pkgdir}/usr/bin"
	#
	echo "/opt/nbfc/./nbfc.exe \"\$@\" 2>&1 | sed 's/nbfc.exe/nbfc/g'" > "${pkgdir}/usr/bin/nbfc"
	chmod 0755 "${pkgdir}/usr/bin/nbfc"

	# License:
	mkdir -p "${pkgdir}/usr/share/licenses/nbfc"
	install -D -m755 "${srcdir}/nbfc-${_version}/LICENSE.md" "${pkgdir}/usr/share/licenses/nbfc/LICENSE"
}
