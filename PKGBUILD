# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=Beacroxx
_pkgname=pulse-visualizer
pkgname=${_pkgname}-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="A GPU-accelerated audio visualizer for PulseAudio/PipeWire"
arch=('x86_64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('GPL-3.0-only')

install=pulse-visualizer-bin.install
depends=('glibc' 'gcc-libs' 'libebur128' 'glew' 'freetype2' 'libglvnd' 'libpipewire' 'sdl3' 'libpulse' 'yaml-cpp' 'fftw')
conflicts=("${_pkgname}" "${_pkgname}"-git)
provides=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-${arch[0]}.tar.gz")
sha256sums=('c53a65c2fd561c87eaabf1072ef5dcab8653042bc15308465f52413585eb6271'
            'f71c84e53a77e7d7bd3efe817e3d5ce38ee5f66baead5ef7a4bbf9cc7e18ff86')
sha256sums_x86_64=('54d6cb69296d3157630605d9f9e3220fb859178a5f009bfdfe62d531d9c2b39a')

_pkghome="home/bea/pulse-gh-release/${CARCH}"

prepare() {
	cd "${_pkghome}/" || exit

	mkdir ./fonts
	mv ./JetBrainsMonoNerdFont-Medium.ttf ./fonts/
}

package() {
	cd "${srcdir}/" || exit

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	cd "${_pkghome}/" || exit

	install -Dm644 "CONFIGURATION.md" "${pkgdir}/usr/share/doc/${pkgname}/CONFIGURATION.md"

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "${_pkgname}.1" "${pkgdir}/usr/share/man/man1/${_pkgname}.1"

	install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

	install -Dm644 "${_pkgname}.png" "${pkgdir}/usr/share/icons/${_pkgname}.png"

	mkdir "${pkgdir}/usr/share/${_pkgname}/"
	cp -rf shaders "${pkgdir}/usr/share/${_pkgname}/"
	cp -rf themes "${pkgdir}/usr/share/${_pkgname}/"
	cp -rf fonts "${pkgdir}/usr/share/${_pkgname}/"
	cp -f config.yml.template "${pkgdir}/usr/share/${_pkgname}/"
}
