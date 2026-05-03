pkgname=r2repo
_build_fragment="tag=v0.1.7"
pkgver=0.1.7
pkgrel=1
pkgdesc="take package files from vcs releases and turn them into a repo that pacman can use"
arch=('x86_64')
url='https://github.com/greyltc/releases2repo'
license=('MIT')
depends=(
caddy
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
b2sums=('d8368d2017034a1ecb38a042aa2a7a30c997b88376d8d3bc8b663f0836dcc0bf66eb859d12881d8660ba57b0e9f7ea9f1178362ee5902658be76f469489c5ee6')

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
  install -Dm644 system/r2repo.conf "${pkgdir}/usr/lib/tempfiles.d/r2repo.conf"
}
