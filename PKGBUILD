# Maintainer: Yi Kuo <yi[at]yikuo[dot]dev>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Jelle van der Waa <jelle@archlinux.org>
# Contributor: Thorsten Töpper <atsutane-tu@freethoughts.de>

_pkgbase=i3lock-powerbtn-fingerprint
pkgname=${_pkgbase}-git
pkgver=2.14.1
pkgrel=1
pkgdesc='Improved screenlocker based upon XCB and PAM, with added power button fingerprint verification support'
url='https://github.com/YiPrograms/i3lock-powerbtn-fingerprint'
arch=('x86_64')
license=('MIT')
groups=('i3')
makedepends=('meson')
depends=('xcb-util-image' 'xcb-util-xrm' 'libev' 'cairo' 'libxkbcommon-x11' 'pam' 'fprintd')
provides=('i3lock')
conflicts=('i3lock' 'i3lock-powerbtn-fingerprint')
options=('docs')
backup=('etc/pam.d/i3lock', 'etc/pam.d/i3lock_fprint')
source=('git+https://github.com/YiPrograms/i3lock-powerbtn-fingerprint.git')
sha512sums=('SKIP')

prepare() {
  cd ${_pkgbase}

  # Fix ticket FS#31544, sed line taken from gentoo
  sed -i -e 's:login:system-auth:' pam/i3lock
}


build() {
  arch-meson $_pkgbase build
  meson compile -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build

  cd ${_pkgbase}
  install -Dm 644 i3lock.1 -t "${pkgdir}/usr/share/man/man1"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${_pkgbase}"
}

# vim: ts=2 sw=2 et:
