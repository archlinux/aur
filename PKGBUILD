# Maintainer: piernov <piernov@piernov.org>
# Contributor: Jingbei Li <i@jingbei.li>
# Contributor: Lubosz Sarnecki <lubosz@gmail.com>
# Contributer: Jose Riha <jose1711 gmail com>

pkgname=python-torchaudio-cuda12.9
_pkgname=audio
pkgver=2.11.0
pkgrel=1
pkgdesc="Data manipulation and transformation for audio signal processing, powered by PyTorch (Maxwell/Pascal/Volta support)"
arch=('x86_64' 'i686')
url="https://github.com/pytorch/audio"
license=('BSD-2-Clause')
depends=('python' 'python-pytorch-cuda12.9' 'bzip2' 'xz' 'opencore-amr' 'lame' 'libogg' 'libvorbis' 'opus' 'opusfile' 'zlib')
optdepends=('cuda-12.9')
makedepends=('git' 'python-setuptools' 'cmake' 'ninja' 'boost')
provides+=('python-torchaudio')
conflicts=('python-torchaudio' 'python-torchaudio-git')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('599ec24e7e1eef476ef21f0178e33da00e2434f930ba42e9cc20bf4002220486')

build() {
	# Use GCC 14 for CUDA 12.9
	export CC=gcc-14
	export CXX=g++-14

	cd "$srcdir/${_pkgname}-${pkgver}"

	export CUDACXX=/opt/cuda/bin/nvcc
	export CUDAHOSTCXX=$CXX
	# Follow architectures used by python-pytorch-cuda12.9
	# https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=python-pytorch-cuda12.9
	export TORCH_CUDA_ARCH_LIST="5.2 5.3 6.0 6.1 6.2 7.0 7.2"

	CUDA_HOME=/opt/cuda/ python setup.py build
}

package() {
	cd "$srcdir/${_pkgname}-${pkgver}"
	python setup.py install --root="$pkgdir"/ --optimize=1
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
