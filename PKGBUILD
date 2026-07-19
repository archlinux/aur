pkgname=piper-tts
_pkgname=piper1-gpl
pkgver=1.5.0
pkgrel=1
pkgdesc="Fast and local neural text-to-speech engine"
arch=('x86_64')
url="https://github.com/OHF-Voice/piper1-gpl"
license=('GPL-3.0-or-later')
provides=('piper-tts')
conflicts=('piper-tts' 'piper')
depends=(glibc python-numpy python-onnxruntime python-pathvalidate)
optdepends=(
	'python-flask: http server'
	'python-onnx: patch voice with alignment'
	'python-pytorch: train'
)
makedepends=(git python-setuptools python-build python-installer python-wheel python-scikit-build cmake ninja)
source=("git+https://github.com/OHF-Voice/piper1-gpl.git#tag=v$pkgver")
sha256sums=('76bd746a236f27c56a6885d9d763c2db6fe12e530c7dfd30d9b2e061e2c1f988')

prepare() {
	cd ${_pkgname}
	sed -i 's/"cmake", "ninja"//' pyproject.toml
}

build() {
  cd ${_pkgname}
  python -m build --wheel --no-isolation
}

package() {
  cd ${_pkgname}
  python -m installer --destdir="$pkgdir" dist/*.whl

  # avoid conflict with GTK application 'piper'
  mv "$pkgdir"/usr/bin/piper "$pkgdir"/usr/bin/piper-tts

  rm "$pkgdir"/usr/COPYING
}

