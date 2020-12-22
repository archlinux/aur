# Maintainer: Henry-Joseph Audéoud <h.audeoud@gmail.com>

pkgname=jupyter-nbextension-hide-code
_name="${pkgname#jupyter-nbextension-}"
_name="${_name//-/_}"
pkgver=0.6.0
pkgrel=1
pkgdesc="Code, prompt and output hiding for Jupyter/IPython notebooks."
arch=(any)
url="https://github.com/kirbs-/hide_code"
license=('MIT')
conflicts=('python-rise')
depends=('python' 'jupyter-notebook' 'python-pdfkit' 'wkhtmltopdf')
makedepends=('python-setuptools')
source=("${_name}.tar.gz::https://github.com/kirbs-/${_name}/archive/v${pkgver}.tar.gz")
sha256sums=('860b68b4484d165d1f8133824ea7152f0c7db2828e61b9d31426433ae38a9e06')

package() {
    cd "$srcdir/hide_code-$pkgver" || return
    python setup.py install --root="$pkgdir/" --optimize=1

    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    (
     local _python3="$(readlink /usr/bin/python3)"
     local _site_packages="$pkgdir/usr/lib/$_python3/site-packages"
     export PYTHONPATH="$_site_packages:$PYTHONPATH"
     export JUPYTER_PATH="$pkgdir/usr/"
     jupyter-nbextension install --py --prefix="$pkgdir/usr/" "${_name}"
#     jupyter-nbextension enable --py --prefix="$pkgdir/usr/" "${_name}"
#     jupyter-serverextension enable --py --prefix="$pkgdir/usr/" "${_name}"
    )
}
