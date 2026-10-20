# Maintainer: Koen Hendriks <info@koenhendriks.nl>

pkgname=lconnect-linux-bin
pkgver=2.0.11.4
pkgrel=1
pkgdesc="Unofficial Lian Li L-Connect 3 port: UNI FAN TL / TL LCD / SL Infinity fan speed, RGB and LCD control (prebuilt binaries)"
arch=('x86_64')
url="https://github.com/koenhendriks/lian-li-lconnect-linux"
license=('LicenseRef-L-Connect-derived')
provides=('lconnect-linux')
conflicts=('lconnect-linux')
depends=('dotnet-runtime-10.0' 'aspnet-runtime-10.0' 'hidapi' 'ffmpeg' 'systemd' 'fontconfig' 'libx11' 'libice' 'libsm')
optdepends=('nvidia-utils: NVIDIA GPU temperature/load for fan curves and sensor screens')
options=('!strip' '!debug')
install=lconnect.install
_src="lconnect-linux-$pkgver-linux-x64"
source=("$_src.tar.gz::$url/releases/download/v$pkgver/$_src.tar.gz")
sha256sums=('5564bdfdb61129632a37b12b2614472ed9cfd4e0d4d16780fdaaacba563985c9')

package() {
	cd "$_src"
	# Binaries and system files; tools/aur-pkgbuild.sh --bin points both into the release's binary tarball.
	local lib="$srcdir/$_src/lib" sys="$srcdir/$_src/system"

	install -dm755 "$pkgdir/usr/lib/lconnect"
	cp -a "$lib/." "$pkgdir/usr/lib/lconnect/"
	chmod 755 "$pkgdir/usr/lib/lconnect"
	chmod 755 "$pkgdir/usr/lib/lconnect/lconnectd" "$pkgdir/usr/lib/lconnect/lconnectctl" "$pkgdir/usr/lib/lconnect/lconnect-ui"

	install -dm755 "$pkgdir/usr/bin"
	ln -s /usr/lib/lconnect/lconnectctl "$pkgdir/usr/bin/lconnectctl"
	ln -s /usr/lib/lconnect/lconnect-ui "$pkgdir/usr/bin/lconnect-ui"

	install -Dm644 "$sys/lconnectd.service" "$pkgdir/usr/lib/systemd/system/lconnectd.service"
	install -Dm644 "$sys/lconnect.sysusers" "$pkgdir/usr/lib/sysusers.d/lconnect.conf"
	install -Dm644 "$sys/lconnect.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/lconnect.conf"
	install -Dm644 "$sys/60-lconnect.rules" "$pkgdir/usr/lib/udev/rules.d/60-lconnect.rules"
	install -Dm755 "$sys/lconnect.sleep" "$pkgdir/usr/lib/systemd/system-sleep/lconnect"
	install -Dm644 "$sys/lconnect-ui.desktop" "$pkgdir/usr/share/applications/lconnect-ui.desktop"
	install -Dm644 "$sys/lconnect-ui-autostart.desktop" "$pkgdir/etc/xdg/autostart/lconnect-ui.desktop"
	install -Dm644 README.md "$pkgdir/usr/share/doc/lconnect-linux/README.md"
}
