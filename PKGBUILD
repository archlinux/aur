# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Thore Bödecker <foxxx0@archlinux.org>
# Contributor: wangjiezhe <wangjiezhe AT yandex DOT com>

pkgname='python2-cheroot'
_name="${pkgname#python2-}"
pkgdesc='Highly-optimized, pure-python HTTP server (Python 2 package)'
pkgver=8.5.2
pkgrel=4
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
  'python2-setuptools-scm'
  'python2-six'
  'tree'
)
_checkdepends_optional=(
  'python2-colorama'
  'python2-futures'
# 'python2-jaraco'            # needs jaraco.text, jaraco.context
  'python2-portend'
  'python2-pytest'
  'python2-pytest-forked'
  'python2-pytest-mock'
  'python2-pytest-sugar'
  'python2-pytest-watch'
  'python2-pytest-xdist'
  'python2-requests'
  'python2-requests-toolbelt'
  'python2-requests-unixsocket'
  'python2-pyopenssl'
  'python2-trustme'
  'python2-urllib3'
  'python2-watchdog'
)
optdepends+=("${_checkdepends_optional[@]/%/: for check() function during build}")
_tarname="${_name}-${pkgver}"
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_tarname}.tar.gz"
        'disable-broken-tests.patch')
b2sums=('a3b60a9df3f34913cfb8c99fbdc8580ea436710c7979e296c18a6981f54bb959d6a300f4cf9d4e608fe2987f58d5fc6d2b8f57bca800e461d31c77ac61fd6b01'
        '04bf237577cd82c64b2cd193260ca832c417c336df9648e7d9e97d2f3ea9676ac1474d8cbb070bc2031f08f4d0bd60906bdbfed988f2bf9b0c4f3c04cfafacc3')

# setuptools wont find version from git tag
export SETUPTOOLS_SCM_PRETEND_VERSION="${pkgver}"

_checkinstalled() {
  pacman --deptest $@
}

prepare() {
  cd "${_tarname}"
  patch -p1 -N -i "${srcdir}/disable-broken-tests.patch"

  # don't use python-coverage
  sed -i '/^    --cov/d' pytest.ini

  # git-archive support is not needed since we use PyPI tarballs
  sed -i '/setuptools_scm_git_archive/d' setup.cfg
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
  LC_ALL=C.UTF-8 pytest2
}

package() {
  cd "${_tarname}"
  python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build

  install -Dm 644 'LICENSE.md' -t "${pkgdir}/usr/share/licenses/${pkgname}"

  mv "${pkgdir}/usr/bin/${_name}"{,2}
}
