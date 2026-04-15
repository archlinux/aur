# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=mesen
pkgver=2.1.1
pkgrel=4
pkgdesc="Multi-system emulator (NES, SNES, GB, GBA, PCE, SMS/GG, WS) for Windows, Linux and macOS"
arch=('x86_64')
url="https://github.com/SourMesen/Mesen2"
license=('GPL-3.0-or-later')
depends=(sdl2 fontconfig libevdev glibc libx11 libgcc libstdc++ zlib dotnet-runtime-8.0
	libxcb libxau libxdmcp freetype2 expat zlib bzip2 libpng brotli)
makedepends=(dotnet-sdk meson ninja clang lld zip unzip)
checkdepends=()
optdepends=()
provides=('mesen2')
conflicts=('mesen2')
install=$pkgname.install
options=(!lto !strip !debug)
source=("$url/archive/refs/tags/${pkgver}.tar.gz"
	"options.diff")
sha256sums=('ce845c15e9aba9a65557760bd24376767becf7232e9a03222ce85e0e608d7822'
            'd6ceccdcb13930d6f62fa4356113519798156b6bfd735e9667292ea0748a5898')

prepare() {
	cd "$srcdir"
	cd "${pkgname/m/M}2-$pkgver"
	patch -Np1 < "$srcdir/options.diff"
}

build() {
	cd "${pkgname/m/M}2-$pkgver"
	NUGET_PACKAGES="${srcdir}/.nuget" DOTNET_CLI_TELEMETRY_OPTOUT=true \
	CFLAGS+=" -fuse-ld=lld" CXXFLAGS+=" -fuse-ld=lld" SYSTEM_LIBEVDEV=true \
	STATICLINK=false USE_AOT=false make
}

package() {
	cd "${pkgname/m/M}2-$pkgver/bin/linux-x64/Release/linux-x64/publish"
	install -Dm755 Mesen "$pkgdir/usr/lib/$pkgname/Mesen"
	install -dm755 "$pkgdir/usr/bin"
	ln -s "/usr/lib/${pkgname}/Mesen" "$pkgdir/usr/bin/${pkgname}"
}
