# Maintainer: marmis <tiagodepalves@gmail.com>
# Contributor: "marmis" Tiago de Paula <tiagodepalves@gmail.com>

pkgname=python-bencode2
pkgdesc='A fast and correct bencode serialize/deserialize library in python'
pkgver=0.3.33
_ver_fmt=12.2.0
_ver_sv=0.10.2
pkgrel=2
url='https://github.com/trim21/bencode-py'
arch=(aarch64 armv7h i486 i686 pentium4 riscv64 x86_64)
license=('MIT')
checkdepends=('python-pytest')
makedepends=(
  'meson'
  'meson-python'
  'ninja'
  'python-build'
  'python-flit-core'
  'python-installer'
)
depends=(
  'glibc'
  'libgcc'
  'libstdc++'
  'python'
  'python-typing_extensions'
)
source=("${pkgname}-v${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "fmtlib-fmt-${_ver_fmt}.tar.gz::https://github.com/fmtlib/fmt/archive/refs/tags/${_ver_fmt}.tar.gz"
        "small_vector-v${_ver_sv}.tar.gz::https://github.com/gharveymn/small_vector/archive/refs/tags/v${_ver_sv}.tar.gz")
b2sums=('1b65f355cd41b0b3ce3c871e09f7ef6ed13dcbebccfc390e2610dc6519fde8f26d77d34e0b750a0aefaf1657d2cc7c5eefa0a183e4436cfe2dfaa46ead4e4d27'
        '5dfb2eb6087a7442477a64c6d0ec5de8b27ca5768cb3330b51980085547553eed9a736ac2983d7d249f41655a8183aa45ead3f9289cd157f76f6fbe33c7920de'
        '4c3191079f8d2040c91a7c70235a4c256ae450d1973c5ec835dbf561043d79d155a655c798af1cfce734dcf5571bca31f813db9cdff4643b256e73c80dbf696e')

prepare() {
  cd "bencode-py-${pkgver}"

  rmdir vendor/fmt vendor/small_vector
  ln -v -sr "../fmt-${_ver_fmt}" -T vendor/fmt
  ln -v -sr "../small_vector-${_ver_sv}" -T vendor/small_vector

  # unpin build dependencies
  sed -i -E '
    s/\bflit-core==/flit-core>=/
    s/\bmeson-python==/meson-python>=/
    s/\bmeson\[ninja\]==/meson>=/
  ' pyproject.toml
}

build() {
  cd "bencode-py-${pkgver}"

  python -m build --wheel --no-isolation \
    --config-setting setup-args='-Dbuildtype=debugoptimized'
}

check() {
  cd "bencode-py-${pkgver}"

  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl

  test-env/bin/python -P -m pytest tests/
}

package() {
  cd "bencode-py-${pkgver}"

  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -vD -t "${pkgdir}/usr/share/licenses/${pkgname}/" -m644 LICENSE*
}
