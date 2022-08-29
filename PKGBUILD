# Maintainer: Alex Henrie <alexhenrie24@gmail.com>
pkgname=petalinux
pkgver=2022.1
pkgrel=1
pkgdesc='Toolchain and SDK for Xilinx embedded Linux'
arch=('x86_64')
url='https://www.xilinx.com/products/design-tools/embedded-software/petalinux-sdk.html'
license=('custom')
depends=('bzip2' 'ccache' 'chrpath' 'cpio' 'diffstat' 'diffutils' 'dos2unix' 'git' 'glib2' 'gnupg' 'ncurses' 'ncurses5-compat-libs' 'net-tools' 'openssl' 'pax' 'perl' 'python-gitpython' 'python-jinja' 'python-pexpect' 'python-pip' 'python-pylint' 'screen' 'sdl' 'socat' 'unzip' 'wget' 'xterm' 'zlib')
options=('!strip')
install="$pkgname.install"
_plnxinstaller="petalinux-v2022.1-04191534-installer.run"
source=("local://$_plnxinstaller")
sha256sums=('8a61188caa4ed035db70b3233decd761baf25b5773dd1a56a8c6ad2ded96ceec')

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
		PLNXCHECKSUM='37033df5cf15b077eb17d5158105d534' \
		PLNXINSTALLDIR="$pkgdir/opt/$pkgname" \
		PLNXINSTALLLER="$_plnxinstaller" \
		./petalinux-install
	grep -rlFI "$pkgdir" "$pkgdir" | xargs sed -i "s!$pkgdir!!g"
	install -Dm644 Petalinux_EULA.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
