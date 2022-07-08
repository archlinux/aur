# Maintainer: Woshiluo Luo <woshiluo@woshiluo.site>

pkgname=bililive-recorder
_pkgname=bililive-recorder
provides=($_pkgname)
conflicts=($pkgname-bin)
pkgver=2.1.1
pkgrel=4
pkgdesc='B站录播姬 | BiliBili Stream Recorder | 哔哩哔哩直播录制'
arch=('x86_64')
# options=(staticlibs)
url='https://github.com/Bililive/BililiveRecorder'
license=('GPL3')
provides=("$_pkgname")
depends=(aspnet-runtime)
makedepends=(git dotnet-sdk nodejs npm)
source=(git+https://github.com/BililiveRecorder/BililiveRecorder)
sha256sums=('SKIP')

prepare() {
	cd BililiveRecorder

	git checkout v${pkgver}

	git submodule update --init --recursive
	./webui/build.sh

	dotnet publish -c Release BililiveRecorder.Cli/BililiveRecorder.Cli.csproj
}

package() {
	cd $srcdir/BililiveRecorder

	install -d $pkgdir/usr/lib/
	install -d $pkgdir/usr/bin/
	cp -ra BililiveRecorder.Cli/publish/any/Release/. $pkgdir/usr/lib/bililive-recorder
	ln -s /usr/lib/bililive-recorder/BililiveRecorder.Cli "$pkgdir/usr/bin/BililiveRecorder.Cli"
}
