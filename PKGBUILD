# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Thore Bödecker <foxxx0@archlinux.org>
# Contributor: wangjiezhe <wangjiezhe AT yandex DOT com>

pkgname='python2-cheroot'
_name="${pkgname#python2-}"
pkgdesc='Highly-optimized, pure-python HTTP server (Python 2 package)'
pkgver=8.6.0
pkgrel=1
arch=('any')
url="https://pypi.org/project/${_name}/${pkgver}/"
license=('BSD')
depends=(
  'python2-backports.functools_lru_cache'
  'python2-jaraco'            # needs jaraco.functools
  'python2-more-itertools'
  'python2-selectors2'
  'python2-six'
)
makedepends=(
  'python2-setuptools'
  'tree'
)
_checkdepends_optional=(
  'python2-chardet'
# 'python2-futures'           # needed only for test coverage report
# 'python2-jaraco'            # needs jaraco.text
# 'python2-jaraco.context'    # needed by test_wsgi.py
  'python2-portend'
  'python2-pyopenssl'
  'python2-pytest-forked'
  'python2-pytest-mock'
# 'python2-pytest-rerunfailures'
  'python2-pytest-sugar'
  'python2-pytest-xdist'
  'python2-requests-toolbelt'
  'python2-requests-unixsocket'
  'python2-trustme'
# 'python2-pytest-watch'      # only used in tox environments
# 'python2-watchdog'          # only used in tox environments
)
optdepends+=("${_checkdepends_optional[@]/%/: for check() function during build}")
_tarname="${_name}-${pkgver}"
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_tarname}.tar.gz"
        'disable-broken-tests.patch')
sha256sums=('366adf6e7cac9555486c2d1be6297993022eff6f8c4655c1443268cca3f08e25'
            'b97bb09ced621b5381a0bfa18dd62cdda0e5e4c52fc1bdd1cb8aad2e34884ea1')

# setuptools wont find version from git tag
export SETUPTOOLS_SCM_PRETEND_VERSION="${pkgver}"

_checkinstalled() {
  pacman --deptest $@
}

prepare() {
  cd "${_tarname}"

  echo 'Patching a broken test...'
  patch --verbose -p1 -N -i '../disable-broken-tests.patch'

  echo 'Configuring setup.cfg: scm and git support'
  sed -e '/setuptools_scm_git_archive/d' \
      -e '/setuptools_scm/c\	setuptools' \
      -e '/use_scm_version/d' \
      -i 'setup.cfg'
  sed -e 's/use_scm_version=\(True|False\)//' \
      -i 'setup.py'

  echo 'Configuring pytest.ini: disabling coverage and doctest'
  sed -e '/^[ ]*--cov/d' \
      -e '/^[ ]*--doctest/d' \
      -i 'pytest.ini'
}

build() {
  cd "${_tarname}"
  python2 setup.py build
}

check() {
  ( _checkinstalled "${_checkdepends_optional[@]}" > /dev/null ) \
    || echo "Skipping testing: checkdepends not installed:"; \
    ( _checkinstalled "${_checkdepends_optional[@]}" ) || \
    return 0

  cd "${_tarname}"

  (
    export LC_ALL=C.UTF-8
    export PYTHONDONTWRITEBYTECODE=1
    export PYTHONPATH="$PWD/build/lib"
    pytest2 \
      --cache-clear \
      --deselect='cheroot/test/test_ssl.py::test_tls_client_auth' \
      --ignore='cheroot/test/test_server.py' \
      --ignore='cheroot/test/test_wsgi.py'      # needs python2-jaraco.context
  )
}

package() {
  cd "${_tarname}"
  python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build

  install -Dm 644 'LICENSE.md' -t "${pkgdir}/usr/share/licenses/${pkgname}"

  echo 'Renaming executable file'
  mv -v "${pkgdir}/usr/bin/${_name}"{,2}

  echo 'Removing tests dir from package'
  local site_packages=$(python2 -c "import site; print(site.getsitepackages()[0])")
  rm -rfv "${pkgdir}${site_packages}/${_name}/"{test,testing.py*}
}
