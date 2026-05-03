pkgname=r2repo
_build_fragment="tag=v0.1.6"
pkgver=0.1.6
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
b2sums=('a1f8872361a588495b19350b7c652c8dc21f0a822df653b55f8ca599d03a160544fefe9677707c1c0b2ba4b3fabe2c53a5c47a0af1f3fc0335b278f6a9541498')

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
