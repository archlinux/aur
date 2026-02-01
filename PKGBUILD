# Maintainer: fdossena <info@fdossena.com>

pkgname=modetc
pkgver=0.1.5
pkgrel=1
pkgdesc='Move your dotfiles from kernel space'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://maxwell.eurofusion.eu/git/rnhmjoj/modetc"
license=('GPL-3.0-or-later')
depends=()
makedepends=('base-devel' 'git')
provides=('modetc')
source=(git+https://maxwell.eurofusion.eu/git/rnhmjoj/modetc.git)
sha256sums=(SKIP)

pkgver() {
  cd "$srcdir/$pkgname"
  VER=$(git tag --sort=committerdate | tail -1 | sed 's/^v//')
  REV=$(git rev-list --count HEAD)
  HASH=$(git rev-parse --short=7 HEAD)
  KERN=$(uname -r)
  printf "%s.r%s.%s.%s" "$VER" "$REV" "$HASH" "$(echo $KERN | tr '-' '.')"
}

build() {
  cd "$srcdir/$pkgname"
  make -C "/usr/lib/modules/$(uname -r)/build" M="$srcdir/$pkgname" modules
}

package() {
  cd "$srcdir/$pkgname"
  mkdir -p "$pkgdir/usr/lib/modules/$(uname -r)/extras"
  install -Dm644 modetc.ko "$pkgdir/usr/lib/modules/$(uname -r)/extras/modetc.ko"
}

post_install(){
  depmod -a
  echo "To enable modetc, use this command: sudo modprobe modetc homedir=/home/your_user default_rule=.config/"
}
