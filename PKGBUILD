# Maintainer: Nguyễn Chính Hữu <huupoke12@gmail.com>
# Contributor: Ammon Smith <ammon.i.smith@gmail.com>
# Contributor: Nicole Fontenot <nfontenot27@gmail.com>
# Contributor: "Ferdi265" [AUR]
# Contributor: "downbtn" [AUR]
# Contributor: "Roliga" [AUR]
# Contributor: "donaldtrump" [AUR]

pkgname='osu-lazer-git'
pkgver='2022.409.0.r48.3d27d3c536'
pkgrel=1
pkgdesc='An open source, free-to-win rhythm game'
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/ppy/osu'
license=('MIT')
depends=('dotnet-runtime-6.0' 'ffmpeg4.4' 'libgl')
makedepends=('git' 'dotnet-sdk-6.0')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=('!strip')
source=("${pkgname}::git+https://github.com/ppy/osu.git"
        "${pkgname}.sh"
        "${pkgname}.desktop"
        "${pkgname}.xml")
sha256sums=('SKIP'
            'b891c7d733753a3d6bf1d5cf4230cf36f6e8a18c6bf887398fce7bc371723fe6'
            '0e117a17c394de80db9b9fdd526de3701d6de6ff1141e5fac57985f2573ae102'
            'ee77425386d476f0f45d73e1ef3a0b5a2bbe8c1ad03716a5ff3e6f7afdad1458')

pkgver() {
	cd "${pkgname}"
	printf "'%s'" "$(git describe --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "${pkgname}"
	rm -rf 'compiled'
	env DOTNET_CLI_TELEMETRY_OPTOUT="${DOTNET_CLI_TELEMETRY_OPTOUT-1}" dotnet publish 'osu.Desktop' \
	--no-self-contained --configuration 'Release' \
	--runtime "$(dotnet --info | grep -F 'RID' | cut -d ':' -f 2 | tr -d '[:space:]')" \
	--output 'compiled'
}

package() {
	# Launcher, Desktop entry, MIME
	install -D -m 755 "${pkgname}.sh" "${pkgdir}/usr/bin/osu-lazer"
	install -D -m 644 "${pkgname}.desktop" \
	"${pkgdir}/usr/share/applications/sh.ppy.osu.lazer.desktop"
	install -D -m 644 "${pkgname}.xml" "${pkgdir}/usr/share/mime/packages/osu-lazer.xml"

	# Runtime, Libraries
	cd "${pkgname}/compiled"
	find . -type f -exec \
	install -D -m 644 '{}' "${pkgdir}/usr/lib/osu-lazer/{}" ';'

	# Icon, License
	cd ..
	install -D -m 644 'assets/lazer.png' "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/osu-lazer.png"
	install -D -m 644 'assets/lazer-nuget.png' "${pkgdir}/usr/share/icons/hicolor/128x128/apps/osu-lazer.png"
	install -D -m 644 'LICENCE' "${pkgdir}/usr/share/licenses/${pkgname}/LICENCE"
}
