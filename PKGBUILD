
# Maintainer : mdevlamynck <matthias.devlamynck@mailoo.org>
# Thanks to art-software for hosting extra files

pkgname=my-little-investigations
_gitrepo=https://github.com/mdevlamynck/${pkgname}.git
#_gitrepo=https://github.com/GabuEx/${pkgname}.git
pkgver=1.1.1
pkgrel=1
pkgdesc="An Ace Attorney like game based on My Little Pony : Friendship is Magic"
arch=('i686' 'x86_64')
url="http://www.equestriandreamers.com/"
license=('MIT')
groups=('')
replaces=('my-little-investigation')
depends=('sdl2' 'sdl2_image' 'sdl2_ttf' 'sdl2_mixer' 'ffmpeg' 'crypto++') # 'xdelta3')
makedepends=('cmake' 'git')
install=mli.install
source=(
	"git+${_gitrepo}"
	"http://www.art-software.fr/files/MLI/common_data-${pkgver}.tar.xz"
	#"http://www.art-software.fr/files/MLI/needed_to_package-${pkgver}.tar.xz"
)
md5sums=(
	'SKIP'
	'f1fdbbb7306065a46edf0a9932360b64'
	#'e5d48f2eec8c55b8eb51bb573fe1d4eb'
)

build () {
	cd "${srcdir}/${pkgname}"
	git checkout $pkgver

	#mkdir -p cmake
	#mv "${srcdir}/needed_to_package/CMakeLists.txt" "${srcdir}/${pkgname}"
	#mv "${srcdir}/needed_to_package/"Find*.cmake "${srcdir}/${pkgname}/cmake"

	mkdir -p build
	cd build
	cmake .. -DCMAKE_BUILD_TYPE=Release
	make MyLittleInvestigations

	cd "${srcdir}/${pkgname}"
	convert mli.ico mli.png
	mv mli-0.png mli.png
}

package() {
	cd "${srcdir}/${pkgname}/build"
	install -D -m 755 MyLittleInvestigations "${pkgdir}/usr/bin/MyLittleInvestigations"

	cd "${srcdir}/${pkgname}/needed_to_package"
	install -D -m 644 MyLittleInvestigations.desktop "${pkgdir}/usr/share/applications/MyLittleInvestigations.desktop"

	#cd "${srcdir}/needed_to_package"
	#install -D -m 644 MyLittleInvestigations.desktop "${pkgdir}/usr/share/applications/MyLittleInvestigations.desktop"

	cd "${srcdir}/${pkgname}"
	install -D -m 644 mli.png "${pkgdir}/usr/share/MyLittleInvestigations/mli.png"

	for file in $(find "${srcdir}/common_data" -type f)
	do
		install -D -m 644 "${file}" "${pkgdir}/usr/share/MyLittleInvestigations/${file#"${srcdir}/common_data"}"
	done

	echo ${pkgver} > "${pkgdir}/usr/share/MyLittleInvestigations/.version"
}

