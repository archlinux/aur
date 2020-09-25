# Maintainer: Damien Nguyen <damien1@huawei.com>

# ==============================================================================
#
# Copyright 2020 <Huawei Technologies Co., Ltd>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# ==============================================================================

pkgname=python-hiq-projectq
_name=${pkgname#python-}

pkgver=0.6.4.post2
pkgrel=1
pkgdesc="Huawei HiQ ProjectQ - An open source software framework for quantum computing"
arch=('x86_64')
license=('Apache')
url="https://hiq.huaweicloud.com/en/"
depends=('python-matplotlib'
         'python-networkx'
         'python-numpy'
         'python-pytest'
         'python-requests'
         'python-scipy'
         'python-sympy')
makedepends=('pybind11'
	     'python-setuptools'
	     'python-sphinx'
	     'python-sphinx_rtd_theme')
checkdepends=('python-matplotlib'
              'python-networkx'
              'python-numpy'
              'python-pytest'
              'python-requests'
              'python-scipy'
              'python-sympy')
conflicts=('python-projectq')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('02b9cef43f4e3f2ab49d8f6d3c170d6dbcce310dd3a038a115eea9bf0d0e51a7d8796631e2a9698d36d525857c70bec35f1536f0fd48d9f00fc25bb6b0ba79c0')

groups=(python-hiq)

prepare() {
  cd "$srcdir/$_name-$pkgver"
  # patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
}

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build

  if [ -d doc ]; then
    cd doc && make html
  fi
}

check() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build_ext --inplace

  # Make sure there is always at least one test to be found by pytest
  cat << EOF > projectq/aur_test.py
def test_dummy():
    pass
EOF

  python -m pytest -p no:warnings
  rm -v projectq/aur_test.py
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -d "$pkgdir"/usr/share/doc/$pkgname
  install -Dm 644 README.rst "$pkgdir"/usr/share/doc/$pkgname/README.rst
  install -Dm 644 CHANGELOG.rst "$pkgdir"/usr/share/doc/$pkgname/CHANGELOG.rst
  install -Dm 644 NOTICE "$pkgdir"/usr/share/doc/$pkgname/NOTICE
  
  if [ -d doc ]; then
    cp -r docs/_build/html "$pkgdir"/usr/share/doc/$pkgname
  fi

  if [ -d examples ]; then
    cp -r examples "$pkgdir"/usr/share/doc/$pkgname
    find "$pkgdir"/usr/share/doc/$pkgname/examples -type f -exec chmod 644 {} +
  fi
  
}

# vim:set ts=2 sw=2 et:
