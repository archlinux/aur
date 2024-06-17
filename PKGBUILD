# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=python-luna-soc-git
_gitpkgname=luna-soc
pkgver=0.1.0.post0+git.3132c898
pkgrel=3
pkgdesc='Amaranth HDL libary for building USB-capable SoC designs'
arch=('any')
url='https://github.com/greatscottgadgets/luna-soc'
license=('BSD-3-Clause')
depends=(
  'python'
  'python-amaranth<0.5'  # https://github.com/greatscottgadgets/luna-soc/issues/21
  'python-luna-usb'
  'python-pyserial'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-minerva-git'
  'python-pyproject-patcher'
  'python-recommonmark'
  'python-setuptools'
  'python-setuptools-git-versioning'
  'python-sphinx'
  'python-sphinx_rtd_theme'
  'python-sphinxcontrib-apidoc'
  'python-wheel'
)
optdepends=(
  'python-minerva-git: to implement SoC designs using a Minerva RISC-V CPU'
)
provides=("python-luna-soc=${pkgver%.post*}")
conflicts=('python-luna-soc')

source=(
  "${_gitpkgname}::git+https://github.com/greatscottgadgets/luna-soc.git"
)

sha512sums=(
  'SKIP'
)

pkgver() {
  setuptools-git-versioning "${_gitpkgname}"
}

prepare() {
  cd "${_gitpkgname}"

  echo >&2 'Pinning version number'
  export pkgver
  python << 'EOF'
from pyproject_patcher import patch_in_place
with patch_in_place('pyproject.toml') as toml:
    toml.build_system_requires.strip_constraint('setuptools-git-versioning')
    toml.tools.setuptools_git_versioning.template_ignore_dirty_git()
EOF
}

build() {
  cd "${_gitpkgname}"
  echo >&2 'Building wheel'
  python -m build --wheel --no-isolation

  echo >&2 'Generating documentation'
  _site_packages="$(python -c 'import site; print(site.getsitepackages()[0])')"
  python -m installer --destdir=tmp_install dist/*.whl
  PYTHONPATH="${PWD}/tmp_install/${_site_packages}" \
    make -C docs man singlehtml
}

package() {
  cd "${_gitpkgname}"

  echo >&2 'Packaging the wheel'
  python -I -m installer --destdir="${pkgdir}" dist/*.whl

  echo >&2 'Packaging the documentation'
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    README.md
  cp -R --preserve=mode -t "${pkgdir}/usr/share/doc/${pkgname}" \
    docs/build/singlehtml/{index.html,_images,_static}
  install -D -m 644 -t "${pkgdir}/usr/share/man/man1" \
    docs/build/man/*.1

  echo >&2 'Packaging applets and examples'
  mkdir -p "${pkgdir}/usr/share/${pkgname}"
  cp -R --preserve=mode -t "${pkgdir}/usr/share/${pkgname}" \
    applets examples

  echo >&2 'Packaging the license'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    LICENSE.txt
}
