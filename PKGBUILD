# Maintainer: bkacjios < blackops7799 at gmail dot com >

pkgname=inav-configurator-bin
pkgver=9.0.0
pkgrel=1
pkgdesc="Crossplatform configuration tool for the INAV flight control system"
arch=('x86_64' 'aarch64')
url="https://github.com/iNavFlight/inav-configurator"

source_x86_64=(https://github.com/iNavFlight/inav-configurator/releases/download/9.0.0/INAV-Configurator_linux_x64_9.0.0.zip)
sha256sums_x86_64=('9f9e90134649dac94bd1665b9c1976a448005280ccba1e3aee05adf9e4706bd7')

source_aarch64=(https://github.com/iNavFlight/inav-configurator/releases/download/9.0.0/INAV-Configurator_linux_arm64_9.0.0.zip)
sha256sums_aarch64=('5bea0169b8d79bfd1df1d31f87bb1ed9768a2fc51ffbae9725173a1be10f9924')

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