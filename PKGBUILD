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

# Maintainer: Lisa White <lisa.rsfp+dev@gmail.com>
# Contributor: Yaroslav Dronskiy <jaroslav@dronsky.ru>
# Contributor: Aleksey Filippov <sarum9in@gmail.com>

pkgname=mtproxy-git
pkgver=47.dc0c7f3
pkgrel=2
pkgdesc="Proxy server for Telegram messaging app"
arch=('i686' 'x86_64')
url='https://github.com/TelegramMessenger/MTProxy'
license=('GPLv2' 'LGPLv2')
depends=('curl' 'zlib')
source=(
    "$pkgname::git+https://github.com/TelegramMessenger/MTProxy.git"
    mtproxy.conf
    mtproxy-config.service
    mtproxy-config.timer
    mtproxy.service
    pid_assertion.patch
    fcommon.patch
)
noextract=()
md5sums=('SKIP'
         '1a9cdcef498d2e9ffb5def0112c3e2b0'
         'a67f6a3b3874d9dac15c7cf620d696c2'
         'aa2367c3f759632473824fabcc3544ff'
         '1ee66acee6c42aca9160b9ccfe534bc3'
         '50233354ac78d52280a93092b809f7aa'
         '91501ebe32a2f3f9f6463703a1ca427f')
backup=('etc/mtproxy.conf')

pkgver() {
  cd "$srcdir/$pkgname"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  cd "$srcdir/$pkgname"
  patch --forward --strip=1 --input="$srcdir/pid_assertion.patch"
  patch --forward --strip=1 --input="$srcdir/fcommon.patch"
}

build() {
  cd "$srcdir/$pkgname"
  export CFLAGS=-fcommon
  export CXXFLAGS=-fcommon
  export LDFLAGS=-fcommon
  make $MFLAGS
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm 755 objs/bin/mtproto-proxy "$pkgdir/usr/bin/mtproto-proxy"
  # SystemD configuration
  install -Dm 644 "$srcdir/mtproxy.conf" "$pkgdir/etc/mtproxy.conf"
  for srv in mtproxy-config.service mtproxy-config.timer mtproxy.service; do
    install -Dm 644 \
        "$srcdir/$srv" \
        "$pkgdir/usr/lib/systemd/system/$srv"
  done
  # Create directory for configuration
  install -d "$pkgdir/var/lib/mtproxy"
}
