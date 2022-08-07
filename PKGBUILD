# Maintainer: Bazyli Cyran <bazyli@cyran.dev>

pkgname=philipstv-gui
pkgver=1.0.0
pkgrel=1
pkgdesc='GUI remote for Philips Android-powered TVs.'
url='https://github.com/bcyran/philipstv-gui'
depends=('python' 'philipstv' 'python-ttkbootstrap')
makedepends=('python-build' 'python-installer' 'python-poetry-core')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz" 'philipstv-gui.desktop')
sha256sums=('7df005329defc311c2b4539ef107f79b6d754a5ee2939f3f428679f846779818'
            '483db659aa68f977f7e0a5ddfb0abe10233779833fb698cb59da94168e707860')

build() {
    cd "${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
    install -Dm644 philipstv-gui.desktop -t "${pkgdir}/usr/share/applications"

    cd "${pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl

    local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -s "${site_packages}/${pkgname}-${pkgver}.dist-info/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
