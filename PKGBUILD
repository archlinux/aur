# Maintainer: marmis <tiagodepalves@gmail.com>
# Contributor: "marmis" Tiago de Paula <tiagodepalves@gmail.com>

pkgname=python-bencode2
pkgdesc='A fast and correct bencode serialize/deserialize library in python'
pkgver=0.3.33
pkgrel=1
url='https://github.com/trim21/bencode-py'
arch=(aarch64 armv7h i486 i686 pentium4 riscv64 x86_64)
license=('MIT')
checkdepends=('python-pytest')
makedepends=(
  'git'
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
source=("git+https://github.com/trim21/bencode-py.git#tag=v${pkgver}"
        "git+https://github.com/gharveymn/small_vector.git#tag=v0.10.2"
        "git+https://github.com/fmtlib/fmt.git#tag=12.2.0")
b2sums=('78422099c620cfdf9259fb6e86d78e93aeeb98ce4c6feb802ea641120c8baaf734c55cb5577a1705ff80baa6807056ee0a46721215c4767958e7530f619caebc'
        'f5c8a7830b0cda273aae4cb8bb8e76b099d1521caf36f9365337ec5b7cfac027c73aaab956770278cc4620a7220d22226083b156958973a383ce8aa9da2ba7be'
        'e095e1d8e2d95a08f8d6430360e76e9b24a4e213ee83adeeeabf93de09dde325c8e2c4bbbab0907d79f77a21ef5db55ca25f836173f3cd94aecb0cc214fc596d')

prepare() {
  cd bencode-py

  git submodule init
  git config submodule.vendor/small_vector.url ../small_vector
  git config submodule.vendor/fmt.url ../fmt
  git -c protocol.file.allow=always submodule update

  # unpin build dependencies
  sed -i -E '
    s/flit-core==/flit-core>=/
    s/meson-python==/meson-python>=/
    s/meson\[ninja\]==/meson>=/
  ' pyproject.toml
}

build() {
  cd bencode-py

  python -m build --wheel --no-isolation \
    --config-setting setup-args='-Dbuildtype=debugoptimized'
}

check() {
  cd bencode-py

  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl

  test-env/bin/python -m pytest tests/
}

package() {
  cd bencode-py

  python -m installer --destdir "${pkgdir}" dist/*.whl

  install -vD -t "${pkgdir}/usr/share/licenses/${pkgname}/" -m644 LICENSE*
}
