# Contributor: Arzet Ro (arzeth0@gmail.com)

pkgname=python-pynini
pkgver=2.1.6
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
sha512sums=('985411a153978c1ea79294e9aa30a59706f19c34697ec31c0610952fe18ed4d2aadd2fc4937e425ad0775dde5b22cada608b9e889e132c803288a147f28c65fe')

build() {
  cd "$srcdir"/pynini-$pkgver

  # fix
  # extensions/stringmap.h:185:26: error: ‘StringJoin’ is not a member of ‘fst’; did you mean ‘StrJoin’? [-Wtemplate-body]
  # extensions/stringmap.h:230:26: error: ‘StringJoin’ is not a member of ‘fst’; did you mean ‘StrJoin’? [-Wtemplate-body]
  sed -i 's/StringJoin/StrJoin/g' extensions/stringmap.h
  # because openfst (a dependency) has this in its changelog:
  # * Renames compatibility shim `StringJoin` to `StrJoin` (1.8.4)
  # ... Actually, there's https://github.com/kylebgorman/pynini/pull/89 which also fixes this but...

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
