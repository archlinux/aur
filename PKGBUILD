# Maintainer: Kyle Keen <keenerd@gmail.com>
# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: PepeSmith
# Contributor: Aron Asor <aronasorman at gmail.com>
# Contributor: Chris Brannon <chris@the-brannons.com>
# Contributor: Douglas Soares de Andrade <dsa@aur.archlinux.org>

pkgname=python38-ipython
pkgver=8.6.0
pkgrel=1
pkgdesc="An enhanced Interactive Python 3.8 shell."
arch=('any')
url="https://ipython.org"
license=('BSD')
depends=('python38' 'python38-traitlets' 'python38-pexpect' 'sqlite'
         'python38-pickleshare' 'python38-prompt_toolkit'
         'python38-jedi' 'python38-pygments' 'python38-backcall'
         'python38-matplotlib-inline' 'python38-stack-data')
makedepends=('python38-build' 'python38-installer' 'python38-setuptools' 'python38-wheel')
# texlive-bin checkdep excluded due to test_latex_to_png_color failure
checkdepends=('python38-pytest' 'python38-pytest-asyncio' 'python38-testpath'
              'jupyter-nbformat' 'python38-ipykernel' 'python38-numpy' 'python38-trio'
              'python38-matplotlib' 'python38-curio' 'python38-pandas' 'tcsh')
optdepends=('python38-black: to auto format with Black'
            'yapf: to auto format with YAPF')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz"
        "IPython-icon.png::https://www.packal.org/sites/default/files/public/styles/icon_large/public/workflow-files/nkeimipynbworkflow/icon/icon.png")
sha256sums=('7c959e3dedbf7ed81f9b9d8833df252c430610e2a4a6464ec13cd20975ce20a5'
            '3c44a6fa1e3a8afc24754c90469404770b639cb960361988999a4cdd677699d8')
b2sums=('2c2ed361af7f4a3884fe3d20fa92fb65c9eb0f020ca935e6a7edec7d28891b74433db56b55070ae07369f93d69e0f46a23fc470ba1c0b7ebf8d3d0f620464ab5'
        'd445e2bc7a037db8715ea103611720e965987e155c32e445b0ef783e519fca8a0301b16c5763fd9a5d8d169c3b0d7b4db6c0bd0f9772842258b135dcb1d6d5a2')

# confirm that an update does not break sage?

build() {
  cd $pkgname-$pkgver
  python3.8 -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd $pkgname-$pkgver
  python3.8 -m venv --system-site-packages test-env
  test-env/bin/python3.8 -m installer dist/*.whl
  test-env/bin/python3.8 -m pytest
}

package() {
  cd $pkgname-$pkgver
  python3.8 -m installer --destdir="$pkgdir" dist/*.whl

  cd "examples/IPython Kernel"
  # FS#45120
  sed -i 's/gnome-netstatus-idle/ipython/' ipython.desktop
  install -Dm644 -t "$pkgdir/usr/share/applications" ipython.desktop
  # FS#47046
  install -Dm644 "$srcdir/IPython-icon.png" "$pkgdir/usr/share/pixmaps/ipython.png"

  # Symlink license file
  local site_packages=$(python3.8 -m "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s "$site_packages"/$pkgname-$pkgver.dist-info/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}