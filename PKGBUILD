pkgname=r2repo
_build_fragment="tag=v0.1.5"
pkgver=0.1.5
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
b2sums=('6165fd44f105c4346f7ae18eab29cfad14741535e73376dffc1fbbd3974c27282f6855f0f4b3d8c1ed9a33def7dc2394fbaa8b03b2eaf322832f4da4708db3cc')

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
