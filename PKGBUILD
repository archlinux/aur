# Maintainer: devome <evinedeng@hotmail.com>
# Contributor:  Liam Timms <timms5000@gmail.com>
# Contributor: mark.blakeney at bullet-systems dot net

_pkgname=looseversion
pkgname="python-${_pkgname}"
pkgver=1.3.0
pkgrel=2
pkgdesc="Version numbering for anarchists and software realists"
arch=('any')
url="https://github.com/effigies/${_pkgname}"
license=('PSF-2.0')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-hatchling')
checkdepends=('python-distutils-extra' 'python-pytest')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('ebde65f3f6bb9531a81016c6fef3eb95a61181adc47b7f949e9c0ea47911669e')

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

check() {
    local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="tmp_install" dist/*.whl
    PYTHONPATH="$PWD/tmp_install$_site_packages:$PYTHONPATH" python tests.py -vv
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 *.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
