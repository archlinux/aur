# Maintainer: Alessandro Marchioro <marciozgaming@gmail.com>
pkgname=ryujinx-git
pkgver=r1831.7c5ead1c1
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
	'4e0e5e0b18cf3db5725b18319338d38c'
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
	mkdir -p "${pkgdir}/usr/bin/"

	install -D ryujinx.desktop "${pkgdir}/usr/share/applications/ryujinx.desktop"
	install -D ryujinx.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/ryujinx.png"

	cp -R ${srcdir}/Ryujinx/Ryujinx/bin/Release/net5.0/linux-x64/publish/* "${pkgdir}/opt/ryujinx/"
	ln -s "/opt/ryujinx/Ryujinx" "${pkgdir}/usr/bin/ryujinx"
}
