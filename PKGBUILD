# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=mesen
pkgver=2.1.1
pkgrel=3
pkgdesc="Multi-system emulator (NES, SNES, GB, GBA, PCE, SMS/GG, WS) for Windows, Linux and macOS"
arch=('x86_64')
url="https://github.com/SourMesen/Mesen2"
license=('GPL-3.0-or-later')
depends=(sdl2 fontconfig libevdev glibc libx11 gcc-libs zlib dotnet-runtime-8.0)
makedepends=(dotnet-sdk-8.0 meson ninja clang lld zip unzip)
checkdepends=()
optdepends=()
provides=('mesen2')
conflicts=('mesen2')
install=$pkgname.install
options=(!lto !strip !debug)
source=("$url/archive/refs/tags/${pkgver}.tar.gz"
	"options.diff")
sha256sums=('ce845c15e9aba9a65557760bd24376767becf7232e9a03222ce85e0e608d7822'
            'c97321bfec6748e8aed96340bcb6e49d35f204ae9c72afbcfadfca11aef80a31')

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
