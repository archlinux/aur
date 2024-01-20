# Maintainer: bigshans <wo199710@hotmail.com>

_pkgname=beaver-notes
pkgname=beaver-notes-git
pkgver=r158.623be28
pkgrel=1
epoch=
pkgdesc="A privacy-focused, cross-platform note-taking application."
_electron=electron
arch=('x86_64')
url="https://www.beavernotes.com/"
license=('MIT')
depends=(electron)
conflicts=(beaver-notes beaver-notes-bin)
makedepends=('asar' 'npm' 'yarn' 'nodejs' 'imagemagick' 'libxcrypt-compat')
provides=('beaver-notes')
source=("git+https://github.com/Daniele-rolli/Beaver-Notes.git"
        "beaver-notes.desktop")
sha256sums=('SKIP'
            '4475ac27a250fd89667e0c7130863e666725c7f41a605df5a05889515b29cfb3')

pkgver() {
	cd "${srcdir}/Beaver-Notes"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "Beaver-Notes"

	# Build the application
	yarn install
	yarn build
	yarn electron-builder build --config electron-builder.config.cjs --linux dir --x64 --config.asar=true
	
	# Convert icon to standard conforming png format
	convert buildResources/icon.ico buildResources/icon.png
}

package() {
    cd "Beaver-Notes"
	install -dm 755 "$pkgdir"/usr/lib/$_pkgname
  asar extract ./dist/linux-unpacked/resources/app.asar ./dist/linux-unpacked/resources/app
  rm -rf ./dist/linux-unpacked/resources/app/node_modules
	# Copy full application to destiation directory
	cp -r --no-preserve=ownership --preserve=mode dist/linux-unpacked/resources/app "$pkgdir"/usr/lib/$_pkgname
	install -dm 755 "$pkgdir"/usr/bin
    echo '#!/bin/sh
exec electron /usr/lib/beaver-notes/app "$@"' >> "$pkgdir"/usr/bin/$_pkgname
  chmod +x "$pkgdir"/usr/bin/$_pkgname
	
	# Install desktop file
	install -Dm 644 ../beaver-notes.desktop "$pkgdir"/usr/share/applications/beaver-notes.desktop
	
	# Install icon
	install -Dm 644 buildResources/icon-7.png "$pkgdir"/usr/share/icons/hicolor/256x256/apps/beaver-notes.png

	# Install license
	install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
