# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=jsonschema-rs
pkgname=python-$_name
pkgver=0.40.2
pkgrel=1
pkgdesc="A high-performance JSON Schema validator for Python."
arch=('any')
url='https://github.com/Stranger6667/jsonschema'
license=('MIT')
depends=('python' 'gcc-libs' 'glibc')
makedepends=('python-maturin' 'python-build' 'python-installer' 'python-wheel' 'mold')
checkdepends=('python-flask' 'python-hypothesis' 'python-pytest')
options=(!strip lto)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('a0445117a23e72927bc717cf99f7b7b33d05eb8341456bed5828ca49f7497aa6')

build() {
  cd "$srcdir"/${_name//-/_}-$pkgver
  export RUSTFLAGS="$RUSTFLAGS -Clink-arg=-fuse-ld=mold"
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --disable-warnings
  )
  cd "$srcdir"/${_name//-/_}-$pkgver
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -P -m pytest "${pytest_options[@]}" crates/jsonschema-py/tests-py
}

package() {
  cd "$srcdir"/${_name//-/_}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
