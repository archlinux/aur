# Maintainer: BrainDamage

pkgname=furnace
pkgver=0.6pre1
pkgrel=3
pkgdesc="A multi-system chiptune tracker compatible with DefleMask modules"
url="https://github.com/tildearrow/furnace"
depends=('sdl2' 'hicolor-icon-theme' 'libsndfile' 'fmt' 'alsa-lib' 'fftw' 'rtmidi')
makedepends=('jack' 'cmake')
optdepends=('jack: JACK audio support')
arch=('x86_64')
license=('GPL')
_extern_project_names=('adpcm' 'Nuked-OPN2')
_extern_git_hashes=('ef7a217154badc3b99978ac481b268c8aab67bd8' '64704a443f8f6c1906ba26297092ea70fa1d45d7')
source=("${pkgname}-${pkgver}::https://github.com/tildearrow/furnace/archive/refs/tags/v${pkgver}.tar.gz"
	"https://github.com/superctr/adpcm/archive/${_extern_git_hashes[0]}.zip"
	"https://github.com/nukeykt/Nuked-OPN2/archive/${_extern_git_hashes[1]}.zip")
sha256sums=('168daa6f5c63d78d5b18ea69b537f598fb27ee9ad7e556edb9d2f9d0fc7ae013'
            'd78895a68ada6dfc6de72943f005d42d7f4e9d98436a0237617c2b523766bab0'
            '34cd0c36eb507fc4a96487147be7a34aa97f4cf21b0775e021a62cacb61eef68')

prepare() {
	# replace the target dirs in extern path with symlinks to the sources
	for _source_index in $(seq 0 1); do
		_source_dir="${_extern_project_names[${_source_index}]}-${_extern_git_hashes[${_source_index}]}"
		_target="${srcdir}/${pkgname}-${pkgver}/extern/${_extern_project_names[${_source_index}]}"
		! test -L "${_target}" && test -d "${_target}" && rmdir "${_target}"
		ln -sfv "../../${_source_dir}" "${_target}"
	done
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	mkdir -p build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX=/usr \
		-DBUILD_GUI=ON \
		-DSYSTEM_SDL2=ON -DSYSTEM_FMT=ON \
		-DSYSTEM_ZLIB=ON -DSYSTEM_LIBSNDFILE=ON \
		-DSYSTEM_FFTW=ON -DSYSTEM_RTMIDI=ON \
		-DWITH_JACK=ON ..
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	cd build
	make DESTDIR="${pkgdir}" PREFIX='/usr' install
	cd ..
	find "${pkgdir}/usr/share/icons/hicolor" -mindepth 1 -maxdepth 1 -type d -name '*@2' | xargs rm -rv
}
