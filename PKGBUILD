# Maintainer: Nguyễn Chính Hữu <huupoke12@gmail.com>
# Contributor: Ammon Smith <ammon.i.smith@gmail.com>
# Contributor: Nicole Fontenot <nfontenot27@gmail.com>
# Contributor: "Ferdi265" [AUR]
# Contributor: "downbtn" [AUR]
# Contributor: "Roliga" [AUR]
# Contributor: "donaldtrump" [AUR]

pkgname='osu-lazer-git'
pkgver='2021.416.0.r73.e227c076e5'
pkgrel=1
pkgdesc='An open source, free-to-win rhythm game'
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/ppy/osu'
license=('MIT')
depends=('dotnet-runtime>=5' 'ffmpeg' 'libgl')
makedepends=('git' 'dotnet-sdk>=5')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=('!strip')
source=("${pkgname}::git+https://github.com/ppy/osu.git"
        "${pkgname}.sh"
        "${pkgname}.desktop"
        "${pkgname}.xml")
sha256sums=('SKIP'
            'c49001b8faa530300a1d33d1dddb4d8a7c671f432c0417d357a6e5e83f65a275'
            'b13d409e96084bc024b31fd39fa98545561e9d3b0270ce3247457910dfd8298c'
            'fa5c5ebf1546e855103db2f97721448cb60c3cdf85c370e266c8a6eb0094e1b5')

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
