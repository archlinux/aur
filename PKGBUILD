# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Eli Schwartz <eschwartz@archlinux.org>

_name=cachecontrol
pkgname='python2-cachecontrol'
pkgver=0.12.6
pkgrel=5
pkgdesc="httplib2 caching for requests (legacy Python 2 version)"
arch=('any')
url="https://pypi.org/project/${_name}/${pkgver}/"
license=('Apache')
depends=(
    'python2'
    'python2-msgpack'
    'python2-requests'
)
optdepends=('python2-lockfile: for the FileCache')
makedepends=('python2-setuptools')
_checkdepends_optional=(
    'python2-cherrypy'
    'python2-lockfile'
    'python2-mock'
    'python2-pytest'
)
optdepends+=("${_checkdepends_optional[@]/%/: for check() function during build}")
_tarname="${_name}-${pkgver}"
source=("${_tarname}.tar.gz::https://github.com/ionrock/${_name}/archive/refs/tags/v${pkgver}.tar.gz"
        "0001-Remove-unnecessary-console-script.patch")
sha256sums=('2ec120838f445bff473cd8b8206ddae3650679142976927179743fabb876f3e3'
            'a2c93d4852887152027140bdd54030d5363876b02e5eabee6a018d4e946a87b1')

_checkinstalled() {
  pacman --deptest $1
}

prepare() {
    cd "${_tarname}"
    patch -p1 -i '../0001-Remove-unnecessary-console-script.patch'
}

build() {
    cd "${_tarname}"
    python2 setup.py build
}

check() {
    ( _checkinstalled "${_checkdepends_optional[@]}" > /dev/null ) \
        || echo "Skipping testing: checkdepends not installed: $(_checkinstalled ${_checkdepends_optional[*]})"; \
        return 0

    cd "${_tarname}"
    python2 -m pytest
}

package() {

    cd "${srcdir}"/${_name}-${pkgver}
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
