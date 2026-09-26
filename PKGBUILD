# Maintainer: Blair Bonnett <blair.bonnett@gmail.com>
# Contributor: Anthony Wang <a_at-exozy_dot-me>

pkgname="python-simpervisor"
pkgver='1.0.0'
pkgrel=3
pkgdesc="Simple async process supervisor"
url="https://github.com/jupyterhub/simpervisor"
license=('BSD-3-Clause')
arch=('any')

depends=(
  python
)
makedepends=(
  python-build
  python-hatch-jupyter-builder
  python-installer
)
checkdepends=(
  python-aiohttp
  python-psutil
  python-pytest
  python-pytest-asyncio
)

_pyname='simpervisor'
source=(
  "https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz"
  'github_pr50_testfix.patch::https://patch-diff.githubusercontent.com/raw/jupyterhub/simpervisor/pull/50.patch'
  'child_scripts_event_loop.patch'
)
sha256sums=(
  '7eb87ca86d5e276976f5bb0290975a05d452c6a7b7f58062daea7d8369c823c1'
  'd583e17ed0971163d957ce068f9045365ac793fe6ff1ec028b0273c7cd90299a'
  '364a902b4e4453e87e1c93f59b8accf183d7bb5c37fb36342414138f56d81c9b'
)

prepare() {
  cd "${_pyname}-${pkgver}"
  patch -p1 -i "${srcdir}/github_pr50_testfix.patch"
  patch -p0 -i "${srcdir}/child_scripts_event_loop.patch"
}

build() {
  cd "${_pyname}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${_pyname}-${pkgver}"
  rm -rf test-env
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer "dist/${_pyname}-${pkgver}-"*.whl
  test-env/bin/python -m pytest
}

package() {
  cd "${_pyname}-${pkgver}"
  python -m installer --destdir="$pkgdir" "dist/${_pyname}-${pkgver}-"*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
