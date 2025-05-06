# Maintainer: brionical27 <brionical@proton.me>
pkgname=hedgemodmanager-git
pkgver=8.0.0.beta4.r20
pkgrel=1
pkgdesc="(UNOFFICIAL PACKAGE) Mod manager used to Mod games created with the Hedgehog Engine"
arch=(x86_64)
url="https://github.com/hedge-dev/HedgeModManager"
license=('MIT')
depends=('dotnet-runtime-8.0')
makedepends=('dotnet-sdk-8.0' 'git')
conflicts=('hedgemodmanager-bin')
changelog=
source=(
"hedgemodmanager::git+http://github.com/hedge-dev/HedgeModManager.git"

)
noextract=()
sha256sums=(SKIP)
validpgpkeys=()

pkgver() {
  cd $srcdir/hedgemodmanager
  git describe --long --abbrev=7 --tags | sed 's/\([^-]*\)-g.*/r\1/;s/-/./g'
}

# prepare() {}

build() {
	cd $srcdir/hedgemodmanager/Source/HedgeModManager
	dotnet build

	cd $srcdir/hedgemodmanager/Source/HedgeModManager.Console
	dotnet build

	cd $srcdir/hedgemodmanager/Source/HedgeModManager.UI
	dotnet build

	cd $srcdir/hedgemodmanager/Source/Libraries/HedgeModManager.CodeCompiler
	dotnet build

	cd $srcdir/hedgemodmanager/Source/Libraries/HedgeModManager.CoreLib
	dotnet build
	
	cd $srcdir/hedgemodmanager/Source/Libraries/HedgeModManager.Diagnostics
	dotnet build
	
	cd $srcdir/hedgemodmanager/Source/Libraries/HedgeModManager.Epic
	dotnet build

	cd $srcdir/hedgemodmanager/Source/Libraries/HedgeModManager.Foundation
	dotnet build

	cd $srcdir/hedgemodmanager/Source/Libraries/HedgeModManager.Steam
	dotnet build

	cd $srcdir/hedgemodmanager/Source/Libraries/HedgeModManager.Text
	dotnet build
}

# check() {}

package() {


	mkdir $pkgdir/opt
	mkdir $pkgdir/opt/HedgeModManager
	mkdir $pkgdir/usr
	mkdir $pkgdir/usr/bin
	mkdir $pkgdir/usr/share
	mkdir $pkgdir/usr/share/applications
	mkdir $pkgdir/usr/share/icons
	mkdir $pkgdir/usr/share/icons/hicolor
	mkdir $pkgdir/usr/share/icons/hicolor/256x256
	mkdir $pkgdir/usr/share/icons/hicolor/256x256/apps

	mv $srcdir/hedgemodmanager/flatpak/hedgemodmanager.png $pkgdir/usr/share/icons/hicolor/256x256/apps/io.github.hedge_dev.hedgemodmanager.png


	cd $srcdir/hedgemodmanager/Source/HedgeModManager/bin/Debug/net8.0
	cp -r * $pkgdir/opt/HedgeModManager
	
	cd $srcdir/hedgemodmanager/Source/HedgeModManager.Console/bin/Debug/net8.0/
	cp -r * $pkgdir/opt/HedgeModManager
	
	cd $srcdir/hedgemodmanager/Source/HedgeModManager.UI/bin/Debug/net8.0/
	cp -r * $pkgdir/opt/HedgeModManager

	cd $srcdir/hedgemodmanager/Source/Libraries/HedgeModManager.CodeCompiler/bin/Debug/netstandard2.0/
	cp -r * $pkgdir/opt/HedgeModManager

	cd $srcdir/hedgemodmanager/Source/Libraries/HedgeModManager.CoreLib/bin/Debug/netstandard1.0/
	cp -r * $pkgdir/opt/HedgeModManager

	cd $srcdir/hedgemodmanager/Source/Libraries/HedgeModManager.Diagnostics/bin/Debug/netstandard1.0/
	cp -r * $pkgdir/opt/HedgeModManager

	cd $srcdir/hedgemodmanager/Source/Libraries/HedgeModManager.Epic/bin/Debug/net8.0/
	cp -r * $pkgdir/opt/HedgeModManager

	cd $srcdir/hedgemodmanager/Source/Libraries/HedgeModManager.Foundation/bin/Debug/net8.0/
	cp -r * $pkgdir/opt/HedgeModManager

	cd $srcdir/hedgemodmanager/Source/Libraries/HedgeModManager.Steam/bin/Debug/net8.0/
	cp -r * $pkgdir/opt/HedgeModManager

	cd $srcdir/hedgemodmanager/Source/Libraries/HedgeModManager.Text/bin/Debug/net6.0/
	cp -r * $pkgdir/opt/HedgeModManager


 echo "
 #!/usr/bin/sh
 exec /opt/HedgeModManager/HedgeModManager.UI" >>"$pkgdir/usr/bin/hedgemodmanager"

 chmod +x "$pkgdir/usr/bin/hedgemodmanager"


	echo "[Desktop Entry]
	Name=Hedge Mod Manager
	Exec=/opt/HedgeModManager/HedgeModManager.UI %u
	GenericName=Configure mods for various Hedgehog Engine games
	Path=/opt/HedgeModManager
	Type=Application
	Icon=io.github.hedge_dev.hedgemodmanager
	Categories=Game;
	Keywords=hedgehog;mod;loader;manager;sonic
	MimeType=x-scheme-handler/hedgemm;x-scheme-handler/hedgemmswa;x-scheme-handler/hedgemmgens;x-scheme-handler/hedgemmlw;x-scheme-handler/hedgemmforces;x-scheme-handler/hedgemmtenpex;x-scheme-handler/hedgemmmusashi;x-scheme-handler/hedgemmrainbow;x-scheme-handler/hedgemmhite;x-scheme-handler/hedgemmrangers;x-scheme-handler/hedgemmmillersonic;x-scheme-handler/hedgemmmillershadow" >>"$pkgdir/usr/share/applications/hedgemodmanager.desktop"
}
