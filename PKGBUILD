# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

# check $srcdir/$_name-$pkgver/global.json for the dotnet (SDK and runtime) version required
_name=Ryujinx
pkgname=ryujinx
pkgver=1.1.1010
pkgrel=1
pkgdesc="Experimental Nintendo Switch Emulator written in C#"
arch=(x86_64)
url="https://github.com/Ryujinx/Ryujinx"
license=('MIT')
depends=('dotnet-runtime-bin')
makedepends=('git')
provides=($_name)
conflicts=(ryujinx-git)
options=(!strip)
install=ryujinx.install
source=("$url/archive/$pkgver.tar.gz"
		"ryujinx.install"
		"https://dotnetcli.azureedge.net/dotnet/Sdk/7.0.306/dotnet-sdk-7.0.306-linux-x64.tar.gz")
b2sums=('e4c7169b9ae88e148137651a1970babf3821784a3690548d0e75038358db983a4183e4cfc8f39f3711378bb7e071468410a0d3ebfee5f5e2a83fc7325ca6929c'
        '5e7013a31c2163a8baa71bfc36ef2da3d7580b31966abb13b54271f23f3eda9e591d56c7d448a6c18933e1f21560bbd4d3db62f38f2aae37220ffb4318edfe49'
        '540564f7d97f3341fb2ea7e90a2dc0ae4b66eb95dea0acd37a1fb53e9b5b151d7e42c0effd61902ed5c0812ad48364d0419c18c0ac3659c7bd3331f2a3a5cce2')

build() {
	cd $_name-$pkgver

	export PATH="$srcdir:$PATH"
	export DOTNET_CLI_TELEMETRY_OPTOUT=1

	_args="-c Release                           \
		--nologo                                \
		-p:DebugType=embedded                   \
		-p:ExtraDefineConstants=DISABLE_UPDATER \
		-p:Version=$pkgver                      \
		-r linux-x64                            \
		--self-contained true"
	dotnet publish $_args src/Ryujinx
	dotnet publish $_args src/Ryujinx.Ava
}

package() {
	cd $_name-$pkgver

	mkdir -p "$pkgdir/opt/ryujinx"
	cp -R src/Ryujinx/bin/Release/net7.0/linux-x64/publish/*     "$pkgdir/opt/ryujinx/"
	cp -R src/Ryujinx.Ava/bin/Release/net7.0/linux-x64/publish/* "$pkgdir/opt/ryujinx/"
	chmod 755 "$pkgdir/opt/ryujinx/Ryujinx"
	chmod 755 "$pkgdir/opt/ryujinx/Ryujinx.Ava"
	chmod +x  "$pkgdir/opt/ryujinx/Ryujinx.sh"

	install -dm755 "$pkgdir/usr/bin"
	ln -s "/opt/ryujinx/Ryujinx"     "$pkgdir/usr/bin/Ryujinx"
	ln -s "/opt/ryujinx/Ryujinx.Ava" "$pkgdir/usr/bin/Ryujinx.Ava"
	ln -s "/opt/ryujinx/Ryujinx.sh"  "$pkgdir/usr/bin/Ryujinx.sh"

	install -Dm644 distribution/linux/Ryujinx.desktop  "$pkgdir/usr/share/applications/ryujinx.desktop"
	install -Dm644 distribution/misc/Logo.svg          "$pkgdir/usr/share/icons/hicolor/scalable/apps/ryujinx.svg"
	install -Dm644 distribution/linux/mime/Ryujinx.xml "$pkgdir/usr/share/mime/packages/ryujinx.xml"

	install -dm777 "$pkgdir/opt/ryujinx/Logs" # create writable logs directory
}
