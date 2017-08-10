# Maintainer: Declan Hoare <declanhoare at exemail dot com dot au>
pkgname=shiftos-git
pkgver=r1009.3138b57
pkgrel=1
pkgdesc="MonoGame hacking sim"
arch=('i686' 'x86_64')
url="https://getshiftos.net/"
license=('MIT')
depends=('mono' 'monogame' 'pangomm' 'cairomm')
makedepends=('git')
provides=('shiftos')
conflicts=('shiftos')
options=('!strip')
source=("shiftos::git+git://github.com/shiftos-game/ShiftOS.git")
md5sums=('SKIP')

pkgver()
{
	cd "${srcdir}/shiftos"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare()
{
	cd "${srcdir}/shiftos"
	git checkout origin/monogame-native # "#branch=" doesn't work, idk why
	./updatepackages.sh
}

build()
{
	cd "shiftos"
	xbuild /property:Configuration=Release
	cd "ShiftOSNative"
	make
}

package()
{
	mkdir -pv "${pkgdir}/usr/"{share/shiftos,bin,lib}
	cp -r "${srcdir}/shiftos/ShiftOS.Frontend/bin/DesktopGL/AnyCPU/Release/"* "${pkgdir}/usr/share/shiftos"
	if [ "$(uname -m)" = "x86_64" ]
	then
		cp "${srcdir}/shiftos/ShiftOSNative/x64/libShiftOSNative.so" "${pkgdir}/usr/lib"
	else
		cp "${srcdir}/shiftos/ShiftOSNative/x86/libShiftOSNative.so" "${pkgdir}/usr/lib"
	fi
	cat > "${pkgdir}/usr/bin/shiftos" << "EOF"
#!/bin/sh
cd /usr/share/shiftos
mono ShiftOS.Frontend.exe $@
EOF
	chmod +x "${pkgdir}/usr/bin/shiftos"
}
