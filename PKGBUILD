# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Dan McGee <dan@archlinux.org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Sebastien Binet <binet@lblbox>

# shellcheck disable=SC2034
_name=pip
pkgbase="python2-${_name}"
pkgname=("${pkgbase}")
pkgver=20.3.4
pkgrel=1
pkgdesc="The PyPA recommended tool for installing Python packages"
_url="https://github.com/pypa/${_name}"
url="https://${_name}.pypa.io/"
arch=(any)
license=(MIT)
_deps=(
  appdirs
  cachecontrol
  colorama
  contextlib2
  distlib
  distro
  html5lib
  packaging
  pep517
  progress
  requests
  retrying
  resolvelib
  setuptools
  six
  toml
  # add these until
  # https://github.com/pypa/pip/issues/5354#issuecomment-672678167
  # is resolved
  pyopenssl
  wheel)
depends=("${_deps[@]/#/python2-}")
makedepends=("${_deps[@]/#/python2-}"
             'python-sphinx'
             'python-sphinx-inline-tabs')
checkdepends=(
  git
  python-contextlib2
  python-cryptography
  python-pytest-runner
  python-freezegun
  python-pytest
  python-pytest-rerunfailures
  python-pytest-xdist
  python-scripttest
  python-pretend
  python-setuptools
  python-yaml
  python-mock
  python-pip
  python-tomli-w
  python-virtualenv
  python-werkzeug
  python-csv23
  subversion)
  source=("${_name}-${pkgver}.tar.gz::${_url}/archive/${pkgver}.tar.gz")
  sha512sums=('30e9d6d5dfc54681ca07e5701e26cdde202326848f6b37a013fe1fcc38402efa81284e15d7750de97d871e0da995cf5363e5c9676a036d271ff06bb0052cc1ec')
b2sums=('59ee5069f65244024799855a444b35bac57e12e117c47c387b2afbb29bdbe8727e32d0f2dc44ddef03591d43294d4094195ce37f2f74ab72dbe071ce54b6e5f7')

shopt -s extglob
prepare() {
  local _line _suppress_warnings=()
  cd "${_name}-${pkgver}" || exit
  _suppress_warnings+=(
    "from sphinx.util import logging"
    "linklogger = logging.getLogger('sphinx.ext.extlinks')"
    "linklogger.setLevel(40)")
  for _line in "${_suppress_warnings[@]}"; do
    echo "${_line}" >> "docs/html/conf.py"
  done
}

# shellcheck disable=SC2154
build() {
  cd "${_name}-${pkgver}" || exit
  python setup.py build
  python2 setup.py build
  cd docs || exit
  PYTHONPATH="${srcdir}/${_name}-${pkgver}/src/" python pip_sphinxext.py
  PYTHONPATH="${srcdir}/${_name}-${pkgver}/src/" sphinx-build -W -b man -d build/doctrees/man man build/man -c html
  mkdir -p build/man-pip2
  cd "build/man" || exit
  for manfile in *; do
    sed 's/pip/pip2/g;s/PIP/PIP2/g' "${manfile}" > ../"man-${_name}2/${manfile/pip/pip2}"
  done
}

check() {
  local _site_packages
  _site_packages=$(python2 -c "import site; print(site.getsitepackages()[0])")
  echo "${_site_packages}"
  local _deselected=(
    # deselect tests that would require python-pip in checkdepends 
    # (may or may not work due to devendored dependencies when python-pip is updated)
    --deselect tests/unit/test_direct_url_helpers.py::test_from_link_vcs_with_source_dir_obtains_commit_id
    --deselect tests/unit/test_direct_url_helpers.py::test_from_link_vcs_without_source_dir
    --deselect tests/unit/test_wheel_builder.py::test_should_cache_git_sha
  )

  cd "${srcdir}/${_name}-${pkgver}" || exit
  # install to temporary location
  export PYTHONPATH="test_dir${_site_packages}:${PYTHONPATH}"
  pytest -vv -m unit "${_deselected[@]}"
}

# shellcheck disable=SC2154
package() {
  local _site_packages
  _site_packages=$(python2 -c "import site; print(site.getsitepackages()[0])")

  cd "${_name}-${pkgver}" || exit
  python2 setup.py install --prefix=/usr --root="${pkgdir}"

  mv "${pkgdir}/usr/bin/${_name}" "$pkgdir/usr/bin/${_name}2"
  sed -i "s|#!/usr/bin/env python$|#!/usr/bin/env python2|" \
    "${pkgdir}/${_site_packages}/pip/__init__.py"
  python2 -m compileall "${pkgdir}/${_site_packages}/pip/__init__.py"

  install -D -m644 LICENSE.txt \
	  "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE"

  install -Dm644 -t "${pkgdir}/usr/share/man/man1" docs/build/man-${_name}2/*

  PYTHONPATH="${pkgdir}/${_site_packages}" "${pkgdir}/usr/bin/${_name}2" completion --bash \
    | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${_name}2"
  PYTHONPATH="${pkgdir}/${_site_packages}" "${pkgdir}/usr/bin/${_name}2" completion --fish \
    | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${_name}2.fish"
}
