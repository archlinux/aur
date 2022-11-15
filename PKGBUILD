# Maintainer: Henry-Joseph Audéoud <h.audeoud@gmail.com>

pkgname=jupyter-nbextension-hide-code
_name="${pkgname#jupyter-nbextension-}"
_name="${_name//-/_}"
pkgver=0.7.0
pkgrel=1
pkgdesc="Code, prompt and output hiding for Jupyter/IPython notebooks."
arch=(any)
url="https://github.com/kirbs-/hide_code"
license=('MIT')
conflicts=('python-rise')
depends=('python>=3.7' 'jupyter-notebook>=6.0' 'jupyter-nbconvert>=6' python-pdfkit wkhtmltopdf)
makedepends=(python-build python-installer python-poetry)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kirbs-/${_name}/archive/v${pkgver}.tar.gz")
sha256sums=('46e7606ae01fc677a1b402520838be82539b368ea9257e0eefe4bd6855b83530')  # Official

build() {
    cd "${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Jupyter specific
    (
     local site_packages="${pkgdir}$(python -c "import site; print(site.getsitepackages()[0])")"
     export PYTHONPATH="${site_packages}:${PYTHONPATH}"
     export JUPYTER_PATH="${pkgdir}/usr/"
     jupyter-nbextension install --py --prefix="${pkgdir}/usr/" "${_name}"
#     jupyter-nbextension enable --py --prefix="${pkgdir}/usr/" "${_name}"
#     jupyter-serverextension enable --py --prefix="${pkgdir}/usr/" "${_name}"
    )
}
