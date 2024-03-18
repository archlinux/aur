# Maintainer: ppeb <ppeb@ppeb.me>
pkgname="fnb-git"
_pkgname=fnb
pkgver=0.1.0.r0.g5ac79b1
pkgrel=1
pkgdesc="Tool for packing and unpacking XNB files and managing .tmod file archives"
arch=('x86_64')
url="https://github.com/steviegt6/fnb"
license=('MIT')
depends=('dotnet-runtime-8.0' 'libdeflate' 'zlib')
makedepends=('dotnet-sdk-8.0' 'git')
# unified binary dotnet releases break when stripped see https://github.com/dotnet/runtime/issues/54947
options=('!strip' '!debug')
source=("git+https://github.com/steviegt6/fnb")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	export DOTNET_CLI_TELEMETRY_OPTOUT=1
	export DOTNET_NOLOGO=true

	cd "$srcdir/$_pkgname"
	dotnet publish ./src/Tomat.FNB/Tomat.FNB.csproj /p:PublishSingleFile=true /p:DebugType=None /p:DebugSymbols=false
}

package() {
	cd "$srcdir/$_pkgname"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	mkdir -p "$pkgdir/usr/bin/"
	cp -r ./src/Tomat.FNB/bin/Release/net8.0/linux-x64/publish/fnb "$pkgdir/usr/bin"
}
