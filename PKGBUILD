# Maintainer: Alex Henrie <alexhenrie24@gmail.com>
pkgver=2020.1
pkgname=petalinux-v$pkgver
pkgrel=1
pkgdesc='Toolchain and SDK for Xilinx embedded Linux'
arch=('x86_64')
url='https://www.xilinx.com/products/design-tools/embedded-software/petalinux-sdk.html'
license=('custom')
depends=('bzip2' 'ccache' 'chrpath' 'cpio' 'diffstat' 'diffutils' 'dos2unix' 'git' 'glib2' 'gnupg' 'ncurses' 'ncurses5-compat-libs' 'net-tools' 'openssl' 'pax' 'perl' 'python-gitpython' 'python-jinja' 'python-pexpect' 'python-pip' 'python-pylint' 'screen' 'sdl' 'socat' 'unzip' 'wget' 'xterm' 'zlib')
options=('!strip')
install="$pkgname.install"
source=("local://petalinux-v$pkgver-final-installer.run")
sha256sums=('cd48270f10bf7fd6538aaa50ba99f699516234fae03108626d00f243d4ad17ee')

prepare() {
	PLNXINSTALLLER="petalinux-v$pkgver-final-installer.run"

	PLNX=$(awk '/^##__PLNXLICENSE__/ { print NR + 1; exit 0; }' "${PLNXINSTALLLER}")
	WEBTALK=$(awk '/^##__WEBTALKLICENSE__/ { print NR + 1; exit 0; }' "${PLNXINSTALLLER}")
	sed -n -e "$PLNX,$WEBTALK p" "${PLNXINSTALLLER}" > Petalinux_EULA.txt

	INSTL=$(awk '/^##__PLNXINSTL__/ { print NR + 1; exit 0; }' "${PLNXINSTALLLER}")
	SKIP=$(awk '/^##__PLNXSDK_FOLLOWS__/ { print NR + 1; exit 0; }' "${PLNXINSTALLLER}")
	sed -n -e "$INSTL,$(($SKIP-2)) p" "${PLNXINSTALLLER}" > petalinux-install
	chmod +x petalinux-install

	export PLNXINSTALLLER
}

package() {
	env -i \
		PLATFORMS="aarch64 arm microblaze_full microblaze_lite" \
		PLNXCHECKSUM="b6b5b2db4aea6435dbc07b7b5b1fd2c6" \
		PLNXINSTALLDIR="$pkgdir/opt/$pkgname" \
		PLNXINSTALLLER="$PLNXINSTALLLER" \
		./petalinux-install
	grep -rlFI "$pkgdir" "$pkgdir" | xargs sed -i "s!$pkgdir!!g"
	install -Dm644 Petalinux_EULA.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
