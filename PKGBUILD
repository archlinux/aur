# Maintainer: artoo <artoo@manjaro.org>
# Contributor: Alexey D. <lq07829icatm@rambler.ru>
# Contributor: Jan de Groot <jgc@archlinux.org>

_pkgname=upower

pkgname=upower-pm-utils
pkgver=0.9.23
pkgrel=5
pkgdesc="Abstraction for enumerating power devices, listening to device events and querying history and statistics"
arch=('i686' 'x86_64')
url="http://upower.freedesktop.org"
license=('GPL')
groups=('eudev-base')
depends=('libusb' 'polkit-consolekit' 'pm-utils' 'dbus-glib' 'libimobiledevice' 'eudev-systemdcompat')
backup=('etc/UPower/UPower.conf')
makedepends=('intltool' 'docbook-xsl' 'gobject-introspection' 'python2')
provides=("upower=${pkgver}")
conflicts=('upower' 'upower-nosystemd')
replaces=('upower' 'upower-nosystemd')
options=('!libtool')
source=($url/releases/upower-${pkgver}.tar.xz
	'upower-pm-utils-0.9.23-clamp_percentage_for_overfull_batt.patch'
	'upower-pm-utils-0.9.23-create-dir-runtime.patch'
	'upower-pm-utils-0.9.23-fix-segfault.patch'
	'upower-pm-utils-0.9.23-always_use_pm-utils_backend.patch')

prepare(){
	cd "$_pkgname-$pkgver"

	sed  -e '/DISABLE_DEPRECATED/d' -i configure
 	sed  -e 's|Cflags: |&-DUPOWER_ENABLE_DEPRECATED |' -i upower-glib.pc.in

 	patch -p1 -i $srcdir/upower-pm-utils-0.9.23-create-dir-runtime.patch
 	patch -p1 -i $srcdir/upower-pm-utils-0.9.23-fix-segfault.patch
 	patch -p1 -i $srcdir/upower-pm-utils-0.9.23-clamp_percentage_for_overfull_batt.patch

 	patch -p1 -i $srcdir/upower-pm-utils-0.9.23-always_use_pm-utils_backend.patch
}

build() {
  cd "$_pkgname-$pkgver"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --libexecdir=/usr/lib/upower \
    --disable-static \
    --enable-deprecated
  make
}

package() {
  cd "$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

sha256sums=('433252b0a8e9ab4bed7e17ee3ee5b7cef6d527b1f5401ee32212d82a9682981b'
            'cb6e3a54f0ad2f9317f7954504e99485c1422c5ad96c644baa279510084a0858'
            'a3b845b2714e1fb3620af8f7153f800bb72316145c76aa6a90a2eedc3aebb527'
            'f6908be94d462e9753fe0cfbcd9f36aefc271066cc74e4cfcc57ef966a41a7f6'
            'ceb4d915205dcff2937bb82a3646323712eb548e6a9644e48516f647b180abbe')
