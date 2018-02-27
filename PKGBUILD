# Maintainer: Erikas Rudinskas <erikmnkl@gmail.com>

pkgname=nbfc-git
pkgver=1.5.3.r65.ga2465ad
pkgrel=2
pkgdesc="Cross-platform fan control service for notebooks (Development version)"
arch=("i686" "x86_64")
url="https://github.com/hirschmann/nbfc"
conflicts=('nbfc-beta' 'nbfc')
license=("GPL3")
depends=("mono")
makedepends=("ncurses<=6.0-4")
provides=("nbfc" "ec-probe")
makedepends=("nuget")
source=("${pkgname}::git+https://github.com/hirschmann/nbfc.git")
md5sums=("SKIP")

pkgver() {
	cd "${srcdir}/${pkgname}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/.beta//g'
}

build() {
	cd "${srcdir}/${pkgname}"
	nuget restore NoteBookFanControl.sln
	xbuild /t:Build /p:Configuration=ReleaseLinux NoteBookFanControl.sln
}

package() {

	# Files/executables installation:
	mkdir -p "${pkgdir}/opt/nbfc"
	cp -R "${srcdir}/${pkgname}/Linux/bin/Release/"* "${pkgdir}/opt/nbfc/"
	chmod -R 0755 "${pkgdir}/opt/nbfc"

	# Systemd services:
	install -D -m644 "${srcdir}/${pkgname}/Linux/nbfc.service" "${pkgdir}/etc/systemd/system/nbfc.service"
	install -D -m644 "${srcdir}/${pkgname}/Linux/nbfc-sleep.service" "${pkgdir}/etc/systemd/system/nbfc-sleep.service"

	# Make nbfc executable from CLI:
	mkdir -p "${pkgdir}/usr/bin"
	# Executables:
	echo "mono /opt/nbfc/nbfc.exe \"\$@\" 2>&1 | sed 's/nbfc.exe/nbfc/g'" > "${pkgdir}/usr/bin/nbfc"
	chmod 0755 "${pkgdir}/usr/bin/nbfc"
	echo "mono /opt/nbfc/ec-probe.exe \"\$@\" 2>&1 | sed 's/ec-probe.exe/ec-probe/g'" > "${pkgdir}/usr/bin/ec-probe"
	chmod 0755 "${pkgdir}/usr/bin/ec-probe"

	# License:
	mkdir -p "${pkgdir}/usr/share/licenses/nbfc"
	install -D -m755 "${srcdir}/${pkgname}/LICENSE.md" "${pkgdir}/usr/share/licenses/nbfc/LICENSE"
}
