# Maintainer: kbipinkumar <kbipinkumar@pm.me>

_pkg=kmedoids
pkgname=python-${_pkg}
pkgver=0.5.4
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
sha256sums=('56969de1f87ec7e3dc74f8242e116c0002e8974cee0619dc6b4a72672c05e948')

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
