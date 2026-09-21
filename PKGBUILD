# Maintainer: marmis <tiagodepalves@gmail.com>
# Contributor: "marmis" Tiago de Paula <tiagodepalves@gmail.com>

pkgname=python-bencode2
pkgdesc='A fast and correct bencode serialize/deserialize library in python'
pkgver=0.3.35
_ver_fmt=12.2.0
_ver_sv=0.10.2
pkgrel=1
url='https://github.com/trim21/bencode-py'
arch=(aarch64 armv7h i486 i686 pentium4 riscv64 x86_64)
license=('MIT')
checkdepends=('python-pytest')
makedepends=(
  'meson'
  'ninja'
  'python-build'
  'python-installer'
  'python-pdm-backend'
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
b2sums=('575dd0f29087b510223c3afdc405d8c514690af1f25975bd22eff46d12db79c9e765e737a32232d1039937e64040cb8d21c85986044c02f7aac14eeedb0b1f87'
        '5dfb2eb6087a7442477a64c6d0ec5de8b27ca5768cb3330b51980085547553eed9a736ac2983d7d249f41655a8183aa45ead3f9289cd157f76f6fbe33c7920de'
        '4c3191079f8d2040c91a7c70235a4c256ae450d1973c5ec835dbf561043d79d155a655c798af1cfce734dcf5571bca31f813db9cdff4643b256e73c80dbf696e')

prepare() {
  cd "bencode-py-${pkgver}"

  rmdir vendor/fmt vendor/small_vector
  ln -v -sr "../fmt-${_ver_fmt}" -T vendor/fmt
  ln -v -sr "../small_vector-${_ver_sv}" -T vendor/small_vector
  meson subprojects download

  # unpin build dependencies
  sed -i -E \
    -e 's/\b(pdm-backend)==/\1>=/' \
    -e 's/\b(meson)\[ninja\]==/\1>=/' \
    pyproject.toml

  sed -i "/'-Wl,-s'/d" subprojects/nanobind-*/meson.build
  sed -i -E \
    -e 's/(-Dbuildtype)=release/\1=plain/' \
    -e 's/(-Db_ndebug)=if-release/\1=true/' \
    -e 's/-Db_vscrt=md/--wrap-mode=nodownload/' \
    pdm_build.py
}

build() {
  cd "bencode-py-${pkgver}"

  python -m build --wheel --no-isolation \
    --config-setting='--py-limited-api=abi3'
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
