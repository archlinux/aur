# Maintainer: Alessandro Marchioro <marciozgaming@gmail.com>
pkgname=ryujinx-git
pkgver=r1383.632a8415
pkgrel=1
pkgdesc="Experimental Nintendo Switch Emulator written in C# - master branch"
arch=(x86_64)
url="https://github.com/Ryujinx/Ryujinx"
license=('MIT')
depends=(dotnet-runtime-bin)
makedepends=(git 'dotnet-runtime-bin>=5' 'dotnet-sdk-bin>=5')
optdepends=()
provides=(Ryujinx)
source=("git+$url")
md5sums=('SKIP')

pkgver() {
       cd "Ryujinx"
       printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "Ryujinx"
	dotnet publish -c release
	chmod 775 Ryujinx/bin/Release/net5.0/publish
}

package() {
	rm "$pkgdir/usr/bin/Ryujinx" 2&>/dev/null || true
	mkdir -p "$pkgdir/opt/ryujinx/"
	mkdir -p "$pkgdir/usr/bin/"
	cp -R Ryujinx/Ryujinx/bin/Release/net5.0/publish/* "$pkgdir/opt/ryujinx/"
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
