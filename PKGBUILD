# Maintainer: gilcu3
# Contributor: gilcu3

_pkgname=pyopen-wakeword
pkgname=python-$_pkgname
pkgdesc="Python library for openWakeWord wake word detection using TensorFlow Lite"
pkgver=1.1.0
pkgrel=1
arch=(x86_64 aarch64)
url="https://github.com/rhasspy/pyopen-wakeword"
license=('Apache-2.0')
depends=(python python-numpy libgcc libstdc++ glibc)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
checkdepends=('python-pytest')

source=($_pkgname-$pkgver.tar.gz::https://github.com/rhasspy/$_pkgname/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('2b933166d2b0fa9434136a31c5a63d26e3627b47380e8316daa289bcddaa6264')

# Upstream ships prebuilt libtensorflowlite_c per platform in lib/
_platform_x86_64=linux_amd64
_platform_aarch64=linux_arm64

prepare() {
  cd $_pkgname-$pkgver
  local _platform=_platform_$CARCH
  rm -rf pyopen_wakeword/lib
  install -Dm755 lib/${!_platform}/libtensorflowlite_c.so -t pyopen_wakeword/lib
}

build() {
  cd $_pkgname-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_pkgname-$pkgver
  python -m pytest tests
}

package() {
  cd $_pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
