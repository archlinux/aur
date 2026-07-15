# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Tony Lambiris <tony@libpcap.net>
# Contributor: Shaleen Jain <shaleen(at)jain(dot)sh>
pkgname=system76-dkms-git
pkgver=1.0.22.r5.gc5d0d13
pkgrel=1
pkgdesc="Hotkey and custom fan control on System76 laptops with Clevo proprietary firmware"
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
  echo "BUILT_MODULE_LOCATION[1]=\"src\"" >>"debian/${pkgname%-git}.dkms"
}

package() {
  cd "${pkgname%-git}"
  install -Dm644 Kbuild Makefile -t "$pkgdir/usr/src/system76-${pkgver//.r*/}/"
  cp -r src "$pkgdir/usr/src/system76-${pkgver//.r*/}/"
  install -Dm644 "debian/${pkgname%-git}.dkms" \
    "$pkgdir/usr/src/system76-${pkgver//.r*/}/dkms.conf"
  install -Dm644 "usr/share/initramfs-tools/modules.d/${pkgname%-git}.conf" \
    "$pkgdir/etc/modules-load.d/system76.conf"
}
