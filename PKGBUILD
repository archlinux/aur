# Maintainer: Erikas Rudinskas <erikmnkl@gmail.com>

pkgname=nbfc-beta
pkgver=1.5.3
pkgrel=1
pkgdesc="Cross-platform fan control service for notebooks (BETA release)"
arch=("i686" "x86_64")
url="https://github.com/hirschmann/nbfc"
license=("GPL")
depends=("mono")
provides=('nbfc')
makedepends=("nuget")
source=("https://github.com/hirschmann/nbfc/archive/${pkgver}-beta.tar.gz")
md5sums=("55a344ee11d0ff5351bab0f4a583c36a")

build() {
	warning "You will get 3 warnings during build. Ignore them."
	cd "${srcdir}/nbfc-${pkgver}-beta/"
	nuget restore NoteBookFanControl.sln
	xbuild /t:Build /p:Configuration=ReleaseLinux NoteBookFanControl.sln
}

package() {

	# Files/executables installation:
	mkdir -p "${pkgdir}/opt/nbfc"
	cp -R "${srcdir}/nbfc-${pkgver}-beta/Linux/bin/Release/"* "${pkgdir}/opt/nbfc/"
	chmod -R 0755 "${pkgdir}/opt/nbfc"

	# Systemd services:
	install -D -m644 "${srcdir}/nbfc-${pkgver}-beta/Linux/nbfc.service" "${pkgdir}/etc/systemd/system/nbfc.service"
	install -D -m644 "${srcdir}/nbfc-${pkgver}-beta/Linux/nbfc-sleep.service" "${pkgdir}/etc/systemd/system/nbfc-sleep.service"

	# Make nbfc executable from CLI:
	mkdir -p "${pkgdir}/usr/bin"
	echo "mono /opt/nbfc/nbfc.exe \"\$@\"" > "${pkgdir}/usr/bin/nbfc"
	chmod 0755 "${pkgdir}/usr/bin/nbfc"

	# License:
	mkdir -p "${pkgdir}/usr/share/licenses/nbfc"
	install -D -m755 "${srcdir}/nbfc-${pkgver}-beta/LICENSE.md" "${pkgdir}/usr/share/licenses/nbfc/LICENSE"
}
