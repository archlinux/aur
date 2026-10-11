# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>
pkgname=pipdeptree
pkgver=4.2.7
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
  'python-installer'
  'python-ninja'
  'python-wheel'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('27d70c2009c07d57e0a84f9691d7671ac39926769225e593eecef3a925612e49')

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
