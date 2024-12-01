# Maintainer: Kishore G <kishore96 at gmail dot com>
# Contributor: Stuart Mumford <stuart@cadair.com>

pkgname=python-drms
_name=drms
pkgver=0.8.0
pkgrel=2
pkgdesc="The drms module provides an easy-to-use interface for accessing HMI, AIA and MDI data with Python."
arch=(any)
url="https://github.com/sunpy/drms"
license=('BSD-2-Clause')
depends=('python-oldest-supported-numpy' 'python-six' 'python-pandas')
makedepends=(python-build python-installer python-wheel python-setuptools-scm)
source=(${_name}-${pkgver}.tar.gz::https://github.com/sunpy/drms/archive/refs/tags/v${pkgver}.tar.gz
    'setuptools_version_string.patch')
sha256sums=('a622369a176a9f76be53fdfb7116529700d8cae493576f70b1d082bb466334e0'
    'SKIP')

prepare() {
    cd $_name-$pkgver
    patch -p1 < ../setuptools_version_string.patch
    }

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    
    #Quick fix; the below file is not copied over by the installer, and importing drms fails if it is absent.
    site_location=$(python -c 'import site; print(site.getsitepackages()[0])')
    install drms/CITATION.rst "$pkgdir/$site_location/drms/"
}

# vim:set ts=2 sw=2 et:
