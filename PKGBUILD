_KVER=$(uname -r)
#_KVER=5.11.2-1-ARCH

pkgname=xradio-git
_pkgname=xradio
pkgver=r183.354e8c3
pkgrel=4
pkgdesc="Driver for the Allwinner XRadio XR819 wifi chip"
arch=('armv7h')
url="https://github.com/karabek/xradio"
license=('GPL')
install=xradio.install
makedepends=('git' 'linux-headers')
source=("git+https://github.com/dbeinder/xradio.git#branch=karabek_rebase"
        "0001-fix-latest.patch")
sha256sums=('SKIP'
            'cb92aaef5f924bc896878ae8df20a65d485a59bf3a2cc3d63b9c83acd66c0ae9')

pkgver() {
	cd "$srcdir/${_pkgname}"
	
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/${_pkgname}"

  patch -Np1 -i "$srcdir/0001-fix-latest.patch"
}

build() {
	cd "${_pkgname}"

	sed -i "s|.*CONFIG_WLAN_VENDOR_XRADIO := m.*| CONFIG_WLAN_VENDOR_XRADIO := m|g" Makefile
	sed -i "s|.*DCONFIG_XRADIO_USE_EXTENSIONS.*| ccflags-y += -DCONFIG_XRADIO_USE_EXTENSIONS|g" Makefile
	make -C /usr/lib/modules/${_KVER}/build M=$PWD modules
}

package() {
	cd "${_pkgname}"
	
  make -C /usr/lib/modules/${_KVER}/build M=$PWD INSTALL_MOD_PATH="$pkgdir" modules_install

	# fix modules path
	mkdir -p "$pkgdir"/usr
	mv "$pkgdir"/lib "$pkgdir"/usr/

	# install firmware
	for i in boot fw sdd; do
		install -Dm0644 "$srcdir"/xradio/firmware/${i}_xr819.bin "$pkgdir"/usr/lib/firmware/xr819/${i}_xr819.bin
	done
	install -Dpm644 README* -t "${pkgdir}/usr/share/doc/${_pkgname}/"
}
# vim: set sw=2 ts=2 et:
