# Maintainer: bigshans <wo199710@hotmail.com>

_pkgname=beaver-notes
pkgname=beaver-notes-git
pkgver=r646.36b2cef
pkgrel=1
epoch=
pkgdesc="A privacy-focused, cross-platform note-taking application."
_electron=electron
arch=('x86_64')
url="https://www.beavernotes.com/"
license=('MIT')
depends=(${_electron})
conflicts=(beaver-notes beaver-notes-bin)
makedepends=('asar' 'npm' 'yarn' 'nodejs' 'imagemagick' 'libxcrypt-compat')
provides=('beaver-notes')
source=("git+https://github.com/Beaver-Notes/Beaver-Notes.git#branch=development"
        "electron-builder.config-2.cjs"
        "beaver-notes.desktop")
sha256sums=('SKIP'
            '0312f51fc1b41cfeedd354c5b4c2e492b464d10f631654a6e2dbcbd4ad545fe4'
            '4475ac27a250fd89667e0c7130863e666725c7f41a605df5a05889515b29cfb3')

pkgver() {
	cd "${srcdir}/Beaver-Notes"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "Beaver-Notes"
  cp ../electron-builder.config-2.cjs .

	# Build the application
	yarn install
	yarn build
	yarn electron-builder build --config electron-builder.config-2.cjs --linux dir --x64 --config.asar=true
	
	# Convert icon to standard conforming png format
	convert buildResources/icon.ico buildResources/icon.png
}

package() {
    cd "Beaver-Notes"
	install -dm 755 "$pkgdir"/usr/lib/$_pkgname
  asar extract ./dist/linux-unpacked/resources/app.asar ./dist/linux-unpacked/resources/app
	# Copy full application to destiation directory
	cp -r --no-preserve=ownership --preserve=mode dist/linux-unpacked/resources/app "$pkgdir"/usr/lib/$_pkgname
	install -dm 755 "$pkgdir"/usr/bin
	cat >>"$pkgdir"/usr/bin/$_pkgname << EOD
#!/bin/sh
exec ${_electron} /usr/lib/beaver-notes/app "\$@"
EOD
  chmod +x "$pkgdir"/usr/bin/$_pkgname
	
	# Install desktop file
	install -Dm 644 ../beaver-notes.desktop "$pkgdir"/usr/share/applications/beaver-notes.desktop
	
	# Install icon
	install -Dm 644 buildResources/icon-7.png "$pkgdir"/usr/share/icons/hicolor/256x256/apps/beaver-notes.png

	# Install license
	install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
