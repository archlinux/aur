# Maintainer: Bazyli Cyran <bazyli@cyran.dev>

pkgname=philipstv
pkgver=1.0.0
pkgrel=1
pkgdesc='CLI for controlling Philips Android-powered TVs'
url='https://github.com/bcyran/philipstv'
depends=('python' 'python-requests' 'python-pydantic' 'python-click' 'python-appdirs')
makedepends=('python-build' 'python-installer' 'python-poetry-core')
checkdepends=('python-pytest' 'python-requests-mock')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('924d655ff5a92c3926161b87a773de84136ab921bd44fd9f2a88ab151158dee6')

build() {
    cd "${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation --skip-dependency-check

    python -m venv --system-site-packages tmp-install
    tmp-install/bin/python -m installer dist/*.whl
    _PHILIPSTV_COMPLETE=bash_source tmp-install/bin/philipstv > philipstv
    _PHILIPSTV_COMPLETE=zsh_source tmp-install/bin/philipstv > _philipstv
    _PHILIPSTV_COMPLETE=fish_source tmp-install/bin/philipstv > philipstv.fish
    rm -rf tmp-install
}

check() {
    cd "${pkgname}-${pkgver}"

    python -m venv --system-site-packages test-env
    test-env/bin/python -m installer dist/*.whl
    test-env/bin/python -m pytest
    rm -rf test-env
}

package() {
    cd "${pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm 644 philipstv -t "${pkgdir}/usr/share/bash-completion/completions"
    install -Dm 644 _philipstv -t "${pkgdir}/usr/share/zsh/site-functions"
    install -Dm 644 philipstv.fish -t "${pkgdir}/usr/share/fish/vendor_completions.d"

    local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -s "${site_packages}/${pkgname}-${pkgver}.dist-info/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
