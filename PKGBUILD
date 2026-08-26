# Maintainer: Magi3r <magier dot mit dot f3erball at gmail dot com>
# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=primp
pkgname=python-$_name
pkgver=2.0.0
pkgrel=1
pkgdesc='HTTP client that can impersonate web browsers.'
arch=('x86_64' 'aarch64')
url='https://github.com/deedy5/primp'
license=('MIT')
depends=('python' 'glibc' 'gcc-libs')
makedepends=('python-maturin' 'python-build' 'python-installer' 'python-wheel' 'mold')
checkdepends=('python-certifi' 'python-pytest' 'python-pytest-asyncio')
options=(!strip lto)
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('56bdf8623836b6e2a720892a885ca5db88064b0578d9c32f34c0c885543952fb')

build(){
  cd "$srcdir"/$_name-$pkgver/crates/$_name-python
  export RUSTFLAGS="$RUSTFLAGS -Clink-arg=-fuse-ld=mold"
  python -m build --wheel --no-isolation
}

check(){
  local pytest_options=(
    -vv
    --disable-warnings
  )
  cd "$srcdir"/$_name-$pkgver/crates/$_name-python
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -P -m pytest "${pytest_options[@]}" tests
}

package(){
  cd "$srcdir"/$_name-$pkgver/crates/$_name-python
  python -m installer --destdir="$pkgdir" dist/*.whl

  # Symlink license file
  cd ../..
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s "$site_packages"/$_name-$pkgver.dist-info/licenses/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
