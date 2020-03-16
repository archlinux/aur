# Maintainer: Brenton Horne <brentonhorne77@gmail.com>

pkgname=jupyterlab-git
pkgver=18311.git.979a1ea
pkgrel=1
pkgdesc="JupyterLab computational environment"
arch=(any)
url="https://github.com/jupyterlab/jupyterlab"
license=(custom)
makedepends=(python-setuptools nodejs python-recommonmark jsx-lexer git)
depends=(jupyterlab_server)
source=("git+https://github.com/jupyterlab/jupyterlab.git"
jupyterlab-git.install
jupyter-lab.desktop)
sha256sums=('SKIP'
            'ad628adfa2aa6997ffc05352b86e75f1fe23f60b5e056cc0bd23f5d6f87ad4e9'
            'd7ed2287b823a78b7fe05194180ad9b4602657d5e32b8ed548418039451c0434')

pkgver() {
    cd $srcdir/jupyterlab
    no=$(git rev-list --count HEAD)
    hash=$(git log | head -n 1 | cut -d ' ' -f 2 | head -c 7)
    printf "${no}.git.${hash}"
}

build() {
  cd $srcdir/jupyterlab
  python setup.py build 
  cd docs
  make html
}

package() {
  cd $srcdir/jupyterlab
  python setup.py install --skip-build --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

  # symlink to fix assets
  install -d "$pkgdir"/usr/share/jupyter
  ln -s `python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())"`/jupyterlab "$pkgdir"/usr/share/jupyter/lab

  install -d "$pkgdir"/usr/share/{pixmaps,doc/${pkgname}}
  install -Dm644 jupyterlab/staging/node_modules/@jupyterlab/ui-components/style/icons/jupyter/jupyter.svg "$pkgdir"/usr/share/pixmaps/jupyter.svg
  install -Dm755 $srcdir/jupyter-lab.desktop "$pkgdir"/usr/share/applications/jupyter-lab.desktop
  cp -r docs/build/html/* ${pkgdir}/usr/share/doc/${pkgname}
}
