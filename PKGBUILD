# Maintainer: kbipinkumar <kbipinkumar@pm.me>

_pkg=kmedoids
pkgname=python-${_pkg}
pkgver=0.5.5
pkgrel=1
pkgdesc="Fast K-Medoids clustering in Python with FasterPAM"
arch=("x86_64")
url="https://github.com/kno10/python-kmedoids"
license=('GPL-3.0-only')
depends=('python' 'python-numpy' 'python-scikit-learn' 'gcc-libs' 'glibc')
makedepends=('maturin' 'cargo' 'cmake' 'python-installer' 'git' 'python-pip' 'python-pytest')
options=('!lto')
_tag=v${pkgver}
source=("${_pkg}::git+https://github.com/kno10/python-kmedoids.git#tag=${_tag}")
sha256sums=('4f82abf5739c439b740d1d5dad3b81ae6b0cf9e25b4c566b415fbbdfbfa4d999')

prepare() {
  cd ${_pkg}
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd ${_pkg}
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  maturin build -o ./wheels --release
}

package() {
  cd ${_pkg}
  python -m installer -d "$pkgdir" ./wheels/*.whl
}
