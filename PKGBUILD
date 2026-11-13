# Maintainer: hyperpuncher
pkgname=nemo-speech-cuda-nightly-bin
pkgver=20261113.092801
pkgrel=1
_release=nightly
pkgdesc='Native speech recognition, synthesis, and translation with CUDA support (nightly)'
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
source_x86_64=("nemo-speech-${pkgver}-linux-x86_64-cuda.tar.gz::${url}/releases/download/${_release}/nemo-speech-${_release}-linux-x86_64-cuda.tar.gz")
source_aarch64=("nemo-speech-${pkgver}-linux-aarch64-cuda12.tar.gz::${url}/releases/download/${_release}/nemo-speech-${_release}-linux-aarch64-cuda12.tar.gz")
sha256sums_x86_64=('d65e9a957ee0a0482e62dabd7a3641a3022114d29431beba22eda2f9ac65977d')
sha256sums_aarch64=('4b60bd4e20e55363863b3b7f340f225d81b8a1e22353871e7dbc4f075e908fc8')

package() {
	# Keep the upstream layout and private libraries together for relative RPATHs.
	install -dm755 "${pkgdir}/opt/nemo-speech" "${pkgdir}/usr/bin" \
		"${pkgdir}/usr/share/licenses" "${pkgdir}/usr/share/doc"
	local _backend=cuda
	if [[ ${CARCH} == aarch64 ]]; then
		_backend=cuda12
	fi
	cp -a "${srcdir}/nemo-speech-${_release}-linux-${CARCH}-${_backend}/." \
		"${pkgdir}/opt/nemo-speech/"
	ln -s /opt/nemo-speech/bin/nemo-speech "${pkgdir}/usr/bin/nemo-speech"
	ln -s /opt/nemo-speech/share/licenses/nemo-speech \
		"${pkgdir}/usr/share/licenses/${pkgname}"
	ln -s /opt/nemo-speech/share/doc/nemo-speech \
		"${pkgdir}/usr/share/doc/${pkgname}"
}
