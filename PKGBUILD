# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

_name=sphinxcontrib-qthelp
pkgname=python38-sphinxcontrib-qthelp
pkgver=1.0.3
pkgrel=9
pkgdesc='Sphinx extension which outputs QtHelp document'
arch=('any')
url=https://github.com/sphinx-doc/sphinxcontrib-qthelp
license=('BSD')
makedepends=('python38-build' 'python38-installer' 'python38-setuptools'
             'python38-wheel')
checkdepends=('python38-pytest' 'python38-sphinx')
source=("https://files.python38hosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
        'qthelp-read_text.patch::https://github.com/sphinx-doc/sphinxcontrib-qthelp/commit/42ca78b178c640cd024f16bfa291ae5093ce4920.patch')
sha256sums=('4c33767ee058b70dba89a6fc5c1892c0d57a54be67ddd3e7875a18d14cba5a72'
            '8bfb2d888541298270dd6ac8eba0b3b9703fe90ecfa93a8721d0aa31b82197ab')
b2sums=('7a82e8941d49836cf3e64aabe05ba65b34596f7ba0287b4dc7ed2c5940f6944d1853790d1d52637b03d934effbba8fc5094089e2924322cf1b373432c60bce6a'
        'ee9338ed25c058754498d980e2baa08d50f7c59c8b2854c80929cf5e6ce3b4de0f1a18e9372d0abe9bec0f331b1328fa4068cb1c7a44adbac262c00b22123a51')

prepare() {
  cd $_name-$pkgver
  # https://github.com/sphinx-doc/sphinxcontrib-qthelp/pull/14
  patch --forward --strip=1 --input=../qthelp-read_text.patch
}

build() {
  cd $_name-$pkgver
  python3.8 -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd $_name-$pkgver
  pytest
}

package() {
  cd $_name-$pkgver
  python3.8 -m installer --destdir="$pkgdir" dist/*.whl

  # Symlink license file
  local site_packages=$(python3.8 -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s "$site_packages"/sphinxcontrib_qthelp-$pkgver.dist-info/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
