# Maintainer: wuxxin <wuxxin@gmail.com>
# Contributer: francisco1892 <admin@gnlug.org>
# Contributer: Jingbei Li <i@jingbei.li>
# Contributer: Jose Riha <jose1711 gmail com>

pkgname=python-torchaudio-rocm
_pkgname=audio
pkgver=2.8.0
_sox_ver=14.4.2
pkgrel=1
pkgdesc="Data manipulation and transformation for audio signal processing, powered by PyTorch (with ROCM support)"
arch=('x86_64')
url="https://github.com/pytorch/audio"
license=('BSD')
depends=(
	'python'
	'python-pytorch-rocm'
	'bzip2'
	'xz'
	'opencore-amr'
	'lame'
	'libogg'
	'libFLAC.so'
	'libvorbis'
	'opus'
	'opusfile'
	'zlib'
)
optdepends=('python-kaldi-io')
makedepends=(
	'cmake'
	'ninja'
	'python-setuptools'
	'boost'
	'rocm-toolchain'
)
conflicts=('python-torchaudio-git' 'python-torchaudio')
provides=('python-torchaudio' "python-torchaudio=${pkgver}")
source=(
	"${url}/archive/refs/tags/v${pkgver}.tar.gz"
	"https://downloads.sourceforge.net/project/sox/sox/$_sox_ver/sox-$_sox_ver.tar.bz2"
	policy_min_3.5.patch
)
sha256sums=('8809e4b0fa1635a89d5b05fe8e6e1db79fc0cc2052474ef6e76e349755827c12'
            '81a6956d4330e75b5827316e44ae381e6f1e8928003c6aa45896da9041ea149c'
            'af89ba1d9a7324918797f56ee5a4f542907ed697c3cf7474c46946beafc94ed9')

prepare() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	patch -N -p 1 -i "${srcdir}"/policy_min_3.5.patch
}

build() {
	cd "$srcdir/${_pkgname}-${pkgver}"

	# populate build architecture list similar to pkg arch:python-pytorch
	# 2.8.0-5: gfx950 lacks support for 128 bit atomics
	_PYTORCH_ROCM_ARCH="$(rocm-supported-gfx -e gfx950)"
	if test -n "$GPU_TARGETS"; then _PYTORCH_ROCM_ARCH="$GPU_TARGETS"; fi
	if test -n "$AMDGPU_TARGETS"; then _PYTORCH_ROCM_ARCH="$AMDGPU_TARGETS"; fi
	if test -n "$PYTORCH_ROCM_ARCH"; then _PYTORCH_ROCM_ARCH="$PYTORCH_ROCM_ARCH"; fi
	export PYTORCH_ROCM_ARCH="${_PYTORCH_ROCM_ARCH}"
	echo "building for PYTORCH_ROCM_ARCH=$PYTORCH_ROCM_ARCH"

	# if ROCM_HOME is not set, hardcode ROCM_HOME, ROCM_PATH, HIP_ROOT_DIR to /opt/rocm
	export ROCM_HOME="${ROCM_HOME:-/opt/rocm}"
	export ROCM_PATH="$ROCM_HOME"
	export HIP_ROOT_DIR="$ROCM_HOME"
	BUILD_SOX=1 USE_ROCM=1 python setup.py build
}

package() {
	cd "$srcdir/${_pkgname}-${pkgver}"
	BUILD_SOX=1 USE_ROCM=1 python setup.py install --root="$pkgdir"/ --optimize=1
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
