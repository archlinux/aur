# Maintainer: João Figueiredo <islandc0der@chaotic.cx>
# Contributor: Pekka Helenius <fincer89 [at] hotmail [dot] com>

pkgname=pam_usb-git
pkgver=0.8.2_r500.g7a785de
pkgrel=4
pkgdesc='Hardware authentication for Linux using ordinary flash media (USB & Card based).'
arch=($CARCH)
url='https://github.com/mcdope/pam_usb'
license=(GPL2)
depends=(python-gobject libxml2 udisks2)
makedepends=(git)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
options=(!emptydirs)
backup=("etc/security/pam_usb.conf")
source=("git+$url"
        "pamusb-agent.service")
sha256sums=('SKIP'
            'f5875f0669b2638f36885c305d719072798b5097b15e6c94a8a852bb896bfc5c')

pkgver() {
  cd ${pkgname%-git}
  _ver="$(grep -m1 'define PUSB_VERSION ' "src/version.h" | cut -d '"' -f2 | tr - .)"
  echo "${_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  make -C ${pkgname%-git}
}

package() {
  make -C ${pkgname%-git} DESTDIR="$pkgdir" PAM_USB_DEST="$pkgdir/usr/lib/security" install
  install -Dt "$pkgdir/usr/lib/systemd/system" -m0644 "pamusb-agent.service"
}
