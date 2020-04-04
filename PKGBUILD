# Maintainer: Alessandro Marchioro <marciozgaming@gmail.com>
pkgname=ryujinx-git
pkgver=1.0.0
pkgrel=6
pkgdesc="Experimental Nintendo Switch Emulator written in C# - master branch"
arch=(x86_64)
url="https://github.com/Ryujinx/Ryujinx"
license=('MIT')
depends=(dotnet-runtime)
makedepends=(git dotnet-runtime dotnet-sdk)
optdepends=()
provides=(Ryujinx)
source=("git+$url")
md5sums=('SKIP')

build() {
	cd "Ryujinx"
	dotnet publish -c release
	chmod 775 Ryujinx/bin/Release/netcoreapp3.0/Ryujinx
}

package() {
	rm "$pkgdir/usr/bin/Ryujinx" 2&>/dev/null || true
	mkdir -p "$pkgdir/opt/ryujinx/"
	mkdir -p "$pkgdir/usr/bin/"
	cp -R Ryujinx/Ryujinx/bin/Release/netcoreapp3.0/* "$pkgdir/opt/ryujinx/"
	cd "$pkgdir/usr/bin/"
	ln -s "/opt/ryujinx/Ryujinx"
	mkdir -p "$pkgdir/opt/ryujinx/Logs"
	chmod -R 777 "$pkgdir/opt/ryujinx/Logs"

	# Adding desktop entry
	mkdir -p "$pkgdir/usr/share/applications/"
	echo "[Desktop Entry]
Type=Application
Encoding=UTF-8
Name=Ryujinx
Comment=Experimental Nintendo Switch Emulator written in C# - master branch
Exec=Ryujinx
Icon=/opt/ryujinx/Ryujinx.ico
Terminal=false" >> $pkgdir/usr/share/applications/ryujinx.desktop
	cd $pkgdir/opt/ryujinx/ && curl -O https://raw.githubusercontent.com/Ryujinx/Ryujinx/master/Ryujinx/Ryujinx.ico
}
