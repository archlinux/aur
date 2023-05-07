# Maintainer: Alex Henrie <alexhenrie24@gmail.com>
pkgname=petalinux
pkgver=2022.2
pkgrel=1
pkgdesc='Toolchain and SDK for Xilinx embedded Linux'
arch=('x86_64')
url='https://www.xilinx.com/products/design-tools/embedded-software/petalinux-sdk.html'
license=('custom')
depends=('bzip2' 'ccache' 'chrpath' 'cpio' 'diffstat' 'diffutils' 'dos2unix' 'git' 'glib2' 'gnupg' 'ncurses' 'ncurses5-compat-libs' 'net-tools' 'openssl' 'pax' 'perl' 'python-gitpython' 'python-jinja' 'python-pexpect' 'python-pip' 'python-pylint' 'screen' 'sdl' 'socat' 'unzip' 'wget' 'xterm' 'zlib')
options=('!strip')
install="$pkgname.install"
_plnxinstaller="petalinux-v2022.2-10141622-installer.run"
source=("local://$_plnxinstaller")
sha256sums=('4b8ff9128c991c757c55266b09eb2e83d2e420c2830159c6a081806dca3a3197')

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
		PLNXCHECKSUM='f82a77399c118da90098868fa7edd7f9' \
		PLNXINSTALLDIR="$pkgdir/opt/$pkgname" \
		PLNXINSTALLLER="$_plnxinstaller" \
		./petalinux-install
	grep -rlFI "$pkgdir" "$pkgdir" | xargs sed -i "s!$pkgdir!!g"
	install -Dm644 Petalinux_EULA.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
