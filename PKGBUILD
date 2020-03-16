# Copyright 2020 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Maintainer: Lisa White <lisq@google.com>
pkgname=mesonwrap
pkgver=0.2.0
pkgrel=1
epoch=
pkgdesc="Meson wraps service and tools"
arch=('x86_64')
url="https://github.com/mesonbuild/mesonwrap"
license=('apache2')
groups=()
depends=(
    'python>=3.8'
    'python-cachetools'
    'python-flask'
    'python-gitpython'
    'python-pygithub'
    'python-requests'
    'python-retrying'
)
makedepends=('python-setuptools')
checkdepends=()
optdepends=(
    'uwsgi-plugin-python: server support'
)
provides=()
conflicts=()
replaces=()
backup=(
    'etc/mesonwrap/mesonwrap.ini'
    'etc/uwsgi/mesonwrap.ini'
)
options=()
install=
changelog=
source=(
    "https://github.com/mesonbuild/$pkgname/archive/$pkgver.tar.gz"
    "mesonwrap.ini"
    "uwsgi.ini"
    "mesonwrap-upgrade.hook"
)
noextract=()
sha256sums=('58395e244437e96cd696cc468c89480fd4dd4bea439ecc09982ef36a44d11110'
            'e6dd175e2113d9d093ad2de4c9d22b126b8c4d69400d7dbcde79960f0ca75078'
            'd5b710008a5939608a294577169ff86226716ddaf7a6389aa7c8b89acc0422fb'
            '6b3a9b5574e37d8ae5fc3070f5cc662883c7794a6fb846d22a62ae370b8f08f1')

build() {
  cd "$pkgname-$pkgver"
  rm -rf build
  python setup.py build
}

check() {
  cd "$pkgname-$pkgver"
  python setup.py test
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --skip-build -O1 --root="$pkgdir"
  install -m0644 -D "COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -m0644 -D "$srcdir/mesonwrap.ini" "$pkgdir/etc/mesonwrap/mesonwrap.ini"
  install -m0644 -D "$srcdir/uwsgi.ini" "$pkgdir/etc/uwsgi/mesonwrap.ini"
  install -m0644 -D "$srcdir/mesonwrap-upgrade.hook" "$pkgdir/usr/share/libalpm/hooks/mesonwrap-upgrade.hook"
}
