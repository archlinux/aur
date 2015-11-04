# Maintainer: juantascon <juantascon.aur@horlux.org>

pkgname=hid-apple-patched-git
_pkgname=hid-apple-patched
pkgver=20151103.86bfdb4
pkgrel=1
pkgdesc="Allows to swap the Fn key and left Control key on Macbook Pro and Apple keyboards in GNU/Linux"
url="https://github.com/free5lot/hid-apple-patched"
arch=('any')
license=('GPL3')
depends=('linux-headers')
makedepends=('git')
install="$_pkgname".install
source=("git+https://github.com/free5lot/hid-apple-patched#branch=master" "hid-apple-patched.conf")
sha256sums=('SKIP'
            '4b94f1f55febddad5ff60a8918487b883ceadd4e6c3fb280e98e4e235cd09663')

LINUX_HEADER_DIR=/usr/lib/modules/$(pacman -Qi linux-headers|grep "^Version"|awk '{print $3}')-ARCH/build

pkgver() {
  cd "$srcdir"/"$_pkgname"
  git log -1 --format=%cd.%h --date=short|tr -d -
}

build() {
  cd "$srcdir"/"$_pkgname"
  make LINUX_HEADER_DIR=$LINUX_HEADER_DIR
}

package() {
  cd "$srcdir"/"$_pkgname"
  make LINUX_HEADER_DIR=$LINUX_HEADER_DIR INSTALL_MOD_PATH="$pkgdir" install
  mkdir "$pkgdir"/usr
  mv "$pkgdir"/lib "$pkgdir"/usr
 
  cd "$srcdir"
  mkdir -p "$pkgdir"/etc/depmod.d
  install -m600 hid-apple-patched.conf "$pkgdir"/etc/depmod.d
}
