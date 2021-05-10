# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>
# Contributor: Erikas Rudinskas <erikmnkl@gmail.com>

pkgname=nbfc-git
pkgver=1.6.3.r40.gfc9fb97
pkgrel=3
pkgdesc='Cross-platform fan control service for notebooks (Development version)'
url="https://github.com/hirschmann/nbfc"
arch=('i686' 'x86_64')
conflicts=('nbfc')
provides=('nbfc')
license=('GPL3')
install=${pkgname}.install
depends=('mono')
# makedepends=('nuget' 'mono-msbuild' 'git')
makedepends=('nuget' 'git')
provides=('nbfc')
source=("${pkgname}::git+https://github.com/hirschmann/nbfc.git"
        "nbfc"
        "ec-probe")
md5sums=("SKIP"
         "2dc636f29fa935ea427e6e67bdb9f65d"
         "81686043a7fc44d620a00a171c917936")

pkgver() {
	cd "${srcdir}/${pkgname}"

	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/.beta//g'
}

build() {
	cd "${srcdir}/${pkgname}"

	nuget restore NoteBookFanControl.sln
	# msbuild -m /t:Build /p:Configuration=ReleaseLinux NoteBookFanControl.sln
	xbuild /t:Build /p:Configuration=ReleaseLinux NoteBookFanControl.sln
}

package() {
	cd "${srcdir}/${pkgname}"

	# Files installation:
	mkdir -p "${pkgdir}/opt/nbfc"
	cp -R Linux/bin/Release/* "${pkgdir}/opt/nbfc/"

	# Systemd services:
	install -D -m644 Linux/nbfc.service "${pkgdir}/etc/systemd/system/nbfc.service"
	install -D -m644 Linux/nbfc-sleep.service "${pkgdir}/etc/systemd/system/nbfc-sleep.service"

	# Executables:
	install -Dm755 "${srcdir}/nbfc" "${pkgdir}/usr/bin/nbfc"
	install -Dm755 "${srcdir}/ec-probe" "${pkgdir}/usr/bin/ec-probe"

	# License:
	mkdir -p "${pkgdir}/usr/share/licenses/nbfc"
	install -D -m755 LICENSE.md "${pkgdir}/usr/share/licenses/nbfc/LICENSE"
}
