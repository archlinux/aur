# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=ognibuild
pkgver=0.0.41
pkgrel=1
pkgdesc="Detect and invoke build systems"
arch=('x86_64')
url="https://github.com/jelmer/ognibuild"
license=('GPL-2.0-or-later')
depends=(
  'breezy'
  'python-buildlog-consultant'
  'python-requirements-parser'
  'python-ruamel-yaml'
  'python-setuptools'
  'python-toml'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools-rust'
  'python-wheel'
)
optdepends=(
  'python-aiohttp-openmetrics'
  'python-apt'
#  'python-brz-debian'
  'python-debian'
  'python-debmutate'
  'python-lz4'
)
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f38d1e240b5d3b783aec59444e73ddd5880008208f7116f2628053d1ea94b108')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
#  export LIBSSH2_SYS_USE_PKG_CONFIG
  export RUSTUP_TOOLCHAIN=stable
  python -m build --wheel --no-isolation
}

#check() {
#  cd "$pkgname-$pkgver"
#  PYTHONPATH=./py python -m unittest tests.test_suite
#}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
