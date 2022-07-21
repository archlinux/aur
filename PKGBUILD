# Maintainer: Leo Mao <leomaoyw at gmail dot com>
pkgname=python-cupy
_pkgname=cupy
pkgver=10.6.0
_cub_commit=c3cceac115c072fb63df1836ff46d8c60d9eb304
_jitify_commit=4a37de0be4639f222c6565ebd0654cb922b5180e
pkgrel=1
pkgdesc="NumPy-like API accelerated with CUDA"
_github="cupy/cupy"
url="https://cupy.dev"
arch=('x86_64')
license=('MIT')
depends=('cuda' 'cudnn' 'nccl' 'python-numpy' 'python-fastrlock')
makedepends=('python' 'python-setuptools' 'cython')
optdepends=('libcutensor')
source=("https://github.com/cupy/cupy/archive/v$pkgver.tar.gz"
        "https://github.com/NVIDIA/cub/archive/$_cub_commit.tar.gz"
        "https://github.com/NVIDIA/jitify/archive/$_jitify_commit.tar.gz")
md5sums=('63693ad1ca502a8919d72d089e8b216f'
         'ae6435aef98378a8b323b69f6665df33'
         '2ad752c0814c2da9909e2dcac0f50401')

prepare() {
  cd "$srcdir/$_pkgname-$pkgver"
  rmdir cupy/_core/include/cupy/cub
  ln -srfT "$srcdir/cub-$_cub_commit" cupy/_core/include/cupy/cub
  rmdir cupy/_core/include/cupy/jitify
  ln -srfT "$srcdir/jitify-$_jitify_commit" cupy/_core/include/cupy/jitify
  export CC=/opt/cuda/bin/gcc
  export CXX=/opt/cuda/bin/g++
  # We can use c++14 if the cuda version is greater than 11.
  # See https://github.com/cupy/cupy/issues/3346 for more details.
  #cuda_ver=$(pacman -Q cuda | awk '{print $2}')
  #if [[ $(vercmp $cuda_ver 11) -ge 0 ]]; then
    #sed 's|c++11|c++14|g' -i cupy_setup_build.py
  #fi
}

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --skip-build --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
