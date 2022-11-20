# Maintainer: Maxim Baz <$pkgname at maximbaz dot com>
# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: James Zhu <jameszhu@berkeley.edu>

pkgname=python38-black
pkgver=22.10.0
pkgrel=1
pkgdesc='Uncompromising Python code formatter'
arch=('any')
url=https://github.com/psf/black
license=('MIT')
depends=('python38' 'python38-click' 'python38-mypy_extensions' 'python38-pathspec'
         'python38-platformdirs' 'python38-tomli')
makedepends=('python38-build' 'python38-hatch-fancy-pypi-readme' 'python38-hatch-vcs'
             'python38-hatchling' 'python38-installer')
checkdepends=('python38-ipython' 'python38-aiohttp' 'python38-parameterized' 'python38-pytest'
              'python38-typed-ast' 'python38-tokenize-rt')
optdepends=('python38-ipython: for Jupyter notebook support'
            'python38-tokenize-rt: for Jupyter notebook support'
            'python38-aiohttp: for the blackd HTTP server'
            'python38-colorama: for colored diffs')
source=("https://files.pythonhosted.org/packages/source/b/black/black-$pkgver.tar.gz")
sha256sums=('f513588da599943e0cde4e32cc9879e825d58720d6557062d1098c5ad80080e1')
b2sums=('3ad40e89792eeae6a3959b5e23c5edc78a062e8453d9b1892fc2447ad4b86de90c6764d8424729b9ed0af7907544739f1a03e575caa658d23b442dd9190e8570')

build() {
  cd "black-$pkgver"
  python3.8 -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd "black-$pkgver"
  python3.8 -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  # https://github.com/psf/black/issues/3251#issuecomment-1236413890
  ulimit -n 2048
  PATH="$PWD/test-env/bin:$PATH" test-env/bin/python -m pytest
}

package() {
  cd "black-$pkgver"
  python3.8 -m installer --destdir="$pkgdir" dist/*.whl

  # Symlink license file
  local site_packages=$(python3.8 -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s "$site_packages"/black-$pkgver.dist-info/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

  # Completions
  install -vd \
    "$pkgdir/usr/share/"{bash-completion/completions,fish/vendor_completions.d,zsh/site-functions}
  _BLACK_COMPLETE=bash_source test-env/bin/black > \
    "$pkgdir/usr/share/bash-completion/completions/black"
  _BLACK_COMPLETE=fish_source test-env/bin/black > \
    "$pkgdir/usr/share/fish/vendor_completions.d/black.fish"
  _BLACK_COMPLETE=zsh_source test-env/bin/black > \
    "$pkgdir/usr/share/zsh/site-functions/_black"
  _BLACKD_COMPLETE=bash_source test-env/bin/blackd > \
    "$pkgdir/usr/share/bash-completion/completions/blackd"
  _BLACKD_COMPLETE=fish_source test-env/bin/blackd > \
    "$pkgdir/usr/share/fish/vendor_completions.d/blackd.fish"
  _BLACKD_COMPLETE=zsh_source test-env/bin/blackd > \
    "$pkgdir/usr/share/zsh/site-functions/_blackd"

  # Vim plugin
  install -Dm644 -t "$pkgdir/usr/share/vim/vimfiles/plugin" plugin/black.vim
  install -Dm644 -t "$pkgdir/usr/share/vim/vimfiles/autoload" autoload/black.vim
}

# vim:set ts=2 sw=2 et:
