# Maintainer: Henry-Joseph Audéoud <h.audeoud@gmail.com>

pkgname=jupyter-nbextension-hide-code
_name=hide_code
pkgver=0.5.6
pkgrel=1
pkgdesc="Code, prompt and output hiding for Jupyter/IPython notebooks."
arch=(any)
url="https://github.com/kirbs-/hide_code"
license=('MIT')
conflicts=('python-rise')
depends=('python' 'jupyter-notebook' 'python-pdfkit')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('ed5003661b8e60497d2dfc2da624b0c8e2277a2c1520788bb3cb545b9c3b0914')

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
