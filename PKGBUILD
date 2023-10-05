# Maintainer: Moabeat <moabeat@berlin.de>

pkgname=beaver-notes
pkgver=1.0.0
pkgrel=1
epoch=
pkgdesc="A privacy-focused, cross-platform note-taking application."
_electron=electron13
arch=('x86_64')
url="https://www.beavernotes.com/"
license=('MIT')
depends=('libdbus-1.so' 'libatk-bridge-2.0.so' 'libatk-1.0.so' 'libgdk_pixbuf-2.0.so' 'libatspi.so' 'libxkbcommon.so' 'libcairo.so' 'libgdk-3.so' 'libpango-1.0.so' 'libasound.so' 'libgtk-3.so' 'nspr' 'libcups' 'mesa' 'libxshmfence' 'libxcomposite' 'libdrm' 'libxfixes' 'libxrandr' 'libxdamage' 'nss' 'hicolor-icon-theme' 'expat' 'libxcb' 'glibc' 'glib2' 'gcc-libs' 'libx11')
makedepends=('npm' 'yarn' 'nodejs' 'imagemagick' 'libxcrypt-compat')
provides=('beaver-notes')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Daniele-rolli/Beaver-Notes/archive/refs/tags/$pkgver.tar.gz"
        "beaver-notes.desktop"
	"beaver-notes-arch.patch")
sha256sums=("1d3ff72a47160b0baa3701d16cc993d32458ba117e6a4870f64c91ecd6db8080"
            "988dc1020793d118dd2dc20745881ee6f4db221c61be503dc762f0d43318dfee"
            "5e318eb95c555c0f6c7c700e41b37758af3fc6c8c4c4926f9fc3c0bc8602c685")

prepare() {
	cd "Beaver-Notes-$pkgver"

	# Patch electron-builder-config.js to build into a directory
	patch -p0 < ../beaver-notes-arch.patch
}

build() {
	cd "Beaver-Notes-$pkgver"

	# Build the application
	yarn install
	yarn compile
	yarn electron-builder build --config electron-builder.config.js --linux --x64
	
	# Convert icon to standard conforming png format
	convert buildResources/icon.ico buildResources/icon.png

	# Remove unneccesary unpacked app
	rm -rf dist/linux-unpacked/resources/app.asar.unpacked
}

package() {
	cd "Beaver-Notes-$pkgver"
	
	# Copy full application to destiation directory
	install -dm 755 "$pkgdir"/opt/$pkgname
	cp -r --no-preserve=ownership --preserve=mode dist/linux-unpacked/* "$pkgdir"/opt/$pkgname/
	
	# Install desktop file
	install -Dm 644 ../beaver-notes.desktop "$pkgdir"/usr/share/applications/beaver-notes.desktop
	
	# Install icon
	install -Dm 644 buildResources/icon.png "$pkgdir"/usr/share/icons/hicolor/256x256/apps/beaver-notes.png

	# Install license
	install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
