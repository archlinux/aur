# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=python-peachpy-git
pkgver=r379.349e8f8
pkgrel=1
pkgdesc='Python framework for writing high-performance assembly kernels (git version)'
arch=('any')
url='https://github.com/Maratyszcza/PeachPy/'
license=('BSD')
depends=('python' 'python-six')
makedepends=('git' 'python-build' 'python-installer' 'python-opcodes' 'python-setuptools' 'python-wheel')
provides=('python-peachpy')
conflicts=('python-peachpy')
source=('git+https://github.com/Maratyszcza/PeachPy.git')
sha256sums=('SKIP')

pkgver() {
    printf 'r%s.%s' "$(git -C PeachPy rev-list --count HEAD)" "$(git -C PeachPy rev-parse --short HEAD)"
}

build() {
    cd PeachPy
    python -m build --wheel --no-isolation
}

package_python-peachpy-git() {
    python -m installer --destdir="$pkgdir" "PeachPy/dist"/*.whl

    local _pyver
    local _pkgver
    _pyver="$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')"
    _pkgver="$(awk -F'=' "/__version_info__/ { gsub(/,/, \".\"); gsub(/['()[:space:]]+/, \"\"); print \$2; exit }" PeachPy/peachpy/__init__.py)"
    install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -s "../../../lib/python${_pyver}/site-packages/PeachPy-${_pkgver}.dist-info/LICENSE.rst" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
