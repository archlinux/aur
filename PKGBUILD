# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=python-cynthion
_gitpkgname=cynthion
pkgver=0.0.0
pkgrel=4
pkgdesc='Python package and utilities for the Great Scott Gadgets Cynthion USB Test Instrument'
arch=('any')
url='https://github.com/greatscottgadgets/cynthion'
license=('BSD-3-Clause')
depends=(
  'python'
  'python-amaranth<0.5'  # https://github.com/greatscottgadgets/cynthion/issues/39
  'python-apollo'
  'python-luna-usb'
  'python-luna-soc'
  'python-pygreat'
  'python-pyusb'
  'python-tomli'
  'python-usb-protocol'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-pyproject-patcher'
  'python-setuptools'
  'python-sphinx'
  'python-sphinx_rtd_theme'
  'python-wheel'
)
optdepends=(
  'python-facedancer: to run the included examples'
)

source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
  "github-pr-33.patch::${url}/pull/33.patch"
  'github-pr-103.patch'
)

sha512sums=(
  '6974bafca223dbe66510270ad91932c3e7fee12fbb629d0acde209e2b08e68fc95f514e42bd717e629701e21f251da347500b75e70e9bfe30806e0fa912314d3'
  'SKIP'
  '859497535674bb74d1ed6f4471d406a8355d3791cf6b8a3d79d2a0490c033127b0db1e0784814f4f9ed130ccf7c68e68acadfa31bf44fd30fd33265e958aa060'
)

prepare() {
  cd "${_gitpkgname}-${pkgver}"

  # Remove the following patch once upstream has merged PR #33 and
  # included it in a stable release.
  # See also:
  # https://github.com/greatscottgadgets/cynthion/pull/33
  echo >&2 'Adding documentation'
  mkdir -p ../split
  git mailsplit -o../split ../github-pr-33.patch
  find ../split -type f | sort | xargs git apply

  # Remove the following patch once a stable release of v0.1.0 or
  # newer has been tagged on GitHub.
  # See also:
  # https://github.com/greatscottgadgets/cynthion/pull/103
  echo >&2 'Applying compatibility patch for python-apollo v1.0.4'
  patch -p1 < ../github-pr-103.patch

  echo >&2 'Pinning version number'
  export pkgver
  python << 'EOF'
from pyproject_patcher import patch_in_place
with patch_in_place('cynthion/python/pyproject.toml') as toml:
    toml.set_project_version_from_env('pkgver')
    toml.tools.setuptools_git_versioning.remove()
EOF
}

build() {
  cd "${_gitpkgname}-${pkgver}"

  echo >&2 'Building wheel'
  python -m build --wheel --no-isolation cynthion/python

  echo >&2 'Generating documentation'
  make -C docs singlehtml
}

check() {
  cd "${_gitpkgname}-${pkgver}"
  local _site_packages
  _site_packages="$(python -c 'import site; print(site.getsitepackages()[0])')"
  python -m installer --destdir=tmp_install cynthion/python/dist/*.whl

  echo >&2 'Running unit tests'
  PYTHONPATH="${PWD}/tmp_install/${_site_packages}" \
    python -m unittest discover -v cynthion/python
}

package() {
  cd "${_gitpkgname}-${pkgver}"

  echo >&2 'Packaging the wheel'
  python -I -m installer --destdir="${pkgdir}" cynthion/python/dist/*.whl

  echo >&2 'Packaging the documentation'
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    README.md
  cp -R --preserve=mode -t "${pkgdir}/usr/share/doc/${pkgname}" \
    docs/build/singlehtml/{index.html,_images,_static}

  echo >&2 'Packaging the examples'
  mkdir -p "${pkgdir}/usr/share/${pkgname}"
  cp -R --preserve=mode -t "${pkgdir}/usr/share/${pkgname}" \
    cynthion/python/examples

  echo >&2 'Packaging the license'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    LICENSE.txt
}
