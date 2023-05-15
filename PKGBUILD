# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

# check $srcdir/$_name-$pkgver/global.json for the dotnet (SDK and runtime) version required
_name=Ryujinx
pkgname=ryujinx
pkgver=1.1.800
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
source=("$url/archive/refs/tags/$pkgver.tar.gz"
		"ryujinx.install"
		"https://dotnetcli.azureedge.net/dotnet/Sdk/7.0.200/dotnet-sdk-7.0.200-linux-x64.tar.gz")
b2sums=('46b83f14c1081a6fddc3c1ff65da4880ad2a0eced6a619991a93feff4be35126b5259b0934378591097929ff8f3e13cb5bfafb2d0bf5f7ee39296bcd48ec2d20'
        '5e7013a31c2163a8baa71bfc36ef2da3d7580b31966abb13b54271f23f3eda9e591d56c7d448a6c18933e1f21560bbd4d3db62f38f2aae37220ffb4318edfe49'
        '100af2f1e3fda195542f383a449473b1e52a7c5c1ff40b3ee666305a883885e1440996be7e588d8ccad44702917cf8d5e87900a59d80b8a43f9ba76a8e602927')

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
