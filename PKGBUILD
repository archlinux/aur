pkgname=r2repo
_build_fragment="tag=v0.0.4"
pkgver=0.0.4
pkgrel=1
pkgdesc="take package files from vcs releases and turn them into a repo that pacman can use"
arch=('x86_64')
url='https://github.com/greyltc/releases2repo'
license=('MIT')
depends=(
python
)
makedepends=(
git
python-build
python-installer
python-wheel
python-hatchling
python-hatch-vcs
python-hatch
)
source=(
git+https://github.com/greyltc/releases2repo.git#${_build_fragment}
)
b2sums=('6d0563fcf1440b51f0cd6139fae93a9ec8d92e61b15df419fef071927e8e53c9ac3c4860756362f9ff767294fa9abae89c5cdbe92018b577d3c48d6ee97fcbf2')

pkgver() {
  cd releases2repo
  hatch version
}

build() {
  cd releases2repo
  python -m build --wheel --no-isolation
}

check() {
  python -m venv --without-pip --system-site-packages --clear venv
  source venv/bin/activate
  python -m installer releases2repo/dist/*.whl
  r2repo --version
  deactivate
}

package() {
  cd releases2repo
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
