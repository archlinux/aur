# Maintainer: DelightedCat <bottledlactose@gmail.com>

pkgname=mgcb-editor-git
pkgver=3.8.0
pkgrel=3
pkgdesc="Creates platform specific content files."
arch=('x86_64')
url="https://www.monogame.net/"
license=('custom')
depends=("dotnet-runtime-5.0")
makedepends=('dotnet-sdk-3.1' 'dotnet-sdk-5.0')

prepare() {
	# Using the "official" way of including a source does not work for MonoGame...
	# The workaround is to clone the repository in prepare()
	if [ ! -d $srcdir/MonoGame ]; then
		git clone --recursive https://github.com/MonoGame/MonoGame.git
	else
		cd $srcdir/MonoGame
		git submodule update
	fi

	cd $srcdir/MonoGame
	git reset --hard

	# Apply the patch to make sure the tool will pick up the mgcb.dll file
	git apply ../../mgcb-search-path.diff
}

build() {
	cd $srcdir/MonoGame
	dotnet tool restore
	dotnet cake
}

package() {
	cd $srcdir/MonoGame/Artifacts/MonoGame.Content.Builder.Editor.Launcher/Release/publish

	# Copy the binary output to the right directory
	mkdir -p $pkgdir/opt/mgcb-editor
	cp -r * $pkgdir/opt/mgcb-editor

	# Copy the .desktop file to the right location
	mkdir -p $pkgdir/usr/share/applications/
	cp $pkgdir/opt/mgcb-editor/mgcb-editor-linux/mgcb-editor.desktop $pkgdir/usr/share/applications/

	# Replace the .desktop placeholders to the correct binary
	sed -i 's/{Exec}/\/opt\/mgcb-editor\/mgcb-editor/' $pkgdir/usr/share/applications/mgcb-editor.desktop
	sed -i 's/{TryExec}/\/opt\/mgcb-editor\/mgcb-editor/' $pkgdir/usr/share/applications/mgcb-editor.desktop

	# Copy the icon file to /usr/share
	mkdir -p $pkgdir/usr/share/icons
	cp $pkgdir/opt/mgcb-editor/mgcb-editor-linux/monogame.svg $pkgdir/usr/share/icons

	# Copy the mime type definition to /usr/share
	mkdir -p $pkgdir/usr/share/mime/text
	cp $pkgdir/opt/mgcb-editor/mgcb-editor-linux/x-mgcb.xml $pkgdir/usr/share/mime/text

	cd $srcdir/MonoGame/Artifacts/MonoGame.Content.Builder/Release/publish

	# Copy the mgcb binaries to the correct location
	mkdir -p $pkgdir/opt/mgcb-editor/mgcb
	cp -r * $pkgdir/opt/mgcb-editor/mgcb
}
