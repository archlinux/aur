# Maintainer: Thomas Weißschuh <thomas t-8ch de>
# Contributor: Carl George <cwgtex gmail.com>

pkgname=palm-novacom-git
pkgver=20201030
pkgrel=1
pkgdesc="WebOS <-> PC connection, open source version"
arch=('x86_64' 'i686')
url="http://openwebosproject.org/"
license=('Apache')
depends=('libusb-compat')
makedepends=('libusb-compat' 'cmake-modules-webos-git')
provides=('palm-novacom')
conflicts=('palm-novacom')
source=(
        'git+https://github.com/openwebos/novacom'
        'git+https://github.com/openwebos/novacomd'
        'novacomd.service'
        '0001-Use-usb_bulk_-read-write-instead-of-homemade-handler.patch'
        '0002-Fix-makefile-so-it-respects-environmental-CFLAGS.patch'
        '0003-Remove-unused-err-variable.patch'
        '0004-avoid-duplicate-symbols.patch')

build() {
  cd "$srcdir"

  msg "Building Client"

  rm -rf client-build
  mkdir client-build
  cd client-build

  cmake ../novacom
  make

  msg "Building Server"

  cd "$srcdir"
  cd novacomd

  patch -Np1 -i  "${srcdir}/0001-Use-usb_bulk_-read-write-instead-of-homemade-handler.patch"
#  patch -Np1 -i "${srcdir}/0002-Fix-makefile-so-it-respects-environmental-CFLAGS.patch"
#  patch -Np1 -i "${srcdir}/0003-Remove-unused-err-variable.patch"
  patch -Np1 -i  "${srcdir}/0004-avoid-duplicate-symbols.patch"

  cd "$srcdir"
  rm -rf server-build
  mkdir server-build
  cd server-build

  cmake -DWEBOS_TARGET_MACHINE_IMPL=host -D WEBOS_INSTALL_ROOT=$pkgdir ../novacomd

  make

}

package() {
  cd "$srcdir"
  install -D -m755 novacomd.service $pkgdir/usr/lib/systemd/system/novacomd.service

  install -D -m755 "$srcdir/novacom/scripts/novaterm" "$pkgdir/usr/bin/novaterm"
  install -D -m755 "$srcdir/client-build/novacom" "$pkgdir/usr/bin/novacom"
  install -D -m755 "$srcdir/server-build/novacomd" "$pkgdir/usr/bin/novacomd"
}

pkgver() {
  date '+%Y%m%d'
}

sha256sums=('SKIP'
            'SKIP'
            '9d4ed1bc1f0a8d091394e0273353384962b8276c0f72f7341138daa87bc6d6e5'
            '971f634077384bb53dcd679f59a76a5d98a9f3cc6ef2efd167c65a58003d3890'
            'cc7eff6b70b7b953b39f4f918718836bdf543e64b77137fadeee3d875434ef21'
            '065d8b2976700d2ed6861d8fd9c6cf8b621be13ba16e9dd8c01c0e250b0d4415'
            'a86ef9a1c08f4b23b93b0052770be3f8a4023ca020c52456953c021e7441e5a3')
