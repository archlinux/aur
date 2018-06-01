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
pkgver=0.0.0
pkgrel=4
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
         '6f01f66a7b42d07f9b84c2dc8d364468'
         '7381aebdd60a0640e1f0210b39aa208d'
         'aa2367c3f759632473824fabcc3544ff'
         '311c6bd4a7e5f67c233b82ca522faf79')
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
