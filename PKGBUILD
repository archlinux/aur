# Maintainer: gilcu3
# Contributor: xginn8 <mamcgi@gmail.com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Dan Beste <Dan.Ray.Beste@gmail.com>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>

_pkgname='python-black'
pkgname="${_pkgname}-git"
pkgver=24.4.2.r3.g0c033f3e
pkgrel=1
pkgdesc='Uncompromising Python code formatter'
arch=('any')
url='https://github.com/psf/black'
license=('MIT')
depends=('python' 'python-click' 'python-mypy_extensions' 'python-packaging'
         'python-pathspec' 'python-platformdirs')
makedepends=('python-build' 'python-hatch-fancy-pypi-readme' 'python-hatch-vcs'
             'python-hatchling' 'python-installer')
checkdepends=('ipython' 'python-aiohttp' 'python-parameterized' 'python-pytest'
              'python-typed-ast' 'python-tokenize-rt')
optdepends=('ipython: for Jupyter notebook support'
            'python-tokenize-rt: for Jupyter notebook support'
            'python-aiohttp: for the blackd HTTP server'
            'python-colorama: for colored diffs')
provides=('python-black')
conflicts=('python-black')
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  git -C "${_pkgname}" describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${_pkgname}"
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd "${_pkgname}"
  python -m installer --destdir="$pkgdir" dist/*.whl

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s "$site_packages"/black-$pkgver.dist-info/licenses/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

  # Vim plugin
  install -Dm644 -t "$pkgdir/usr/share/vim/vimfiles/plugin" plugin/black.vim
  install -Dm644 -t "$pkgdir/usr/share/vim/vimfiles/autoload" autoload/black.vim
}

# vim: ts=2 sw=2 et:
