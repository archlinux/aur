# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

_name=sphinxcontrib-jsmath
pkgname=python38-sphinxcontrib-jsmath
pkgver=1.0.1
pkgrel=12
pkgdesc='Sphinx extension which renders display math in HTML via JavaScript'
arch=('any')
url=https://github.com/sphinx-doc/sphinxcontrib-jsmath
license=('BSD')
makedepends=('python38-build' 'python38-installer' 'python38-setuptools'
             'python38-wheel')
checkdepends=('python38-pytest' 'python38-sphinx')
source=("https://files.python38hosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
        'jsmath-read_text.patch::https://github.com/sphinx-doc/sphinxcontrib-jsmath/commit/3297b27177ab4862d1b2408a2db66235397fe212.patch')
sha256sums=('a9925e4a4587247ed2191a22df5f6970656cb8ca2bd6284309578f2153e0c4b8'
            '697764efeaa1a6ef234d516a4a6b3fde0c77197a89eaae3246daf8b3ad1f12df')
b2sums=('055ff298e11678d7d30975e4bef509ece0128be30ca0c5fd2be1323c2eb4fe92f861826ea5ddfcbd2d3e3a80535b374d2b1a13446c2604f3e448d5a8982b9881'
        '028e21e345de13f86e11bd5e7b5bd80c1add25b50321c983db3c61ebf5de9c776750fc763584abab0485a6e5e470b19dcbdbd1a068be35ddd18e4b4285fe569a')

prepare() {
  cd $_name-$pkgver
  # https://github.com/sphinx-doc/sphinxcontrib-jsmath/pull/10
  patch --forward --strip=1 --input=../jsmath-read_text.patch
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
  ln -s "$site_packages"/sphinxcontrib_jsmath-$pkgver.dist-info/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
