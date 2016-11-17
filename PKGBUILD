pkgname=rtl8723bu-git
_pkgname=rtl8723bu-git
pkgver=r193.4c9b566
pkgrel=1
pkgdesc="Driver for RTL8723BU"
url="https://github.com/lwfinger/rtl8723bu"
provides=('rtl8723bu-git')
arch=('any')
license=('GPL')
install=rtl8723bu-git.install
builddepends=('linux-headers')
source=("${_pkgname}::git+https://github.com/lwfinger/rtl8723bu"
	'blacklist-rtl8723bu.conf')
sha256sums=('SKIP'
            'dc6a9bfc6a796461da2219accc7a6ae755ea13253737630e1538f3d98aa7aff5')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {	
	cd "${srcdir}/${_pkgname}/"
	make
}

package() {
	mkdir -p "${pkgdir}/etc/modprobe.d/"
	install -p -m 644 blacklist-rtl8723bu.conf "${pkgdir}/etc/modprobe.d/"
	cd "${srcdir}/${_pkgname}/"
	_kver=$(uname -r)
	mkdir -p "${pkgdir}/usr/lib/modules/${_kver}/kernel/drivers/net/wireless/rtl8723bu/"
	mkdir -p "${pkgdir}/usr/lib/firmware/rtl8723bu/" 
	install -p -m 644 8723bu.ko "${pkgdir}/usr/lib/modules/${_kver}/kernel/drivers/net/wireless/rtl8723bu/"
	install -p -m 644 rtl8723b_fw.bin "${pkgdir}/usr/lib/firmware/rtl8723bu/" 
        install -p -m 644 rtl8723bu_ap_wowlan.bin "${pkgdir}/usr/lib/firmware/rtl8723bu/"
	install -p -m 644 rtl8723bu_bt.bin "${pkgdir}/usr/lib/firmware/rtl8723bu/" 
	install -p -m 644 rtl8723bu_nic.bin "${pkgdir}/usr/lib/firmware/rtl8723bu/"
        install -p -m 644 rtl8723bu_wowlan.bin "${pkgdir}/usr/lib/firmware/rtl8723bu/"
}
