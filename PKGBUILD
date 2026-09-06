# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=jsonschema-rs
pkgname=python-$_name
pkgver=0.54.0
pkgrel=1
pkgdesc="A high-performance JSON Schema validator for Python."
arch=('any')
url='https://github.com/Stranger6667/jsonschema'
license=('MIT')
depends=('python' 'gcc-libs' 'glibc')
makedepends=('python-maturin' 'python-build' 'python-installer' 'python-wheel' 'mold' 'git')
checkdepends=('python-flask' 'python-hypothesis' 'python-pytest')
options=(!strip lto)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name//-/_}-$pkgver.tar.gz"
        "suite::git+https://github.com/json-schema-org/JSON-Schema-Test-Suite#commit=583d7c6")
sha256sums=('352cfefd1630bf0529617149a560a1acd0cf569bd40f0c004b9c4566f32391ae'
            '7ccebd0988e5f5553be0cf64a2cdad14299abc73c58ee8d536b9d56da440ce1a')

prepare() {
  cp -rf "$srcdir"/suite "$srcdir"/${_name//-/_}-$pkgver/crates/${_name//-rs/}/tests
}
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
