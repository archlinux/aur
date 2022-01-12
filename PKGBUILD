# Maintainer: j605
# Contributor: Phil A. <flying-sheep@web.de>
# Contributor: Dominik Stańczak <stanczakdominik at gmail dot com>

pkgname=python-nbdime
_pkgname="nbdime"
pkgver=3.1.1
pkgrel=1
pkgdesc="Diff and merge of Jupyter Notebooks"
url="https://github.com/jupyter/nbdime"
makedepends=(python-setuptools npm)
depends=(python python-gitpython python-six jupyter-nbformat python-tornado
         python-colorama python-pygments python-requests python-jinja)
license=('BSD')
arch=('any')
source=($_pkgname-$pkgver.tar.gz::"https://github.com/jupyter/nbdime/archive/$pkgver.tar.gz")
sha256sums=('b1ea9019786c258d958b631500d55c9d08cf97a8901519d593800645f5f661b3')

build() {
  cd $_pkgname-$pkgver
  python setup.py build
}

package() {
  cd $_pkgname-$pkgver

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"

  install -d "$pkgdir"/usr/share/jupyter/{labextensions,nbextensions}
  # jupyterlab extension
  ln -sT /usr/lib/$(readlink /usr/bin/python3)/site-packages/nbdime/labextension "$pkgdir/usr/share/jupyter/labextensions/nbdime-jupyterlab"
  # jupyter notebook extension
  ln -sT /usr/lib/$(readlink /usr/bin/python3)/site-packages/nbdime/notebook_ext "$pkgdir/usr/share/jupyter/nbextensions/nbdime"
  install -d "$pkgdir"/etc/jupyter/{jupyter_notebook_config.d,nbconfig/notebook.d}
  # activate jupyter notebook server extension (like `jupyter serverextension enable`)
  cat > "$pkgdir/etc/jupyter/jupyter_notebook_config.d/nbdime.json" << EOF
{
 "NotebookApp": {
   "nbserver_extensions": {
     "nbdime": true
   }
 }
}
EOF
  # activate jupyter notebook client extension (like `jupyter nbextension enable`)
  cat > "$pkgdir/etc/jupyter/nbconfig/notebook.d/nbdime.json" << EOF
{
 "load_extensions": {
   "nbdime/index": true
 }
}
EOF
}
