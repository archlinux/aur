# Maintainer: Swift Geek
# TODO: DKMS

_gitname=esp8089
pkgname=$_gitname-git
pkgver=a
pkgrel=1
pkgdesc="Linux kernel module driver for the ESP8089 WiFi chip"
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/jwrdegoede/$_gitname"
license=('GPL')
install=$_gitname.install
depends=('linux')
makedepends=('git' 'linux-headers')
options=(!strip)
source=("git+${url}.git" \
        "cleanup::git+${url}.git#branch=cleanup" )

md5sums=('SKIP' 'SKIP')

pkgver() {
   cd "$srcdir/$_gitname"
   printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
   cd "$srcdir/$_gitname/"
   cp $srcdir/cleanup/esp_mac80211.c ./
   make modules M=../$_gitname CONFIG_ESP8089=m
   gzip -f esp8089.ko
}

package() {
   cd "$srcdir/$_gitname/"
   install -Dm644 esp8089.ko.gz "$pkgdir/usr/lib/modules/$(uname -r)/kernel/drivers/net/wireless/esp8089.ko.gz"
   install -d "$pkgdir/usr/lib/firmware/"
   install -Dm644 firmware/* "$pkgdir/usr/lib/firmware/"
   #depmod -a $(uname -r)
}
