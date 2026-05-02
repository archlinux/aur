pkgname=r2repo
_build_fragment="tag=v0.1.4"
pkgver=0.1.4
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
b2sums=('b606a974b7e5f9ba56ec47325411139ead1d728f17761e09695fb833724fb1128c2085b85e5b5912d289a77fb4252a89fd0ef39f1e17f617c954a6c46bd9fb4d')

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
