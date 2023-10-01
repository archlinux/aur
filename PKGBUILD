# Maintainer: Darvin Delgado <dnmodder at gmail dot com>
_sdkver=7.0.306
pkgname=ryujinx-git
pkgver=r3053.651e24fed
pkgrel=1
pkgdesc="Experimental Nintendo Switch Emulator written in C#"
arch=(x86_64)
url="https://github.com/Ryujinx/Ryujinx"
license=('MIT')
depends=('sh' 'glibc' 'zlib' 'hicolor-icon-theme' 'gcc-libs' 'libx11' 'fontconfig')
makedepends=('git' 'desktop-file-utils')
provides=(Ryujinx)
conflicts=(Ryujinx)
install=ryujinx.install
source=(
	"git+$url"
	"ryujinx.install"
	"https://dotnetcli.azureedge.net/dotnet/Sdk/$_sdkver/dotnet-sdk-$_sdkver-linux-x64.tar.gz")
md5sums=(
	'SKIP'
	'824e675295b3e9df5a7f8d9220c89c93'
	'e3d9ad4b7a18c94884cd7d7e9bf6cab8')
noextract=("dotnet-sdk-$_sdkver-linux-x64.tar.gz")
options=(!strip)

pkgver() {
	cd "Ryujinx"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	export DOTNET_ROOT=$srcdir/dotnet
	mkdir -p "$DOTNET_ROOT" && tar zxf dotnet-sdk-$_sdkver-linux-x64.tar.gz -C "$DOTNET_ROOT"

	cd "Ryujinx"

	_args="-c Release -r linux-x64 -p:Version=$(git describe --tags) -p:DebugType=embedded -p:ExtraDefineConstants=DISABLE_UPDATER%2CFORCE_EXTERNAL_BASE_DIR"

	$DOTNET_ROOT/dotnet publish $_args -o ../publish --self-contained src/Ryujinx
	$DOTNET_ROOT/dotnet publish $_args -o ../publish_ava --self-contained src/Ryujinx.Ava
}

package() {
	mkdir -p "$pkgdir/opt/ryujinx/"
	mkdir -p "$pkgdir/usr/bin/"

	install -D "Ryujinx/distribution/linux/Ryujinx.desktop" "$pkgdir/usr/share/applications/ryujinx.desktop"
	install -D "Ryujinx/distribution/misc/Logo.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/ryujinx.svg"

	cp -R "publish/"* "$pkgdir/opt/ryujinx/"
	cp -R "publish_ava/"* "$pkgdir/opt/ryujinx/"

	chmod +x "$pkgdir/opt/ryujinx/Ryujinx.sh"

	ln -s "/opt/ryujinx/Ryujinx.sh" "$pkgdir/usr/bin/ryujinx"
	desktop-file-edit --set-key="Exec" --set-value="ryujinx %f" "$pkgdir/usr/share/applications/ryujinx.desktop"
	desktop-file-edit --set-icon="ryujinx" "$pkgdir/usr/share/applications/ryujinx.desktop"
}
