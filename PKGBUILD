# Maintainer: Lucki <https://aur.archlinux.org/account/Lucki/>
# Contributor: leper <blubblub@mail.ru>

pkgname=smokinguns-git
_pkgname=${pkgname%-git}
pkgver=1.1.r859.gf5d9ecf2
pkgrel=6
pkgdesc='A semi-realistic simulation of the old west great atmosphere built on id Tech 3.'
url="https://www.smokin-guns.org"
arch=('i686' 'x86_64')
license=('GPL2')
changelog=.CHANGELOG
depends=('sdl' 'speex' 'hicolor-icon-theme' 'freetype2' 'libgl' 'libjpeg-turbo')
makedepends=('git' 'openal' 'glu')
conflicts=('smokinguns-bin' 'smokinguns' 'smokinguns-data')
provides=('smokinguns-data' 'smokinguns')
source=("${_pkgname}::git+https://github.com/smokin-guns/SmokinGuns.git"
        "${_pkgname}-data::https://www.smokin-guns.org/downloads/Smokin_Guns_1.1.zip"
        "${_pkgname}.desktop")
sha512sums=('SKIP'
            '51954ce00cccd9eb95a10491f0fcdea2d024058da11cbda7ee56c6369e8bc101d89ed95549cf4255393c3e1bec4585be12937e7ed7b20ff4cc0ce96685a5ce72'
            '37aefb4a9e811644af09bbbfdb35d6a2572bc70b6fe8ff0078330d1070e73ebcd18f2e656156f1e3d92b2ec7f6fdffe63b2c66018b449d8b5aa6402b3eb24d7d')

pkgver()
{
	cd "${srcdir}/${_pkgname}" || exit
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare()
{
	cd "${srcdir}/${_pkgname}" || exit

	{
		# Set basedir
		echo "DEFAULT_BASEDIR = /usr/share/${_pkgname}"

		# Use system libraries
		echo "USE_INTERNAL_ZLIB=0"
		echo "USE_INTERNAL_JPEG=0"
		echo "USE_INTERNAL_SPEEX=0"
		echo "USE_INTERNAL_OPUS=1"
		echo "USE_INTERNAL_OGG=0"

		# Use system headers
		echo "USE_LOCAL_HEADERS=0"

	} >> "Makefile.local"
}

build()
{
	cd "${srcdir}/${_pkgname}" || exit
	make
}

package()
{
	cd "${srcdir}/Smokin' Guns 1.1" || exit
	install -d "${pkgdir}/usr/share/${_pkgname}/baseq3"
	install -m 644 baseq3/* "${pkgdir}/usr/share/${_pkgname}/baseq3"
	install -d "${pkgdir}/usr/share/${_pkgname}/${_pkgname}"
	install -m 644 "${_pkgname}"/* "${pkgdir}/usr/share/${_pkgname}/${_pkgname}"

	cd "${srcdir}/${_pkgname}" || exit

	SUFFIX=${CARCH//i686/i386}
	install -Dm 755 "build/release-linux-${SUFFIX}/${_pkgname}.${SUFFIX}" \
		          	"${pkgdir}/usr/bin/${_pkgname}"

	install -Dm 755 "build/release-linux-${SUFFIX}/${_pkgname}_dedicated.${SUFFIX}" \
		          	"${pkgdir}/usr/bin/${_pkgname}_dedicated"

	install -Dm 644 "build/release-linux-${SUFFIX}/renderer_opengl1_${SUFFIX}.so" \
		          	"${pkgdir}/usr/share/${_pkgname}"

	install -Dm 644 "build/release-linux-${SUFFIX}/renderer_opengl2_${SUFFIX}.so" \
		          	"${pkgdir}/usr/share/${_pkgname}"

	install -Dm 644 "${srcdir}/${_pkgname}.desktop" \
		          	"${pkgdir}/usr/share/applications/${_pkgname}.desktop"

	install -Dm 644	"misc/${_pkgname}.png" \
		          	"${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png"
}

