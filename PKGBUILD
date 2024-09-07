pkgname=python-curl-cffi
_name=curl_cffi
pkgver=0.7.1
pkgrel=1
pkgdesc="Python binding for curl-impersonate via CFFI"
arch=(x86_64)
url="https://github.com/yifeikong/${_name}"
license=(MIT)
depends=(
  glibc
  python
  python-cffi
  python-certifi
  python-gevent
  python-eventlet
  libcurl-impersonate-chrome
)
makedepends=(
  gcc13
  python-build
  python-installer
  python-setuptools
  python-wheel
)
options=(!debug)
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz
        use-system-libs.patch)
b2sums=('5481d2c812583c34ac8eae8d4931281e01de2b2b4c5ac51d23ac3b3548e0b00b36224e53cd3b720c61d52c9bc4cd094c081c0a4729212134bed702168061daae'
        'd53041a301a66407be6d69b6bf53ffadf9d0979c639f1e2218481359ad0e606f28e1ace1a61ad980a424d937c84b60f995d3ce171d418f9dd267657b99bc8a5e')

prepare() {
  patch -d "${_name}-$pkgver" -p1 -i ../use-system-libs.patch
}

build() {
  cd $_name-$pkgver
  #Fix for gcc
  export CC=gcc-13
  export CXX=g++-13
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s "$site_packages"/$_name-$pkgver.dist-info/LICENSE \
     "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
