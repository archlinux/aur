# Maintainer: Aseem Athale <athaleaseem@gmail.com>

_base=crfsuite-rs
pkgname=python-${_base}-git
pkgver=0.3.1.r9.g9cf20f7
pkgrel=2
pkgdesc="Python bindings for crfsuite with additional Rust crfsuite bindings."
arch=('any')
url="https://github.com/messense/${_base}"
license=('custom:MIT')
depends=('python' 'cargo')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel' 'cmake' 'git' 'python-milksnake')
source=("git+${url}.git")
sha512sums=('SKIP')

pkgver() {
  cd "${_base}"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${_base}"

  git submodule init

  git config submodule.crfsuite/crfsuite.url "$srcdir/crfsuite-sys/crfsuite"

  git -c protocol.file.allow=always submodule update
  git -C "${srcdir}/${_base}" clean -dfx
}

build() {
  cd "${_base}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_base}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
