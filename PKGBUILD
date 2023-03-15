# Maintainer: Darvin Delgado <dnmodder at gmail dot com>
pkgname=ryujinx-git
pkgver=r2660.da073fce6
pkgrel=1
pkgdesc="Experimental Nintendo Switch Emulator written in C#"
arch=(x86_64)
url="https://github.com/Ryujinx/Ryujinx"
license=('MIT')
depends=('dotnet-runtime-bin')
makedepends=('git' 'dotnet-sdk-bin')
provides=(Ryujinx)
install=ryujinx.install
source=(
	"git+${url}"
	"ryujinx.install")
md5sums=(
	'SKIP'
	'2a3637d0d4e7678473a9bd87f6acc8aa')
options=(!strip)

pkgver() {
	cd "${srcdir}/Ryujinx"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/Ryujinx"

	dotnet publish -c Release -r linux-x64 -p:DebugType=embedded Ryujinx --self-contained true
	dotnet publish -c Release -r linux-x64 -p:DebugType=embedded Ryujinx.Ava --self-contained true
}

package() {
	mkdir -p "${pkgdir}/opt/ryujinx/"
	mkdir -p -m 777 "${pkgdir}/opt/ryujinx/Logs"
	mkdir -p "${pkgdir}/usr/bin/"

	install -D "${srcdir}/Ryujinx/distribution/linux/Ryujinx.desktop" "${pkgdir}/usr/share/applications/Ryujinx.desktop"
	install -D "${srcdir}/Ryujinx/distribution/misc/Logo.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/Ryujinx.svg"
	install -D "${srcdir}/Ryujinx/distribution/linux/mime/Ryujinx.xml" "${pkgdir}/usr/share/mime/packages/Ryujinx.xml"

	cp -R ${srcdir}/Ryujinx/Ryujinx/bin/Release/net7.0/linux-x64/publish/* "${pkgdir}/opt/ryujinx/"
	cp -R ${srcdir}/Ryujinx/Ryujinx.Ava/bin/Release/net7.0/linux-x64/publish/* "${pkgdir}/opt/ryujinx/"

	ln -s "/opt/ryujinx/Ryujinx" "${pkgdir}/usr/bin/Ryujinx"
	ln -s "/opt/ryujinx/Ryujinx.Ava" "${pkgdir}/usr/bin/Ryujinx.Ava"
}
