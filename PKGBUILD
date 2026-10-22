# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=protobuf-py
pkgname=python-$_name
pkgver=0.7.0
_protobuf_ver=36.1
pkgrel=1
pkgdesc='Idiomatic Protocol Buffers for Python.'
arch=('x86_64' 'aarch64')
url='https://github.com/bufbuild/protobuf-py'
license=('Apache-2.0')
depends=('python'
         'python-typing_extensions')
makedepends=('python-uv-build'
             'python-build'
             'python-installer')
checkdepends=('python-hypothesis'
              'python-pytest'
              'python-pytest-benchmark'
              'python-pytest-xdist'
              'python-pydantic')
optdepends=('python-pydantic')
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "https://github.com/googleapis/googleapis/raw/refs/heads/master/google/rpc/status.proto")
source_x86_64=("https://files.pythonhosted.org/packages/py3/p/protoc-runner/protoc_runner-$_protobuf_ver-py3-none-manylinux2014_$CARCH.manylinux_2_17_$CARCH.musllinux_1_1_$CARCH.whl")
source_aarch64=("https://files.pythonhosted.org/packages/py3/p/protoc-runner/protoc_runner-$_protobuf_ver-py3-none-manylinux2014_$CARCH.manylinux_2_17_$CARCH.musllinux_1_1_$CARCH.whl")
noextract=("protoc_runner-$_protobuf_ver-py3-none-manylinux2014_$CARCH.manylinux_2_17_$CARCH.musllinux_1_1_$CARCH.whl")
sha256sums=('62a56ec4397445efef6a23c621559d6ff67eab9a3646b71462e121b6b77ef89c'
            'SKIP')
sha256sums_x86_64=('7dc4894afdc87f213fcc51a974520ac68d6641406811d671ef23caa2ecd88220')
sha256sums_aarch64=('03b0f9bee44c5ce2ac601a88c8b35ea5b25e30d585ce95e67b32d35f14015edf')

prepare() {
  cd "$_name-$pkgver"
  # Use the uv_build version shipped by Arch
  sed -i 's/uv_build>=0.12.1,<0.13/uv_build/' pyproject.toml
  sed -i 's/uv_build>=0.12.1,<0.13/uv_build/' packages/protoc-gen-py/pyproject.toml
  sed -i 's/uv_build>=0.12.1,<0.13/uv_build/'  packages/upstream-protobuf/pyproject.toml
  mkdir -p "$srcdir"/googleapis/google/rpc/
  cp -f "$srcdir"/status.proto "$srcdir"/googleapis/google/rpc/status.proto
}

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
  python -m build --wheel --no-isolation packages/protoc-gen-py
  python -m build --wheel --no-isolation packages/upstream-protobuf
}

check() {
  local pytest_options=(
    -vv
    --disable-warnings
  )
  cd "$_name-$pkgver"
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m installer packages/protoc-gen-py/dist/*.whl
  test-env/bin/python -m installer packages/upstream-protobuf/dist/*.whl
  test-env/bin/python -m installer "$srcdir"/*.whl
  test-env/bin/protoc --plugin=protoc-gen-py=test-env/bin/protoc-gen-py --proto_path="$srcdir"/googleapis --py_out="$(test-env/bin/python -c 'import sysconfig; print(sysconfig.get_path("purelib"))')" --py_opt=init_files=false google/rpc/status.proto
  test-env/bin/python -P -m pytest "${pytest_options[@]}" tests
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
