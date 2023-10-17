# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=confu-git
pkgver=r44.4f3d0e7
pkgrel=2
pkgdesc='Ninja-based configuration system (git version)'
arch=('any')
url='https://github.com/Maratyszcza/confu/'
license=('MIT')
depends=('python' 'python-pygit2' 'python-six' 'python-yaml' 'python-ninja-syntax')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=('python-peachpy')
source=('git+https://github.com/Maratyszcza/confu.git')
sha256sums=('SKIP')

pkgver() {
    printf 'r%s.%s' "$(git -C confu rev-list --count HEAD)" "$(git -C confu rev-parse --short HEAD)"
}

build() {
    cd confu
    python -m build --wheel --no-isolation
}

package_confu-git() {
    python -m installer --destdir="$pkgdir" confu/dist/*.whl
    
    local _pyver
    local _pkgver
    _pyver="$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')"
    _pkgver="$(awk -F'=' "/__version_info__/ { gsub(/,/, \".\"); gsub(/['()[:space:]]+/, \"\"); print \$2; exit }" confu/confu/__init__.py)"
    install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -s "../../../lib/python${_pyver}/site-packages/confu-${_pkgver}.dist-info/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
