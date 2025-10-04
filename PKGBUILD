# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=python-nihtest-git
pkgver=1.9.1.r5.ged3aaee
pkgrel=2
pkgdesc='A testing tool for command line utilities (git version)'
arch=('any')
url='https://github.com/nih-at/nihtest/'
license=('BSD-3-Clause')
depends=(
    'python'
    'python-dateutil')
makedepends=(
    'git'
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel')
provides=('python-nihtest')
conflicts=('python-nihtest')
source=('git+https://github.com/nih-at/nihtest.git')
sha256sums=('SKIP')

pkgver() {
    git -C nihtest describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cd nihtest
    python -m build --wheel --no-isolation
}

package() {
    python -m installer --destdir="$pkgdir" nihtest/dist/*.whl
    install -D -m644 nihtest/manpages/nihtest.man "${pkgdir}/usr/share/man/man1/nihtest.1"
    install -D -m644 nihtest/manpages/nihtest.conf.man "${pkgdir}/usr/share/man/man5/nihtest.conf.5"
    install -D -m644 nihtest/manpages/nihtest-case.man "${pkgdir}/usr/share/man/man5/nihtest-case.5"
    
    local _sitepkgs
    _sitepkgs="$(python -c 'import site; print(site.getsitepackages()[0])')"
    
    local _dir
    local _distinfo
    while read -r -d '' _dir
    do
        if grep -q '.*\.dist-info$' <<< "$_dir"
        then
            _distinfo="$_dir"
            break
        fi
    done < <(find "${pkgdir}${_sitepkgs}" -maxdepth 1 -type d -print0)
    
    install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -sr "${_distinfo}/licenses/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
