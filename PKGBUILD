# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=jsonschema-rs
pkgname=python-$_name
pkgver=0.58.0
pkgrel=1
pkgdesc="A high-performance JSON Schema validator for Python."
arch=('any')
url='https://github.com/Stranger6667/jsonschema'
license=('MIT')
depends=('python'
         'gcc-libs'
         'glibc')
makedepends=('python-maturin'
             'python-build'
             'python-installer'
             'python-wheel'
             'mold'
             'git')
checkdepends=('python-flask'
              'python-hypothesis'
              'python-pytest')
options=(!strip lto)
source=("$_name::git+$url.git#tag=python-v$pkgver"
        "git+https://github.com/json-schema-org/JSON-Schema-Test-Suite#commit=583d7c6")
sha256sums=('ca18cda2aff14ba700f4197371cc9f7310ff3fff0052713de641889bd1d48fef'
            'SKIP')

prepare() {
  cd "$srcdir"/$_name
  git submodule init crates/jsonschema/tests/suite
  git config submodule.testsuite.url "$srcdir"/JSON-Schema-Test-Suite
  git -c protocol.file.allow=always submodule update crates/jsonschema/tests/suite
}
build() {
  cd "$srcdir"/$_name
  export RUSTFLAGS="$RUSTFLAGS -Clink-arg=-fuse-ld=mold"
  python -m build --wheel --no-isolation crates/${_name//-rs/-py}
  python -m build --wheel --no-isolation crates/${_name//-rs/-testsuite-pyo3}
}

check() {
  local pytest_options=(
    -vv
    --disable-warnings
  )
  cd "$srcdir"/$_name
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer crates/${_name//-rs/-py}/dist/*.whl
  test-env/bin/python -m installer crates/${_name//-rs/-testsuite-pyo3}/dist/*.whl
  test-env/bin/python -P -m pytest "${pytest_options[@]}" crates/${_name//-rs/-py}/tests-py
}

package() {
  cd "$srcdir"/$_name
  python -m installer --destdir="$pkgdir" crates/${_name//-rs/-py}/dist/*.whl
}
