# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>
pkgname=pipdeptree
pkgver=4.2.13
pkgrel=1
pkgdesc="Command line utility to show dependency tree of Python packages"
arch=('x86_64' 'aarch64')
url="https://github.com/tox-dev/pipdeptree"
license=('MIT')
depends=(
  'glibc'
  'libgcc'
  'python'
  'python-nab'
  'python-nab-index'
  'python-nab-project'
)
makedepends=(
  'cargo'
  'meson-python'
  'python-build'
  'python-hatch-fancy-pypi-readme'
  'python-installer'
  'python-ninja'
  'python-patchelf'
  'python-setuptools'
  'python-setuptools-scm'
  'python-scikit-build-core'
  'python-wheel'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('3108ae3e6727ab8b156f6297cfc2c1bd3c2662e5386c0bfa332a3ae0adb241f6')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target host-tuple
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
