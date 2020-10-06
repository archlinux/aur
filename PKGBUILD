# $Id$
# Maintainer: Chris Fordham <chris at fordham-nagy dot id dot au> aka flaccid
pkgname=rtl8192eu-git
_pkgname=rtl8192eu
pkgver=118.1628c74
pkgrel=1
pkgdesc="Drivers for the rtl8192eu chipset for wireless adapters (D-Link DWA-131)."
arch=("x86_64")
url="https://github.com/Mange/rtl8192eu-linux-driver"
license=('GPL')
depends=("dkms")
makedepends=('bc' 'git' 'linux-headers')
source=("git+https://github.com/Mange/rtl8192eu-linux-driver.git#branch=realtek-4.4.x" "fix.patch")
sha256sums=("SKIP" "582f8e8f8bd513b598ada3a1ac625f188fbf313cddf018a440ca4cd8aaf9964c")
install="$_pkgname.install"

pkgver() {
  pushd "$srcdir/$_pkgdir/rtl8192eu-linux-driver" >/dev/null
    printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  popd > /dev/null
}

prepare(){
	pushd "$srcdir/$_pkgdir/rtl8192eu-linux-driver" >/dev/null
		patch Makefile<../fix.patch
		if grep -q 'model name.*ARM' /proc/cpuinfo; then
			sed -i -e 's/CONFIG_PLATFORM_I386_PC = y/CONFIG_PLATFORM_I386_PC = n/' -e 's/CONFIG_PLATFORM_ARM_RPI = n/CONFIG_PLATFORM_ARM_RPI = y/' Makefile
		fi
	popd
}

build() {
	pushd 'rtl8192eu-linux-driver' >/dev/null
		make -j"$(cat /proc/cpuinfo | grep "processor" | wc -l)"
	popd >/dev/null
}

package() {
	pushd 'rtl8192eu-linux-driver' >/dev/null
		mkdir -p "$pkgdir/usr/lib/modules/`uname -r`/kernel/drivers/net/wireless"
		make DESTDIR="$pkgdir/usr" install
	popd >/dev/null
}
