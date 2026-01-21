# Maintainer: bkacjios < blackops7799 at gmail dot com >

pkgname=inav-configurator
pkgver=9.0.0
pkgrel=1
pkgdesc="Crossplatform configuration tool for the INAV flight control system"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/iNavFlight/inav-configurator"
source=(https://github.com/iNavFlight/inav-configurator/archive/9.0.0.zip)
sha256sums=('ae21d6ebb7262f909297c2641db7f7ac4339c8e5f79e1239db004bb7976874b7')
provides=('inav-configurator')
conflicts=('inav-configurator')
options=(!strip)
license=('GPL-3.0-only')
install=inav-configurator.install
makedepends=('npm' 'yarn')

build() {
	cd $pkgname-$pkgver
	yarn install

	# Package for our architecture
	case "$CARCH" in
		x86_64)
			npm run package -- --arch="x64"
			;;
		armv7h)
			npm run package -- --arch="armv7l"
			;;
		aarch64)
			npm run package -- --arch="arm64"
			;;
		*)
			echo "Unsupported architecture: $CARCH"
			exit 1
			;;
	esac
}

package() {
	# Determine the source folder based on the architecture
	local source_folder
	case "$CARCH" in
		x86_64)
			source_folder="INAV Configurator-linux-x64"
			;;
		armv7h)
			source_folder="INAV Configurator-linux-armv7l"
			;;
		aarch64)
			source_folder="INAV Configurator-linux-arm64"
			;;
		*)
			echo "Unsupported architecture: $CARCH"
			exit 1
			;;
	esac

	cd "$pkgname-$pkgver/out/$source_folder"
	
	install -d "$pkgdir/opt/inav/inav-configurator/"
	cp -r * "$pkgdir/opt/inav/inav-configurator/"

	install -Dm644 "$srcdir/$pkgname-$pkgver/assets/linux/inav-configurator.desktop" "$pkgdir/usr/share/applications/inav-configurator.desktop"

	install -d "$pkgdir/usr/bin/"
	ln -s "/opt/inav/inav-configurator/inav-configurator" "$pkgdir/usr/bin/inav-configurator"
}
