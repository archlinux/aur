# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

# check $srcdir/$_name-$pkgver/global.json for the dotnet (SDK and runtime) version required
_name=Ryujinx
pkgname=ryujinx
pkgver=1.1.1053
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
_sdkver=7.0.401
source=("$url/archive/$pkgver.tar.gz"
		"ryujinx.install"
		"https://dotnetcli.azureedge.net/dotnet/Sdk/$_sdkver/dotnet-sdk-$_sdkver-linux-x64.tar.gz")
b2sums=('ab397eef6703c21afcc6521a5855708d5016cab056515aec1a03be9830d6346e54ac1ae69c2ae1c3a32259926406fc45218c99060e6a74886cad3f21afb7cba8'
        '5e7013a31c2163a8baa71bfc36ef2da3d7580b31966abb13b54271f23f3eda9e591d56c7d448a6c18933e1f21560bbd4d3db62f38f2aae37220ffb4318edfe49'
        '69f1b10ffb3decdb81b99c08ecd3aeb8bed8415de1251e49d9cfe7cfe1d266e3a0807677bafd7e0be318c8ca5a70420fc911a9112e57b512114e7447e2eeccf1')

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
