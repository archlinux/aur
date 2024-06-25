# Maintainer: Moabeat <moabeat@berlin.de>

pkgname=beaver-notes
pkgver=3.3.0
pkgrel=1
epoch=
pkgdesc="A privacy-focused, cross-platform note-taking application."
_electron=electron28
arch=('x86_64')
url="https://www.beavernotes.com/"
license=('MIT')
depends=("$_electron" 'hicolor-icon-theme')
makedepends=('asar' 'npm' 'yarn' 'nodejs' 'libxcrypt-compat')
provides=('beaver-notes')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Daniele-rolli/Beaver-Notes/archive/refs/tags/$pkgver.tar.gz"
        "beaver-notes.desktop")
sha256sums=("baa830f3fe71c3b49e26c9d932132c7d05ae1dd7c26118410190e13e45c8f314"
            "88c929e920a36084f5257c6d77eee2e75e6b27938c52205c55c25e08bfe89420")

prepare() {
    	_ver="$(</usr/lib/${_electron}/version)"
    	cd "Beaver-Notes-$pkgver"
    	yarn install
}

build() {
	cd "Beaver-Notes-$pkgver"

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
