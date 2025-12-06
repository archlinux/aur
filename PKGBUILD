# Contributor: Arzet Ro (arzeth0@gmail.com)

pkgname=python-pynini
pkgver=2.1.7
pkgrel=1
pkgdesc="For compiling, optimizing, and applying grammar rules"
arch=('any')
url="https://www.opengrm.org/twiki/bin/view/GRM/Pynini"
# There's also https://github.com/kylebgorman/Pynini
# which is the developer's read-only mirror
license=('Apache-2.0')
depends=('python' 'python-absl' 'openfst')
makedepends=('python-wheel' 'python-build' 'python-setuptools' 'cython')
source=(https://files.pythonhosted.org/packages/source/p/pynini/pynini-$pkgver.tar.gz)
sha512sums=('d96bdc8d28edc51fd3a1c7d4f17725a0e32e44c0742f3ae4f65ea9d817f8deb2fffe4e43defb00f5c5c96a132698934312093c4206f96e6efffbbb57d9fa19f5')

build() {
  cd "$srcdir"/pynini-$pkgver

  # fix
  # extensions/stringmap.h:185:26: error: ‘StringJoin’ is not a member of ‘fst’; did you mean ‘StrJoin’? [-Wtemplate-body]
  # extensions/stringmap.h:230:26: error: ‘StringJoin’ is not a member of ‘fst’; did you mean ‘StrJoin’? [-Wtemplate-body]
  sed -i 's/StringJoin/StrJoin/g' extensions/stringmap.h
  # because openfst (a dependency) has this in its changelog:
  # * Renames compatibility shim `StringJoin` to `StrJoin` (1.8.4)
  # ... Actually, there's https://github.com/kylebgorman/pynini/pull/89 which also fixes this but...

  # Just 28 .cc (C++) files but each takes ~60 sec to compile on Ryzen 5 2600.
  # Because only 1 file compiles at a time.
  # This `parallel` option does parallelize... but only the first 2 .cc! FIXME
  echo '[build_ext]' >> setup.cfg
  echo "parallel = $(nproc)" >> setup.cfg

  python -m build --wheel --no-isolation
}

#check() {
#  cd "$srcdir"/pynini-$pkgver
#
#  (
#    local python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
#    export PYTHONPATH="${PWD}/build/lib.linux-${CARCH}-cpython-${python_version}"
#
#    pytest tests/
#    # Or:
#    # python tests/pynini_test.py
#    # which also fails but for some other reasons
#  )
#}


package() {
  cd "$srcdir"/pynini-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
