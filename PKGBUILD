# Maintainer: Bazyli Cyran <bazyli@cyran.dev>

pkgname=philipstv
pkgver=0.4.2
pkgrel=1
pkgdesc='CLI for controlling Philips Android-powered TVs'
url='https://github.com/bcyran/philipstv'
depends=('python' 'python-requests' 'python-pydantic' 'python-click' 'python-appdirs')
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('6c46378dbdbabce37496af5cef0c6076dabf1cd4f1542fe0be2a5725bd33c112')

build() {
    cd "${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation

    python -m venv --system-site-packages tmp-install
    tmp-install/bin/python -m installer dist/*.whl
    _PHILIPSTV_COMPLETE=bash_source tmp-install/bin/philipstv > philipstv
    _PHILIPSTV_COMPLETE=zsh_source tmp-install/bin/philipstv > _philipstv
    _PHILIPSTV_COMPLETE=fish_source tmp-install/bin/philipstv > philipstv.fish
    rm -rf tmp-install
}

package() {
    cd "${pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm 644 philipstv -t "${pkgdir}/usr/share/bash-completion/completions"
    install -Dm 644 _philipstv -t "${pkgdir}/usr/share/zsh/site-functions"
    install -Dm 644 philipstv.fish -t "${pkgdir}/usr/share/fish/vendor_completions.d"

    install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
