# Maintainer: Jingbei Li <i@jingbei.li>
# Contributer: Jose Riha <jose1711 gmail com>

pkgname=python-torchaudio
_pkgname=audio
pkgver=2.10.0
pkgrel=1
pkgdesc="Data manipulation and transformation for audio signal processing, powered by PyTorch"
arch=('x86_64' 'i686')
url="https://github.com/pytorch/audio"
license=('BSD-2-Clause')
depends=('python' 'python-pytorch' 'bzip2' 'xz' 'opencore-amr' 'lame' 'libogg' 'libvorbis' 'opus' 'opusfile' 'zlib')
optdepends=('cuda')
makedepends=('git' 'python-setuptools' 'cmake' 'ninja' 'boost')
conflicts=('python-torchaudio-git')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz"
        https://github.com/pytorch/audio/commit/e1232690308a6b5297fcd06e925899a9b64f7280.patch)
sha256sums=('d0d0d9575025eb85150356a0b0de75b553484838006af17a62470b52d59845d1'
            '8e59f46f0ef5392ed5c2e13909854f4cfffbac910206b024a7f7a60fc79a1f0e')
prepare() {
	cd "$srcdir/${_pkgname}-${pkgver}"

	# Fix build with GCC 14.2
	# https://github.com/pytorch/audio/commit/e1232690308a6b5297fcd06e925899a9b64f7280
	patch -p1 < "$srcdir/e1232690308a6b5297fcd06e925899a9b64f7280.patch"
}

build() {
	cd "$srcdir/${_pkgname}-${pkgver}"

	export CUDACXX=/opt/cuda/bin/nvcc
	export CUDAHOSTCXX=$CXX
	# Follow architectures used by pytorch
	# https://github.com/archlinux/svntogit-community/blob/packages/python-pytorch/trunk/PKGBUILD
	export TORCH_CUDA_ARCH_LIST="7.5;8.0;8.6;8.9;9.0;9.0a;12.0"

	CUDA_HOME=/opt/cuda/ python setup.py build
}

package() {
	cd "$srcdir/${_pkgname}-${pkgver}"
	python setup.py install --root="$pkgdir"/ --optimize=1
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
