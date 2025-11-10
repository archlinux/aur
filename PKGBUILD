# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=python-patch-ng-git
pkgver=1.19.0.r2.g1931f8c
pkgrel=1
pkgdesc='Python library to parse and apply unified diffs (new generation; git version)'
arch=('any')
url='https://github.com/conan-io/python-patch-ng/'
license=('MIT')
depends=(
    'python')
makedepends=(
    'git'
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel')
source=('git+https://github.com/conan-io/python-patch-ng.git')
sha256sums=('SKIP')

pkgver() {
    local _version
    _version="$(git -C python-patch-ng tag --list --sort='-v:refname' | grep -E '^[0-9]+\.[0-9]+\.[0-9]+' | head -n1)"
    printf '%s.r%s.g%s' "$_version" \
                        "$(git -C python-patch-ng rev-list --count "${_version}..HEAD")" \
                        "$(git -C python-patch-ng rev-parse --short HEAD)"
}

build() {
    cd python-patch-ng
    python -m build --wheel --no-isolation
}

check() {
    cd python-patch-ng/tests
    ./run_tests.py
}

package() {
    python -m installer --destdir="$pkgdir" python-patch-ng/dist/*.whl
    
    local _sitepkgs
    local _distinfo
    _sitepkgs="$(python -c 'import site; print(site.getsitepackages()[0])')"
    _distinfo="$(find "${pkgdir}${_sitepkgs}" -maxdepth 1 -type d -name '*.dist-info')"
    
    install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -sr "${_distinfo}/licenses/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
