# Maintainer: Smoolak <smoolak@gmail.com>
pkgname=python-accelerated-scan
pkgver=0.3.1
pkgrel=1
pkgdesc='Parallel associative scan with PyTorch, Triton and CUDA implementations'
arch=(any)
url='https://github.com/proger/accelerated-scan'
license=(MIT)
depends=('python-pytorch>=2.9.0')
makedepends=(python-build python-hatchling python-installer)
optdepends=('python-triton: Triton scan backend'
            'cuda: compile the CUDA warp backend at runtime'
            'ninja: build the CUDA warp extension'
            'python-setuptools: load the PyTorch CUDA extension builder')
_commit=866fa4cd4eaf01338ee6d77a4f99fcd4b2f656d1
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_commit.tar.gz"
        warp-pytorch-extension-flags.patch)
sha256sums=('2fe7821cc126a61558378df438ed196016bec64762c518d06b2262e0cb818daf'
            '976fbf7ce18ef4ec1c149e3445ad482d84cede89f94d4bca8078667bc718c2a3')

prepare() {
  cd "accelerated-scan-$_commit"
  patch -Np1 -i "$srcdir/warp-pytorch-extension-flags.patch"
  # The example's expected tuple is missing its closing parenthesis.
  sed -i '/^    (tensor(\[\[\[1, 3, 5, 7\]\]\]), tensor(\[\[\[2, 4, 6, 8\]\]\])$/s/$/)/' accelerated_scan/ref.py
}

build() {
  cd "accelerated-scan-$_commit"
  python -m build --wheel --no-isolation
}

check() {
  cd "accelerated-scan-$_commit"
  python -m doctest accelerated_scan/ref.py
}

package() {
  cd "accelerated-scan-$_commit"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
