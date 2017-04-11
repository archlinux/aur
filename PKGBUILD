_KVER=$(uname -r)
#_KVER=4.10.8-1-ARCH

pkgname=xradio-git
pkgver=r103.9d27fae
pkgver() {
	cd "$srcdir/xradio"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
pkgrel=3
pkgdesc="Port Allwinner xradio driver to mainline Linux"
arch=(armv7h)
url="https://github.com/fifteenhex/xradio.git"
license=('GPL')
depends=()
install=xradio.install
makedepends=('git' 'linux-headers')
source=("git+https://github.com/fifteenhex/xradio.git"
	"http://filez.zoobab.com/allwinner/h2/201609022/android/hardware/broadcom/wlan/bcmdhd/firmware/xr819/boot_xr819.bin"
	"http://filez.zoobab.com/allwinner/h2/201609022/android/hardware/broadcom/wlan/bcmdhd/firmware/xr819/fw_xr819.bin"
	"http://filez.zoobab.com/allwinner/h2/201609022/android/hardware/broadcom/wlan/bcmdhd/firmware/xr819/sdd_xr819.bin")
sha256sums=('SKIP'
            '6583350b3eb12f70fc6d6081426717bd0019b55c6558ffe820c1548f0702bb8c'
            '4954ceb85807959c42e82c432109455bd9eabe95971402299a16d77ddd7d79f5'
            '84d3fb3ca8e5d25a0c113a5063bccbeb5b53da230a0afa236b5b625f37db5161')

build() {
	cd "xradio"
	make -C /usr/lib/modules/${_KVER}/build M=$PWD modules
}

package() {
	cd "xradio"
	make -C /usr/lib/modules/${_KVER}/build M=$PWD INSTALL_MOD_PATH="$pkgdir" modules_install

	# fix modules path
	mkdir -p "$pkgdir"/usr
	mv "$pkgdir"/lib "$pkgdir"/usr/

	# install firmware
	for i in boot fw sdd; do
		install -Dm0644 "$srcdir"/${i}_xr819.bin "$pkgdir"/usr/lib/firmware/xr819/${i}_xr819.bin
	done
}
