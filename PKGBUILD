# Maintainer: Alex Henrie <alexhenrie24@gmail.com>
pkgname=petalinux
pkgver=2023.1
pkgrel=1
pkgdesc='Toolchain and SDK for Xilinx embedded Linux'
arch=('x86_64')
url='https://www.xilinx.com/products/design-tools/embedded-software/petalinux-sdk.html'
license=('custom')
depends=('bzip2' 'ccache' 'chrpath' 'cpio' 'diffstat' 'diffutils' 'dos2unix' 'git' 'glib2' 'gnupg' 'inetutils' 'ncurses' 'ncurses5-compat-libs' 'net-tools' 'openssl' 'pax' 'perl' 'python-gitpython' 'python-jinja' 'python-pexpect' 'python-pip' 'python-pylint' 'screen' 'sdl' 'socat' 'unzip' 'wget' 'xterm' 'zlib')
options=('!strip')
install="$pkgname.install"
_plnxinstaller='petalinux-v2023.1-05012318-installer.run'
source=("local://$_plnxinstaller")
sha256sums=('22a314dfd36caa333425eb61d48ad0404e239c1689be593a771d4c03859e5d4b')

prepare() {
	PLNXINSTALLLER="$_plnxinstaller"
	INITSETUP=$(awk '/^##__INITSETUP__/ { print NR + 1; exit 0; }' "${PLNXINSTALLLER}")
	SKIP=$(awk '/^##__PLNXSDK_FOLLOWS__/ { print NR + 1; exit 0; }' "${PLNXINSTALLLER}")
	sed -n -e "$INITSETUP,$(($SKIP-2)) p" "${PLNXINSTALLLER}" > "initsetup.tar.xz"
	truncate -s -1 initsetup.tar.xz
	bsdtar -xf initsetup.tar.xz
}

package() {
	env -i \
		PLATFORMS='aarch64 arm microblaze' \
		PLNXCHECKSUM='ab14d397770da66f07e16728ca0ee208' \
		PLNXINSTALLDIR="$pkgdir/opt/$pkgname" \
		PLNXINSTALLLER="$_plnxinstaller" \
		./petalinux-install
	grep -rlFI "$pkgdir" "$pkgdir" | xargs sed -i "s!$pkgdir!!g"
	install -Dm644 Petalinux_EULA.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
