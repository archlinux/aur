pkgname=r2repo
_build_fragment="tag=v0.1.9"
pkgver=0.1.9
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
python-{build,installer,wheel}
python-hatchling
python-hatch-vcs
)
source=(
git+https://github.com/greyltc/releases2repo.git#${_build_fragment}
)
b2sums=('6c5ce708c85f88715a1589e8aed5fcd111f576c5863a38937c6cb984a0306cd14cf6726d0a3f89661f43cffa751aa02af41e748c4579e734455f40358e26cf28')

pkgver() {
  cd releases2repo
  hatchling version
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
