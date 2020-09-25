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

pkgname=python-hiq-circuit
_name=${pkgname#python-}

pkgver=0.0.2.post4
pkgrel=1
pkgdesc="Huawei HiQ: A high performance distributed quantum simulator"
arch=('x86_64')
url="https://hiq.huaweicloud.com/en/"
license=('Apache')
depends=('boost-libs'
	 'gflags'
	 'google-glog'
	 'hwloc'
	 'openmpi'
	 'python-mpi4py')
makedepends=('cmake'
	     'boost'
	     'python-setuptools')
checkdepends=('boost-libs'
	      'gflags'
	      'google-glog'
	      'hwloc'
	      'openmpi'
	      'python-mpi4py'
	      'python-pytest')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('a890fb3c62e03f40840c8cd097a5bc03e439f2061407095c8dfcc824c4b7a725ba33da9028ac15a74e2de56bc714f20d2aaac2d0d075b59dd03dce73a32089fa')
groups=(python-hiq)

prepare() {
  cd "$srcdir/$_name-$pkgver"
  # patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
}

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build

  if [[ -d examples ]]; then
    python setup.py build_ext --inplace
  fi
  
  if [ -d doc ]; then
    cd doc && make html
  fi
}

check() {
  cd "$srcdir/$_name-$pkgver"

  if [[ -d examples ]]; then
    python examples/BV_algorithm_constant_mpi.py
    python examples/exactgrover_mpi.py
    python examples/grover_mpi.py
    python examples/maximum_search_constant_mpi.py
    python examples/phase_estimation_mpi.py
    python examples/qecc9_sta.py
    python examples/SymMatrixSolver_mpi.py
    python examples/teleport_mpi.py
    python examples/ToeplitzSimplify_constant.py
    python examples/grover_mpi.py
    python examples/unknown_num_search_constant_mpi.py
  fi
}

package() {
  depends+=("python-hiq-projectq")
  check_depends+=("python-hiq-projectq")

  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  # Remove files that are already in python-hiq-projectq
  pushd "$pkgdir/usr/lib/"python*/site-packages/projectq
  rm -fv __init__.py
  rm -fv __pycache__/__init__.*.pyc
  rm -fv backends/__init__.py
  rm -fv backends/__pycache__/__init__.*.pyc
  rm -fv cengines/__init__.py
  rm -fv cengines/__pycache__/__init__.*.pyc
  rm -fv ops/__init__.py
  rm -fv ops/__pycache__/__init__.*.pyc
  popd

  install -d "$pkgdir"/usr/share/doc/$pkgname
  install -Dm 644 README.rst "$pkgdir"/usr/share/doc/$pkgname/README.rst

  if [ -d doc ]; then
    cp -r docs/_build/html "$pkgdir"/usr/share/doc/$pkgname
  fi

  if [ -d examples ]; then
    cp -r examples "$pkgdir"/usr/share/doc/$pkgname
    find "$pkgdir"/usr/share/doc/$pkgname/examples -type f -exec chmod 644 {} +
  fi
}


# vim:set ts=2 sw=2 et:
