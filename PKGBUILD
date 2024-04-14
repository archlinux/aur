# Maintainer: JacobTech <Jacob@JacobTech.com>
pkgname='luski-git'
pkgver=r37.77ec87d
pkgrel=2
pkgdesc="Simple open source chat app"
arch=('x86_64')
url="https://www.jacobtech.com/Luski"
license=('GPL-3.0-only')
depends=('bash')
makedepends=('git' 'dotnet-sdk' 'grep')
provides=('luski')
conflicts=('luski-bin' 'luski-contained-bin')
source=("luski-git::git+https://git.jacobtech.com/JacobTech.com/Luski.git#branch=main")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$pkgname/Luski"
	if dotnet nuget list source | grep -q 'https://nuget.jacobtech.com/v3/index.json'
	then
		echo "Package source found"
	else
		echo "Adding package source"
		dotnet nuget add source https://nuget.jacobtech.com/v3/index.json -n JacobTech
	fi
	dotnet build -c Release -r linux-x64 --no-self-contained
}

package() {
	cd "$pkgname/Luski/bin/Release/net8.0/linux-x64"

	install -dm 755 "$pkgdir"/usr/lib/luski
	install -dm 755 "$pkgdir"/usr/share/applications
	install -dm 755 "$pkgdir"/usr/bin

	cp -r * "$pkgdir"/usr/lib/luski/

	touch "$pkgdir"/usr/bin/luski.sh
	cd "$pkgdir"/usr/bin
	echo -n "#!/bin/sh
exec /usr/lib/luski/Luski \"\$@\"" >> "$pkgdir"/usr/bin/luski.sh
	ln -s luski.sh luski

	touch "$pkgdir/usr/share/applications/luski.desktop"
	cd "$pkgdir"/usr/share/applications
	echo -n "[Desktop Entry]
Name=Luski
Version=1.0
GenericName=Luski
Comment=Luski is a free opensource chat app
Exec=luski %f
Terminal=false
Type=Application" >> "$pkgdir/usr/share/applications/luski.desktop"

	
	chmod 755 "$pkgdir"/usr/bin/luski
	chmod 755 "$pkgdir"/usr/lib/luski/Luski
	chmod 755 "$pkgdir"/usr/bin/luski.sh
}
