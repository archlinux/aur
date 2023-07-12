# Maintainer: Bazyli Cyran <bazyli@cyran.dev>

pkgname=philipstv-gui
_pypi_pkgname="${pkgname//-/_}"
pkgver=1.1.1
pkgrel=2
pkgdesc='GUI remote for Philips Android-powered TVs.'
url='https://github.com/bcyran/philipstv-gui'
depends=('python' 'philipstv' 'python-ttkbootstrap' 'python-appdirs')
makedepends=('python-build' 'python-installer' 'python-poetry-core' 'python-poetry-dynamic-versioning')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${_pypi_pkgname}/${_pypi_pkgname}-${pkgver}.tar.gz" 'philipstv-gui.desktop')
sha256sums=('2ba2f1143a89df04557c22eae567a7f189788a7e27fabf68e31ced44352daa67'
            '483db659aa68f977f7e0a5ddfb0abe10233779833fb698cb59da94168e707860')

build() {
    cd "${_pypi_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
    install -Dm644 philipstv-gui.desktop -t "${pkgdir}/usr/share/applications"

    cd "${_pypi_pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl

    local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -s "${site_packages}/${pkgname}-${pkgver}.dist-info/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
