# Maintainer: Nicolas Derumigny nderumigny <at> gmail <dot> com
# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Thomas Baechler <thomas@archlinux.org>

_pkgbase=libfprint
pkgname=${_pkgbase}-tudor
pkgver=1.0.0
pkgrel=2
pkgdesc="Library for fingerprint readers - exotic Synaptic devices component"
url="https://fprint.freedesktop.org/"
arch=(x86_64)
license=(LGPL)
depends=(libgusb pixman nss systemd libgudev libfprint-tod-git)
makedepends=(git meson ninja innoextract openssl)
source=("git+https://github.com/Popax21/synaTudor/")
sha256sums=('SKIP')

build() {
  cd synaTudor
  mkdir -p build
  meson setup --prefix=/usr --buildtype=plain . build
  meson compile -C build
}

package() {
  cd synaTudor/
  meson install -C build --destdir "$pkgdir"
  sed -i "s!$pkgdir!!g" "$pkgdir/usr/share/dbus-1/system-services/net.reactivated.TudorHostLauncher.service"
  mkdir -p "$pkgdir/usr"
  mv "$pkgdir/sbin" "$pkgdir/usr/bin"
}
