# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=Beacroxx
_pkgname=pulse-visualizer
pkgname=${_pkgname}-bin
pkgver=1.1.0
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
            '17e300a313e0eafb19528e76193b134791c6f19614761f0ba48b8393bf72cedf')
sha256sums_x86_64=('12ac4626a5ce394867dcbfc51190d73125a65ba1ec65789b759ad8dad0ac9af7')


prepare() {
	cd "${srcdir}/${CARCH}/" || exit

	mkdir ./fonts
	mv ./JetBrainsMonoNerdFont-Medium.ttf ./fonts/
}

package() {
	cd "${srcdir}/" || exit

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	cd "${srcdir}/${CARCH}/" || exit

	install -Dm644 "CONFIGURATION.md" "${pkgdir}/usr/share/doc/${pkgname}/CONFIGURATION.md"

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "${_pkgname}.1" "${pkgdir}/usr/share/man/man1/${_pkgname}.1"

	install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

	mkdir "${pkgdir}/usr/share/${_pkgname}/"
	cp -rf shaders "${pkgdir}/usr/share/${_pkgname}/"
	cp -rf themes "${pkgdir}/usr/share/${_pkgname}/"
	cp -rf fonts "${pkgdir}/usr/share/${_pkgname}/"
	cp -f config.yml.template "${pkgdir}/usr/share/${_pkgname}/"
}
