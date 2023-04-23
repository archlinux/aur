# Maintainer: Darvin Delgado <dnmodder at gmail dot com>
pkgname=ryujinx-git
pkgver=r2722.8d9d508dc
pkgrel=1
pkgdesc="Experimental Nintendo Switch Emulator written in C#"
arch=(x86_64)
url="https://github.com/Ryujinx/Ryujinx"
license=('MIT')
depends=('sh' 'glibc' 'zlib' 'hicolor-icon-theme' 'gcc-libs' 'libx11' 'fontconfig')
makedepends=('git')
provides=(Ryujinx)
conflicts=(Ryujinx)
install=ryujinx.install
source=(
	"git+$url"
	"ryujinx.install"
	"dotnet-sdk-linux-x64.tar.gz::https://dotnetcli.azureedge.net/dotnet/Sdk/7.0.203/dotnet-sdk-7.0.203-linux-x64.tar.gz")
md5sums=(
	'SKIP'
	'824e675295b3e9df5a7f8d9220c89c93'
	'7de32730b3a9f8c1de87282e8aec344b')
noextract=('dotnet-sdk-linux-x64.tar.gz')
options=(!strip)

pkgver() {
	cd "Ryujinx"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	export DOTNET_ROOT=$srcdir/dotnet
	export PATH=$PATH:$srcdir/dotnet
	mkdir -p "$DOTNET_ROOT" && tar zxf dotnet-sdk-linux-x64.tar.gz -C "$DOTNET_ROOT"

	cd "Ryujinx"

	dotnet publish -c Release -r linux-x64 -o ../publish -p:DebugType=embedded -p:ExtraDefineConstants="DISABLE_UPDATER%2CFORCE_EXTERNAL_BASE_DIR" Ryujinx --self-contained true
	dotnet publish -c Release -r linux-x64 -o ../publish_ava -p:DebugType=embedded -p:ExtraDefineConstants="DISABLE_UPDATER%2CFORCE_EXTERNAL_BASE_DIR" Ryujinx.Ava --self-contained true
}

package() {
	mkdir -p "$pkgdir/opt/ryujinx/"
	mkdir -p "$pkgdir/usr/bin/"

	install -D "Ryujinx/distribution/linux/Ryujinx.desktop" "$pkgdir/usr/share/applications/Ryujinx.desktop"
	install -D "Ryujinx/distribution/misc/Logo.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/Ryujinx.svg"

	cp -R "publish/"* "$pkgdir/opt/ryujinx/"
	cp -R "publish_ava/"* "$pkgdir/opt/ryujinx/"

	chmod +x "$pkgdir/opt/ryujinx/Ryujinx.sh"

	ln -s "/opt/ryujinx/Ryujinx" "$pkgdir/usr/bin/Ryujinx"
	ln -s "/opt/ryujinx/Ryujinx.sh" "$pkgdir/usr/bin/Ryujinx.sh"
}
