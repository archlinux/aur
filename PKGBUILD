# Maintainer: Jingbei Li <i@jingbei.li>
# Maintainer: Lubosz Sarnecki <lubosz@gmail.com>
# Contributer: Jose Riha <jose1711 gmail com>

pkgname=python-torchaudio
_pkgname=audio
pkgver=2.11.0
pkgrel=1
pkgdesc="Data manipulation and transformation for audio signal processing, powered by PyTorch"
arch=('x86_64' 'i686')
url="https://github.com/pytorch/audio"
license=('BSD-2-Clause')
depends=('python' 'python-pytorch' 'bzip2' 'xz' 'opencore-amr' 'lame' 'libogg' 'libvorbis' 'opus' 'opusfile' 'zlib')
optdepends=('cuda')
makedepends=('git' 'python-setuptools' 'cmake' 'ninja' 'boost')
conflicts=('python-torchaudio-git')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('599ec24e7e1eef476ef21f0178e33da00e2434f930ba42e9cc20bf4002220486')

build() {
	cd "$srcdir/${_pkgname}-${pkgver}"

	export CUDACXX=/opt/cuda/bin/nvcc
	export CUDAHOSTCXX=$CXX
	# Follow architectures used by pytorch
	# https://github.com/archlinux/svntogit-community/blob/packages/python-pytorch/trunk/PKGBUILD
	export TORCH_CUDA_ARCH_LIST="7.5 8.0 8.6 8.7 8.9 9.0 10.0 10.3 11.0 12.0 12.1"

	CUDA_HOME=/opt/cuda/ python setup.py build
}

package() {
	cd "$srcdir/${_pkgname}-${pkgver}"
	python setup.py install --root="$pkgdir"/ --optimize=1
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
