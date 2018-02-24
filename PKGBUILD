# $Id$
# Maintainer: Alexander Görtz <aur@nyloc.de>
# Contributer: Kyle Keen <keenerd@gmail.com>

pkgname=jupyter-notebook-latest
_pkgname=jupyter-notebook
pkgver=5.3.0
pkgrel=1
pkgdesc="The language-agnostic HTML notebook application for Project Jupyter"
arch=('any')
url="https://github.com/jupyter/notebook"
license=('BSD')
depends=('python-setuptools' 'python-jinja' 'python-tornado' 'python-terminado'
         'python-traitlets' 'jupyter-nbformat' 'python-jupyter_core'
         'python-jupyter_client' 'mathjax' 'python-send2trash')
# Also depends on jupyter-nbconvert but that is optional elsewhere.
# Much of their official dependency tree appears inverted and circular?
provides=('jupyter-notebook')
conflicts=('jupyter-notebook')
makedepends=('python-setuptools' 'npm' 'git')
optdepends=('pandoc: notebook export')
source=("$_pkgname-$pkgver.tgz::https://github.com/jupyter/notebook/archive/$pkgver.tar.gz")
sha256sums=('a674f74e612b435a1ec9372f8f583b0cd64d9db531534c3174f06a2a9087ed80')

build() {
  cd "$srcdir/notebook-$pkgver"

  # FS45999 disable bundled mathjax
  sed -i 's/^.*MathJax.*$//' bower.json 
  #sed -i '/Trim mathjax/,/^                static_data.append/d' setupbase.py
  sed -i 's/  mj(/  #mj(/' setupbase.py

  # needs node, downloads a lot of stuff
  python3 setup.py build
}

package() {
  cd "$srcdir/notebook-$pkgver"

  # needs node
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=0
  # FS45999 use system mathjax
  ln -s /usr/share/mathjax \
  "$pkgdir/usr/lib/python3.6/site-packages/notebook/static/components/MathJax"

  install -Dm644 COPYING.md "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}


