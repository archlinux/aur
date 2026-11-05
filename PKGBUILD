# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>
pkgname=pipdeptree
pkgver=4.2.14
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
sha256sums=('a324eb8bc7f914b72b4bb92ce1916bd65535173f24999efc553784d32cecd292')

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
