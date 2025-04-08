# Maintainer: bkacjios < blackops7799 at gmail dot com >

pkgname=inav-configurator
pkgver=8.0.1
pkgrel=1
pkgdesc="Crossplatform configuration tool for the INAV flight control system"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/iNavFlight/inav-configurator"
source=(https://github.com/iNavFlight/inav-configurator/archive/8.0.1.zip)
sha256sums=('2f3ca880d4128a0b4608642b661360a9edbd80fecf8bb3fcbd79842f2b862fca')
provides=('inav-configurator')
conflicts=('inav-configurator')
options=(!strip)
license=('GPL-3.0-only')
install=inav-configurator.install
makedepends=('npm' 'yarn')

build() {
	cd $pkgname-$pkgver
	yarn install
	npm clean-install

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
