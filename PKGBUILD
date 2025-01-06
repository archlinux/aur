# Maintainer: Moabeat <moabeat@berlin.de>

pkgname=beaver-notes
pkgver=3.8.0
pkgrel=1
epoch=
pkgdesc="Your Personal Note-Taking Haven for Privacy and Efficiency"
_electron=electron31
arch=('x86_64')
url="https://www.beavernotes.com/"
license=('MIT')
depends=("$_electron" 'hicolor-icon-theme')
makedepends=('asar' 'npm' 'yarn' 'nodejs' 'libxcrypt-compat')
provides=('beaver-notes')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Daniele-rolli/Beaver-Notes/archive/refs/tags/$pkgver.tar.gz"
        "beaver-notes.desktop")
b2sums=('79a3086c5c50fee1e2cdad81bb878685cf41bc0a2370983b34fbff6a483ea3b4dd31cec0988c75aa0d4b4462a0c430541b1c1fbfd390b343e3803e6b76c9cdb8'
        'f8aa4e47ede5efc642c97fb30dd483c9e120b58f05964711c0c2bce831c90e0129f5c0ec544a47bcd769159eb1dadd79ccfe34311436e56208ac2af4567cab51')

prepare() {
    	_ver="$(</usr/lib/${_electron}/version)"
    	cd "Beaver-Notes-$pkgver"
    	yarn install
}

build() {
	cd "Beaver-Notes-$pkgver"

	# Set Mac specific environment varibale to dummy value
	export APPLE_TEAM_ID="none"

	# Build the application
	yarn build
	yarn electron-builder build \
		--config electron-builder.config.cjs \
		--linux deb $dist \
		-c.electronDist=/usr/lib/"$_electron" \
		-c.electronVersion="$_ver"
}
	

package() {
	cd "Beaver-Notes-$pkgver"

	local i686=linux-ia32-unpacked x86_64=linux-unpacked aarch64=linux-arm64-unpacked

	# Install wrapper
    	install -Dm755 /dev/null "${pkgdir}/usr/bin/$pkgname"
    	cat >>"${pkgdir}/usr/bin/$pkgname" <<EOD
#! /usr/bin/sh
exec $_electron /usr/lib/beaver-notes "\$@"
EOD

	# Copy full application to destiation directory
    	install -d "$pkgdir/usr/lib/$pkgname/"
    	asar e "dist/${!CARCH}/resources/app.asar" "$pkgdir/usr/lib/$pkgname/"
	
	# Remove unneccesary assets to prevent errors
	rm -rf "$pkgdir/usr/lib/$pkgname/.gitbook"

	# Install desktop file
	install -Dm 644 ../beaver-notes.desktop "$pkgdir"/usr/share/applications/beaver-notes.desktop
	
	# Install icons
  	for i in 32 64 128 256 512 1024; do
    		install -Dm644 "dist/.icon-set/icon-linux_${i}.png" \
      		"$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/$pkgname.png"
  	done

	# Install license
	install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
