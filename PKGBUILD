# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

# check $srcdir/$_name-$pkgver/global.json for the dotnet (SDK and runtime) version required
_name=Ryujinx
pkgname=ryujinx
pkgver=1.1.1151
pkgrel=1
pkgdesc="Experimental Nintendo Switch Emulator written in C#"
arch=(x86_64)
url="https://github.com/Ryujinx/Ryujinx"
license=('MIT')
depends=('dotnet-runtime-8.0')
makedepends=('dotnet-sdk-8.0')
options=(!strip)
install=ryujinx.install
source=("$url/archive/$pkgver.tar.gz"
		"ryujinx.install")
b2sums=('24ac908a648dafe368d2cac0baa2e35aaeb46b890deb70d69b4af701c02e3e5d502b75bb06af9c172d6e001abe2f52552383f549553b27f9fa2097c02f3cac95'
        '5e7013a31c2163a8baa71bfc36ef2da3d7580b31966abb13b54271f23f3eda9e591d56c7d448a6c18933e1f21560bbd4d3db62f38f2aae37220ffb4318edfe49')

build() {
	cd $_name-$pkgver

	export DOTNET_CLI_TELEMETRY_OPTOUT=1
	
	dotnet clean
	dotnet nuget locals all -c

	_args="-c Release \
		--nologo \
		-p:DebugType=embedded \
		-p:ExtraDefineConstants=DISABLE_UPDATER%2CFORCE_EXTERNAL_BASE_DIR \
		-p:Version=$pkgver \
		-r linux-x64 \
		--self-contained true"
	dotnet publish $_args -o publish     src/Ryujinx
	dotnet publish $_args -o publish_ava src/Ryujinx.Ava
}

package() {
	cd $_name-$pkgver

	mkdir -p "$pkgdir/opt/ryujinx"
	cp -R publish/*     "$pkgdir/opt/ryujinx/"
	cp -R publish_ava/* "$pkgdir/opt/ryujinx/"
	chmod 755 "$pkgdir/opt/ryujinx/Ryujinx"
	chmod 755 "$pkgdir/opt/ryujinx/Ryujinx.Ava"
	chmod +x  "$pkgdir/opt/ryujinx/Ryujinx.sh"

	install -dm755 "$pkgdir/usr/bin"
	ln -s "/opt/ryujinx/Ryujinx"     "$pkgdir/usr/bin/Ryujinx"
	ln -s "/opt/ryujinx/Ryujinx.Ava" "$pkgdir/usr/bin/Ryujinx.Ava"
	ln -s "/opt/ryujinx/Ryujinx.sh"  "$pkgdir/usr/bin/Ryujinx.sh"

	install -Dm644 distribution/linux/Ryujinx.desktop  "$pkgdir/usr/share/applications/Ryujinx.desktop"
	install -Dm644 distribution/misc/Logo.svg          "$pkgdir/usr/share/icons/hicolor/scalable/apps/Ryujinx.svg"
	install -Dm644 distribution/linux/mime/Ryujinx.xml "$pkgdir/usr/share/mime/packages/Ryujinx.xml"

	install -dm777 "$pkgdir/opt/ryujinx/Logs" # create writable logs directory
}
