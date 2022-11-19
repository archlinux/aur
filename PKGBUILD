# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

_name=sphinxcontrib-htmlhelp
pkgname=python38-sphinxcontrib-htmlhelp
pkgver=2.0.0
pkgrel=5
pkgdesc='Sphinx extension which renders HTML help files'
arch=('any')
url=https://github.com/sphinx-doc/sphinxcontrib-htmlhelp
license=('BSD')
makedepends=('python38-build' 'python-installer' 'python38-setuptools'
             'python38-wheel')
checkdepends=('python38-html5lib' 'python38-pytest' 'python38-sphinx')
source=("https://files.python38hosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
        'htmlhelp-read_txt.patch::https://github.com/sphinx-doc/sphinxcontrib-htmlhelp/commit/248ff52b3c3d39c20cdaef3052ac7507a407733a.patch')
sha256sums=('f5f8bb2d0d629f398bf47d0d69c07bc13b65f75a81ad9e2f71a63d4b7a2f6db2'
            '064d99933b5b922181f7a6f89f745d32c7d7ae7f8cd864e9dca76c76b56e106a')
b2sums=('09b0d9bcec57140278c4476fa0bbc40d359fc167d8ea891a1585fbdeafe6eb0b52442dbbc8d1d5b6edb3953b04fc29a71f6f74e58a281ebb0d79e5a30cb02749'
        'a82d788549acacbcd3a5b056fea76c7f1dfe9a0ca3b367c0f456cbe32d394e21a07766e407311dd3b62b49fb7cec94a05fe26780ab2ec615e23bc9c255bba0ce')

prepare() {
  cd $_name-$pkgver
  # https://github.com/sphinx-doc/sphinxcontrib-htmlhelp/pull/16
  patch --forward --strip=1 --input=../htmlhelp-read_txt.patch
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
  ln -s "$site_packages"/sphinxcontrib_htmlhelp-$pkgver.dist-info/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
