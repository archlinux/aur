# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Tony Lambiris <tony@libpcap.net>
# Contributor: Shaleen Jain <shaleen(at)jain(dot)sh>
pkgname=system76-dkms-git
pkgver=1.0.17.r0.gf01bffd
pkgrel=1
pkgdesc="On newer System76 laptops, this driver controls some of the hotkeys and allows for custom fan control."
arch=('x86_64')
url="https://github.com/pop-os/system76-dkms"
license=('GPL-2.0-or-later')
depends=('dkms')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/pop-os/system76-dkms.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"
  sed -i "s/#MODULE_VERSION#/${pkgver//.r*/}/" "debian/${pkgname%-git}.dkms"
}

package() {
  cd "${pkgname%-git}"
  install -Dm644 Makefile *.c -t "$pkgdir/usr/src/system76-${pkgver//.r*/}/"
  install -Dm644 "lib/udev/hwdb.d/99-${pkgname%-git}.hwdb" -t \
    "$pkgdir/usr/lib/udev/hwdb.d/"
  install -Dm644 "debian/${pkgname%-git}.dkms" \
    "$pkgdir/usr/src/system76-${pkgver//.r*/}/dkms.conf"
  install -Dm644 "usr/share/initramfs-tools/modules.d/${pkgname%-git}.conf" \
    "$pkgdir/etc/modules-load.d/system76.conf"
}
