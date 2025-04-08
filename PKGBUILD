# Maintainer: bkacjios < blackops7799 at gmail dot com >

pkgname=inav-configurator-bin
pkgver=8.0.1
pkgrel=1
pkgdesc="Crossplatform configuration tool for the INAV flight control system"
arch=('x86_64' 'aarch64')
url="https://github.com/iNavFlight/inav-configurator"

source_x86_64=(https://github.com/iNavFlight/inav-configurator/releases/download/8.0.1/INAV-Configurator_linux_x64_8.0.1.zip)
sha256sums_x86_64=('7d980175ad6ed375749995e2ec4bf0c3b679445d9662e6f443c1c7111eef8c9d')

source_aarch64=(https://github.com/iNavFlight/inav-configurator/releases/download/8.0.1/INAV-Configurator_linux_arm64_8.0.1.zip)
sha256sums_aarch64=('d1f2e34ecf458ba91c9dd2d8254e489d0effb14f11a5b59349ae40bf790f2c61')

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