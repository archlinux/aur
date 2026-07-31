# Maintainer: renagadesol <81797108+dwaycik@users.noreply.github.com>
pkgname=python-epomakercontroller-git
_pkgname=epomakercontroller
pkgver=0.0.9.r0.g9a0f194
pkgrel=1
pkgdesc="Library and CLI for Epomaker keyboards with a screen (RT100, TH80)"
arch=('any')
url="https://github.com/strodgers/epomaker-controller"
license=('MIT')
# Pinned to a commit, not a branch: 0.0.9 carries the native GIF protocol and
# relaxes the hidapi==0.14.0 pin, but has never been released to PyPI.
_commit='9a0f19484427e9756e9cc5dbf1f6f8c5fea44bc2'
# appdirs is declared by upstream's pyproject but imported nowhere in 0.0.9,
# so it is deliberately omitted.
#
# gpustat is NOT optional despite only being used for GPU temperatures:
# utils/sensors.py does a bare `import gpustat` (and `from pynvml import
# NVMLError`) at module scope, so the whole library fails to import without it.
depends=('python' 'python-hidapi' 'python-numpy' 'python-psutil'
         'python-click' 'python-dateutil' 'python-pillow' 'python-opencv'
         'python-gpustat')
makedepends=('git' 'python-build' 'python-installer' 'python-poetry-core')
provides=("python-epomakercontroller=0.0.9")
conflicts=('python-epomakercontroller')
source=("${_pkgname}::git+https://github.com/strodgers/epomaker-controller.git#commit=${_commit}")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "0.0.9.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgname}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  # Upstream declares `license = "MIT"` in pyproject.toml but ships no licence
  # file in the tree, so there is nothing to install here. Inventing one would
  # mean guessing the copyright holder and year.
}
