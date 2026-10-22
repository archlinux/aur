# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=jsonschema-rs
pkgname=python-$_name
pkgver=0.60.0
pkgrel=1
pkgdesc="A high-performance JSON Schema validator for Python."
arch=('x86_64' 'aarch64')
url='https://github.com/Stranger6667/jsonschema'
license=('MIT')
depends=('python'
         'gcc-libs'
         'glibc')
makedepends=('python-maturin'
             'python-build'
             'python-installer'
             'mold'
             'git')
checkdepends=('python-flask'
              'python-hypothesis'
              'python-pytest')
options=(!strip lto)
source=("$_name::git+$url.git#tag=python-v$pkgver"
        "git+https://github.com/json-schema-org/JSON-Schema-Test-Suite#commit=5b0ee16")
sha256sums=('54cbf7e8982d9f81d80b4bf255165bc218028e6f46b51ae0815e32412e945d53'
            '5477d894cb15fc844862d0baf5d0dfbd26b5a5f112087350a6802289b089c3b1')

prepare() {
  cd "$_name"
  git submodule init crates/jsonschema/tests/suite
  git config submodule.testsuite.url "$srcdir"/JSON-Schema-Test-Suite
  git -c protocol.file.allow=always submodule update crates/jsonschema/tests/suite
}
build() {
  cd "$_name"
  export RUSTFLAGS="$RUSTFLAGS -Clink-arg=-fuse-ld=mold"
  export AWS_LC_SYS_NO_JITTER_ENTROPY=1
  python -m build --wheel --no-isolation crates/${_name//-rs/-py}
  python -m build --wheel --no-isolation crates/${_name//-rs/-testsuite-pyo3}
}

check() {
  local pytest_options=(
    -vv
    --disable-warnings
  )
  cd "$_name"
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer crates/${_name//-rs/-py}/dist/*.whl
  test-env/bin/python -m installer crates/${_name//-rs/-testsuite-pyo3}/dist/*.whl
  test-env/bin/python -P -m pytest "${pytest_options[@]}" crates/${_name//-rs/-py}/tests-py
}

package() {
  cd "$_name"
  python -m installer --destdir="$pkgdir" crates/${_name//-rs/-py}/dist/*.whl
}
