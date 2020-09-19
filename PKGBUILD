# Copyright 2018 Google LLC

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at

#     http://www.apache.org/licenses/LICENSE-2.0

# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Maintainer: David Wu <xdavidwuph@gmail.com>
# Contributor: Lisa White <lisa.rsfp+dev@gmail.com>
# Contributor: Aleksey Filippov <sarum9in@gmail.com>
# Contributor: Adrian Perez de Castro <aperez@igalia.com>
# Contributor: Lubosz Sarnecki <lubosz@gmail.com>
pkgname=hotdoc
pkgver=0.12.2
pkgrel=2
pkgdesc='The tastiest API documentation system'
arch=('x86_64') # parsers are built into native libraries
url='https://github.com/hotdoc/hotdoc'
license=('LGPL2.1')
_xdgver=4.0.1
depends=(
    'json-glib'
    'clang'
    'llvm'
    'python'
    'python-yaml'
    'python-lxml'
    'python-schema'
    'python-appdirs'
    'python-wheezy-0.1.167'
    'python-toposort'
    'python-dbus-deviation'
    'python-pkgconfig-1.1.0'
    'python-cchardet'
    'python-networkx-1.11'
    'python-setuptools' # needed by hotdoc/utils/utils.py
)
makedepends=(
    'cmake'
    'flex'
    'git'
    'npm'
)
# upstream tarball does not contain submodules or their revision info
source=(
    "git+https://github.com/${pkgname}/${pkgname}.git#tag=${pkgver}"
    'xdg-path.patch'
    "https://github.com/srstevenson/xdg/archive/${_xdgver}.tar.gz"
)
sha256sums=('SKIP'
            'c29c62073f0ffe03c8975a28855a42cf96c40085ff53d14303f832269c0d7d7c'
            'dfa8c94c29980faa6f67199c305b3e1de0f5aba48a0636d3a2aeccf0e0a662b7')

prepare() {
  cd "${pkgname}"
  patch -p1 -i ../xdg-path.patch
  mkdir -p hotdoc/xdg
  cp "../xdg-${_xdgver}/src/xdg/__init__.py" hotdoc/xdg
}

build() {
  cd "${pkgname}"
  python setup.py build
}

package() {
  cd "${pkgname}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  install -Dm644 "../xdg-${_xdgver}/LICENCE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENCE.xdg"
}
