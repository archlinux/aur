# Maintainer: Moabeat <moabeat@berlin.de>

pkgname=beaver-notes
pkgver=2.5.0
pkgrel=1
epoch=
pkgdesc="A privacy-focused, cross-platform note-taking application."
_electron=electron28
arch=('x86_64')
url="https://www.beavernotes.com/"
license=('MIT')
depends=("$_electron" 'nspr' 'libcups' 'mesa' 'libxshmfence' 'libxcomposite' 'libdrm' 'libxfixes' 'libxrandr' 'libxdamage' 'nss' 'hicolor-icon-theme' 'expat' 'libxcb' 'glibc' 'glib2' 'gcc-libs' 'libx11')
makedepends=('asar' 'npm' 'yarn' 'nodejs' 'imagemagick' 'libxcrypt-compat')
provides=('beaver-notes')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Daniele-rolli/Beaver-Notes/archive/refs/tags/$pkgver.tar.gz"
        "beaver-notes.desktop")
sha256sums=("33c419603fe88a164660adb8a37abca66433260e98008e030615e8bc615a407f"
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
	yarn run electron-builder --linux --"${!CARCH}" --dir \
		-c.electronDist=/usr/lib/"$_electron" \
		-c.electronVersion="$_ver"
	
	# Convert icon to standard conforming png format
	convert buildResources/icon.ico buildResources/icon.png
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
	
	# Install icon
	install -Dm 644 buildResources/icon-7.png "$pkgdir"/usr/share/icons/hicolor/256x256/apps/beaver-notes.png

	# Install license
	install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
