# Maintainer: Brenton Horne <brentonhorne77 at gmail dot com>

pkgname=jupyterlab-git
pkgver=3.0.0rc13.r126.gbd2084ca1
pkgrel=1
epoch=1
pkgdesc="JupyterLab computational environment"
arch=(any)
url="https://github.com/jupyterlab/jupyterlab"
license=(custom)
makedepends=(python-setuptools nodejs python-recommonmark jsx-lexer python-sphinx_rtd_theme python-sphinx-copybutton)
depends=(jupyterlab_server)
source=("git+https://github.com/jupyterlab/jupyterlab.git"
jupyter-lab.desktop)
sha256sums=('SKIP'
            'd7ed2287b823a78b7fe05194180ad9b4602657d5e32b8ed548418039451c0434')

pkgver() {
    cd $srcdir/jupyterlab
    git describe --match "v*" --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $srcdir/jupyterlab
  sed -e 's|~=|>=|' -i setup.py
}

build() {
  cd $srcdir/jupyterlab
  python setup.py build 
  cd docs
  make html
}

package() {
  cd $srcdir/jupyterlab
  python setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

  install -d "$pkgdir"/usr/share/{pixmaps,doc/${pkgname}}
  install -Dm644 examples/notebook/jupyter.png "$pkgdir"/usr/share/pixmaps/jupyter.png
  install -Dm755 $srcdir/jupyter-lab.desktop "$pkgdir"/usr/share/applications/jupyter-lab.desktop
  cp -r docs/build/html/* ${pkgdir}/usr/share/doc/${pkgname}
}
