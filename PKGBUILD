# Maintainer: bkacjios < blackops7799 at gmail dot com >

pkgname=inav-configurator-bin
pkgver=8.0.0
pkgrel=1
pkgdesc="Crossplatform configuration tool for the INAV flight control system"
arch=('x86_64' 'aarch64')
url="https://github.com/iNavFlight/inav-configurator"

source_x86_64=(https://github.com/iNavFlight/inav-configurator/releases/download/8.0.0/INAV-Configurator_linux_x64_8.0.0.zip)
sha256sums_x86_64=('f20f03d8b78ea641de057aad6c5c93da7cf1c7638f736600d573ba9d5680cee4')

source_aarch64=(https://github.com/iNavFlight/inav-configurator/releases/download/8.0.0/INAV-Configurator_linux_arm64_8.0.0.zip)
sha256sums_aarch64=('b008f0f1a5c57646d74c20e6d81681a6004cb3c7a2496da03e4be6a1e8d1c310')

provides=('inav-configurator')
conflicts=('inav-configurator')
options=(!strip)
license=('GPL-3.0-only')
install=inav-configurator.install

package() {
	mkdir -p "$pkgdir/opt/inav"
	mkdir -p "$pkgdir/usr/bin"

	# Determine the source folder based on the architecture
	local source_folder
	case "$CARCH" in
		x86_64)
			source_folder="INAV Configurator-linux-x64"
			;;
		aarch64)
			source_folder="INAV Configurator-linux-arm64"
			;;
		*)
			echo "Unsupported architecture: $CARCH"
			exit 1
			;;
	esac
	
	cp -dpr --no-preserve=ownership "$srcdir/$source_folder" "$pkgdir/opt/inav/inav-configurator"

	chmod 755 "$pkgdir/opt/inav/inav-configurator/"
	chmod +x "$pkgdir/opt/inav/inav-configurator/inav-configurator"
	chmod +x "$pkgdir/opt/inav/inav-configurator/chrome_crashpad_handler"

	install -Dm644 "$srcdir/$source_folder/resources/app/assets/linux/inav-configurator.desktop" "$pkgdir/usr/share/applications/inav-configurator.desktop"

	install -d "$pkgdir/usr/bin/"
	ln -s "/opt/inav/inav-configurator/inav-configurator" "$pkgdir/usr/bin/inav-configurator"
}