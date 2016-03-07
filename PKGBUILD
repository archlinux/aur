# Maintainer: juantascon <juantascon.aur@horlux.org>

pkgname=hid-apple-patched-git
_pkgname=hid-apple-patched
pkgver=20160101.844877e
pkgrel=2
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

_kernmajor="$(pacman -Q linux | sed -r 's/linux ([0-9]*.[0-9]*).*/\1/')"
_kernver="$(</usr/lib/modules/extramodules-"$_kernmajor"-ARCH/version)"

pkgver() {
  cd "$srcdir"/"$_pkgname"
  git log -1 --format=%cd.%h --date=short|tr -d -
}

build() {
  make -C /usr/lib/modules/${_kernver}/build M=`pwd`/"$_pkgname"
}

package() {
  install -Dm644 "$_pkgname"/hid-apple.ko "$pkgdir"/usr/lib/modules/extramodules-"$_kernmajor"-ARCH/hid-apple.ko
  gzip "$pkgdir"/usr/lib/modules/extramodules-"$_kernmajor"-ARCH/hid-apple.ko
  install -Dm600 hid-apple-patched.conf "$pkgdir"/etc/depmod.d/hid-apple-patched.conf
}
