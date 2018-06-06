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

# Maintainer: Aleksey Filippov <sarum9in@gmail.com>

pkgname=mtproxy-git
pkgver=17.580909c
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
)
noextract=()
md5sums=('SKIP'
         '1a9cdcef498d2e9ffb5def0112c3e2b0'
         '6ceb39b6a8462bc21c0940fd6ca5650e'
         'aa2367c3f759632473824fabcc3544ff'
         'c08b4b281c1e8c8587b04743f70cff0d')
backup=('etc/mtproxy.conf')

pkgver() {
  cd "$srcdir/$pkgname"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$srcdir/$pkgname"
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
