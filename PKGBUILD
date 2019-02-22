# Copyright 2015 Friedrich Weber, Aleksey Filippov

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at

#     http://www.apache.org/licenses/LICENSE-2.0

# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Maintainer: Aleksey Filippov <sarum9in@gmail.com>
# Contributor: Friedrich Weber <fred@reichbier.de>

pkgname=czmq
pkgver=4.2.0
pkgrel=1
pkgdesc="High-level C binding for 0MQ"
arch=('i686' 'x86_64')
url="http://czmq.zeromq.org"
license=('MPL2')
depends=('zeromq>=4.0')
sha1sums=('03ab2a547603b51d7de73753cbacefe7a1f66b0f')
makedepends=()
source=("https://github.com/zeromq/czmq/archive/v${pkgver}.tar.gz")

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -r 's|-Werror=format-security|-Wformat &|' -i Makefile.am
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --enable-Werror=no
  make $MAKEFLAGS
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  # From version 4.0.0 binary is called /usr/bin/zmakecert
  # It is no longer moved since it is major version change
  # For compatibility symlink is provided.
  ln -s zmakecert "$pkgdir/usr/bin/makecert.czmq"
}
