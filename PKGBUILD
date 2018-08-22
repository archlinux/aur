# Maintainer: ntruessel <nicolas+arch@ntruessel.ch>
pkgname=eiffelstudio-bin
_major=18
_minor=07
_build=101981
pkgver=${_major}.${_minor}.${_build}
pkgrel=1
pkgdesc="IDE for the Eiffel programming language (opensource edition)"
arch=("x86_64")
url="https://www.eiffel.org/downloads"
license=("GPL")
depends=("gtk2" "libxtst" "gcc")
provides=("eiffelstudio")
conflicts=("eiffelstudio")
options=("staticlibs")
source=("estudio.profile")
sha256sums=('3b5f56cf15ad160284ba49db0928b2fff5132cfbc56f7c3c1ac7289ee5bc93fc')
source_x86_64=("http://downloads.sourceforge.net/project/eiffelstudio/EiffelStudio%20${_major}.${_minor}/Build_${_build}/Eiffel_${_major}.${_minor}_gpl_${_build}-linux-x86-64.tar.bz2")
sha256sums_x86_64=('a59951c1409a0554d2d068303651e3569465cbf88dfb548932a4638ad77f7a50')

prepare() {
	# remove windows files and folders
	find "${srcdir}/Eiffel_${_major}.${_minor}" -name "msc*" -type d -exec rm -rf {} +
	find "${srcdir}/Eiffel_${_major}.${_minor}" -name "*.dll" -type f -exec rm -rf {} +
}

package() {
	install -dm755 "${pkgdir}/opt"
	cp -a "${srcdir}/Eiffel_${_major}.${_minor}/" "${pkgdir}/opt/estudio"

	if [[ "$CARCH" == "x86_64" ]]; then
		sed -i 's/@ARCH@/linux-x86-64/g' "${srcdir}/estudio.profile"
	else
		sed -i 's/@ARCH@/linux-x86/g' "${srcdir}/estudio.profile"
	fi

	install -Dm755 "${srcdir}/estudio.profile" "${pkgdir}/etc/profile.d/estudio.sh"
}
