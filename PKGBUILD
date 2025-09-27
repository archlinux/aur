# Maintainer: Woshiluo Luo <woshiluo@woshiluo.site>

pkgname=bililive-recorder
_pkgname=bililive-recorder
provides=($_pkgname)
conflicts=($pkgname-bin)
pkgver=2.17.3
pkgrel=1
pkgdesc='B站录播姬 | BiliBili Stream Recorder | 哔哩哔哩直播录制'
arch=('x86_64')
# options=(staticlibs)
url='https://github.com/Bililive/BililiveRecorder'
license=('GPL3')
provides=("$_pkgname")
depends=(aspnet-runtime)
makedepends=(git dotnet-sdk nodejs npm)
source=(git+https://github.com/BililiveRecorder/BililiveRecorder#tag=v${pkgver})
sha256sums=('d194fbe2720087460dc0b8d7f8747b7b52177347e43b3178f3e265bc8919a88e')

prepare() {
	cd ${srcdir}/BililiveRecorder

	git submodule update --init --recursive
}

build() {
	cd ${srcdir}/BililiveRecorder

	./webui/build.sh
	dotnet publish -c Release BililiveRecorder.Cli/BililiveRecorder.Cli.csproj -r linux-x64
}

package() {
	cd $srcdir/BililiveRecorder

	install -d $pkgdir/usr/lib/
	install -d $pkgdir/usr/bin/
	cp -ra BililiveRecorder.Cli/publish/linux-x64/Release/. $pkgdir/usr/lib/bililive-recorder
	ln -s /usr/lib/bililive-recorder/BililiveRecorder.Cli "$pkgdir/usr/bin/BililiveRecorder.Cli"
}
