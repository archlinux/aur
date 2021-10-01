# Maintainer: Darvin Delgado <dnmodder at gmail dot com>
pkgname=ryujinx-git
pkgver=r1842.d92fff541
pkgrel=1
pkgdesc="Experimental Nintendo Switch Emulator written in C#"
arch=(x86_64)
url="https://github.com/Ryujinx/Ryujinx"
license=('MIT')
depends=('dotnet-runtime')
makedepends=('git' 'dotnet-sdk>=5')
provides=(Ryujinx)
install=ryujinx.install
source=(
	"git+${url}"
	"ryujinx.install"
	"ryujinx.desktop"
	"ryujinx.png")
md5sums=(
	'SKIP'
	'2a3637d0d4e7678473a9bd87f6acc8aa'
	'5bc1b579cccd891aadc7a73d3eab3791'
	'30138087aab7dcec30bdc4739617f000')
options=(!strip)

pkgver() {
	cd "${srcdir}/Ryujinx"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/Ryujinx"

	dotnet publish -c Release -r linux-x64 /p:DebugType=embedded
}

package() {
	mkdir -p "${pkgdir}/opt/ryujinx/"
	mkdir -p -m 777 "${pkgdir}/opt/ryujinx/Logs"
	mkdir -p "${pkgdir}/usr/bin/"

	install -D ryujinx.desktop "${pkgdir}/usr/share/applications/ryujinx.desktop"
	install -D ryujinx.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/ryujinx.png"

	cp -R ${srcdir}/Ryujinx/Ryujinx/bin/Release/net5.0/linux-x64/publish/* "${pkgdir}/opt/ryujinx/"
	ln -s "/opt/ryujinx/Ryujinx" "${pkgdir}/usr/bin/ryujinx"
}
