# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Eli Schwartz <eschwartz@archlinux.org>

pkgname='python2-cachecontrol'
_name="${pkgname#python2-}"
pkgver=0.12.6
pkgrel=7
pkgdesc="httplib2 caching for requests (legacy Python 2 version)"
arch=('any')
url="https://pypi.org/project/${_name}/${pkgver}/"
license=('Apache')
makedepends=('python2-setuptools')
optdepends=('python2-lockfile: for the FileCache')
_depends_that_are_checkdepends=(
    'python2-msgpack'
    'python2-requests'
)
_checkdepends_needed=(
    'python2-cherrypy'
    'python2-lockfile'
    'python2-mock'
    'python2-pytest'
)
optdepends+=("${_checkdepends_needed[@]/%/: needed for check() during build}")
_tarname="${_name}-${pkgver}"
source=("${_tarname}.tar.gz::https://github.com/ionrock/${_name}/archive/refs/tags/v${pkgver}.tar.gz"
        "0001-Remove-unnecessary-console-script.patch")
sha256sums=('2ec120838f445bff473cd8b8206ddae3650679142976927179743fabb876f3e3'
            'a2c93d4852887152027140bdd54030d5363876b02e5eabee6a018d4e946a87b1')

_checkinstalled() {
  pacman --deptest $@
}

prepare() {
    cd "${_tarname}"
    patch --verbose -p1 -i '../0001-Remove-unnecessary-console-script.patch'
}

build() {
    cd "${_tarname}"
    python2 setup.py build
}

check() {
    ( _checkinstalled "${_checkdepends_needed[@]}" "${_depends_that_are_checkdepends[@]}" > /dev/null ) \
        || echo "Skipping testing: checkdepends not installed:"; \
        ( _checkinstalled "${_checkdepends_needed[@]}" "${_depends_that_are_checkdepends[@]}" ) || \
        return 0

    cd "${_tarname}"
    (
      echo '-- Using LC_ALL=C.UTF-8 locale to ensure UTF-8 filesystem encoding is used in Python 2'
      export LC_ALL=C.UTF-8
      export PYTHONDONTWRITEBYTECODE=1
      export PYTHONPATH="${PWD}/build/lib:${PYTHONPATH}"
      python2 -m pytest -v
    )
}

package() {
    depends=(
        'python2'
        "${_depends_that_are_checkdepends[@]}"
    )

    cd "${_tarname}"
    python2 setup.py install --root="${pkgdir}" --prefix='/usr' --optimize=1 --skip-build
    install --verbose -Dm 644 'README.rst' -t "${pkgdir}/usr/share/doc/${pkgname}"
}
