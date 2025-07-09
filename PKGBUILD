# Maintainer: WithoutAName <withoutaname@withoutaname.eu>
# Contributer: grgergo <gergo@tutanota.de>

pkgname=pico-sdk-develop-git
_pkgname=pico-sdk
pkgver=2.1.1.r104.g214c243
pkgrel=1
pkgdesc='Raspberry Pi Pico C SDK (develop branch)'
license=('BSD-3-Clause')
arch=(any)
url='https://www.raspberrypi.com/documentation/pico-sdk/'
options=(!strip)

makedepends=('git' 'rsync')
conflicts=('pico-sdk' 'pico-sdk-git' 'raspberry-pico-sdk-git')
provides=('pico-sdk' 'raspberry-pico-sdk-git')

source=('git+https://github.com/raspberrypi/pico-sdk#branch=develop'
        'git+https://github.com/hathach/tinyusb.git'
        'git+https://github.com/georgerobotics/cyw43-driver.git'
        'git+https://github.com/lwip-tcpip/lwip.git'
        'git+https://github.com/Mbed-TLS/mbedtls.git'
        'git+https://github.com/bluekitchen/btstack.git'
        'git+https://github.com/Mbed-TLS/mbedtls-framework.git'
        'pico-sdk.sh')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '8610406fc529818eb2f67163e19a7204cda36f8cd7ed77fb4a65154918de3acb')

prepare() {
  cd "$_pkgname"
  git submodule init

  git config submodule.tinyusb.url "$srcdir/tinyusb"
  git config submodule.lib/cyw43-driver.url "$srcdir/cyw43-driver"
  git config submodule.lib/lwip.url "$srcdir/lwip"
  git config submodule.lib/mbedtls.url "$srcdir/mbedtls"
  git config submodule.lib/btstack.url "$srcdir/btstack"

  git -c protocol.file.allow=always submodule update

  cd lib/mbedtls
  git submodule init

  git config submodule.framework.url "$srcdir/mbedtls-framework"

  git -c protocol.file.allow=always submodule update
}

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  # Install sdk
  cd "$_pkgname"
  mkdir -p "$pkgdir/usr/share"
  rsync -a --exclude='.git*' "$srcdir/$_pkgname/" "$pkgdir/usr/share/$_pkgname/"

  # Install environment config
  install -Dm644 "$srcdir/$_pkgname.sh" "$pkgdir/etc/profile.d/$_pkgname.sh"

  # Install docs
  install -Dm644 "$srcdir/pico-sdk/README.md" -t "$pkgdir/usr/share/doc/$_pkgname"

  # Install license
  install -Dm644 "$srcdir/pico-sdk/LICENSE.TXT" -t "$pkgdir/usr/share/licenses/$_pkgname"
}
