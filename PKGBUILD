
# Maintainer: Wai <waicool20@gmail.com>
pkgname=huiontablet
pkgver=15.0.0.162
pkgrel=1
pkgdesc="Official Huion tablet drivers"
arch=('x86_64')
url="https://www.huion.com/download/"
license=('unknown')
source=("https://driverdl.huion.com/driver/Linux/HuionTablet_LinuxDriver_v$pkgver.$arch.tar.xz")
sha256sums=("7066b75c613aabbf8cf1a57ea54910a4f62245ddb8986aa01aef300e0b2de87d")

prepare() {
  cd "${srcdir}"

  # Modify install script with our dirs
  sed -E -i "s|(sysRuleDir=).*|\1$pkgdir/usr/lib/udev/rules.d|" install.sh
  sed -E -i "s|(sysAppDir=).*|\1$pkgdir/usr/lib/|" install.sh
  sed -E -i "s|(sysDesktopDir=).*|\1$pkgdir/usr/share/applications|" install.sh
  sed -E -i "s|(sysAppIconDir=).*|\1$pkgdir/usr/share/icons|" install.sh
  sed -E -i "s|(sysAutoStartDir=).*|\1$pkgdir/etc/xdg/autostart|" install.sh

  # Remove problematic commands
  sed -E -i "s|killall.*||" install.sh
  sed -E -i "s|sudo ||g" install.sh
  sed -E -i "/^.*uninstall.*$/d" install.sh
  sed -E -i "/^.*close.*$/d" install.sh
  sed -E -i "/^echo.*$/d" install.sh
  sed -E -i "s|/usr/lib/huiontablet/res|$pkgdir\0|" install.sh

  # Remove stuff after this line
  sed -E -i "/#Copy config files/Q" install.sh

  # Remove files with problematic UTF-8 characters
  find . -name "*按键*" -delete 2>/dev/null || true
}

package() {
	cd "${srcdir}"

  # Make directories
  grep "sys.*Dir=" install.sh | sed -E 's/.*=(.*)/\1/' | tr -d '"' | xargs mkdir -p

  # Set proper locale for UTF-8 handling
  export LC_ALL=C.UTF-8

  # Invoke install script
	sh install.sh
}

