# Maintainer: Ian Lansdowne <idlansdowneatgmailcom>
# Contributor: Jack Rubacha <rubacha.jack03@gmail.com>
# Contributor: Edward Wawrzynek <edward@wawrzynek.com>

pkgname=xrcsimulator
pkgver=13.1c
pkgdesc="FIRST Tech Challenge, FIRST Robotics Competition, and VEX Simulator"
pkgrel=1
arch=('x86_64')
url="https://xrcsimulator.org"
license=('unknown')
depends=("zlib" 
	 "bash")
optdepends=('openvr: For VR support')
makedepends=('gendesk')
replaces=('ftcfrcsimulator')

# Base name of files in the zip
_files_name="xRC Simulator"

source=(
	"${pkgname}-${pkgver}.zip::https://xrcsimulator.org/?sdm_process_download=1&download_id=2279"
)

sha1sums=('c99c4af06c2e200788552bca0dc31e10fc2b950a')

prepare() {
	gendesk -n -f --pkgname "$pkgname" --pkgdesc "$pkgdesc" --name="XRC Simulator" --categories="Education;Game"
}

package() {
	mkdir -p "$pkgdir/usr/share/xrcsimulator" "$pkgdir/usr/bin"

	# Copy data to /usr/share, set directory permissions to 755, file permissions to 644
	cp -r . "$pkgdir/usr/share/xrcsimulator/"
	chmod -R u+rwX,go+rX,go-w "$pkgdir/usr/share/xrcsimulator"
	chmod 755 "$pkgdir/usr/share/xrcsimulator/$_files_name.x86_64"
	chmod 755 "$pkgdir/usr/share/xrcsimulator/UnityPlayer.so"

	# Create soft link to binary
	ln -s "/usr/share/xrcsimulator/$_files_name.x86_64" "$pkgdir/usr/bin/xrcsimulator"

	# Desktop Entry
	install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

	# Logo
	install -Dm644 "${_files_name}_Data/Resources/UnityPlayer.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
