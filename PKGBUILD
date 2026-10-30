# Maintainer: hyperpuncher
pkgname=nemo-speech-cuda-bin
pkgver=0.3.0
pkgrel=1
pkgdesc='Native speech recognition, synthesis, and translation with CUDA support'
arch=('x86_64' 'aarch64')
url='https://github.com/NVIDIA/NeMo-Speech.cpp'
license=(
	'Apache-2.0'
	'BSD-3-Clause'
	'MIT'
	'MIT-0'
	'GPL-3.0-or-later WITH GCC-exception-3.1'
	'LicenseRef-NVIDIA-CUDA'
)
depends=('glibc')
depends_x86_64=('nvidia-utils')
# ARM driver packages depend on the board. Install its NVIDIA driver separately.
optdepends=(
	'curl: model downloads'
	'alsa-lib: microphone capture through ALSA'
	'libpulse: microphone capture through PulseAudio'
	'jack: microphone capture through JACK'
)
provides=("nemo-speech=${pkgver}")
conflicts=('nemo-speech')
options=('!strip' '!debug')
source_x86_64=("${url}/releases/download/v${pkgver}/nemo-speech-${pkgver}-linux-x86_64-cuda.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/nemo-speech-${pkgver}-linux-aarch64-cuda12.tar.gz")
sha256sums_x86_64=('eca00a1f67d3ca200ddba11dd71c4f3d67e044cc0939d17d073978e40b995917')
sha256sums_aarch64=('8bc2b18589f6493373af1163ecd937cc6eba91b0305c585c6b898cd3b8a47028')

package() {
	# Keep the upstream layout and private libraries together for relative RPATHs.
	install -dm755 "${pkgdir}/opt/nemo-speech" "${pkgdir}/usr/bin" \
		"${pkgdir}/usr/share/licenses" "${pkgdir}/usr/share/doc"
	local _backend=cuda
	if [[ ${CARCH} == aarch64 ]]; then
		_backend=cuda12
	fi
	cp -a "${srcdir}/nemo-speech-${pkgver}-linux-${CARCH}-${_backend}/." \
		"${pkgdir}/opt/nemo-speech/"
	ln -s /opt/nemo-speech/bin/nemo-speech "${pkgdir}/usr/bin/nemo-speech"
	ln -s /opt/nemo-speech/share/licenses/nemo-speech \
		"${pkgdir}/usr/share/licenses/${pkgname}"
	ln -s /opt/nemo-speech/share/doc/nemo-speech \
		"${pkgdir}/usr/share/doc/${pkgname}"
}
