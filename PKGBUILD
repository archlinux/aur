# Maintainer: Laura Hausmann <laura@hausmann.dev>
pkgname='tgcli-git'
pkgver=0.2a.r0.g3a4cb9e
pkgrel=1
pkgdesc='A Telegram console client based on tdlib.'
arch=('x86_64')
url="https://gitlab.com/lhausmann/tgcli"
license=('MIT')
makedepends=('dotnet-sdk-bin')
install=
changelog=
options=('!strip')
source=("$pkgname"::'git+https://gitlab.com/lhausmann/tgcli.git#branch=master')
md5sums=('SKIP')

prepare() {
	cd "$srcdir/$pkgname"
	git submodule update --init --recursive
}

pkgver() {
	cd "$srcdir/$pkgname"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$pkgname"
	curl -Lo warp-packer https://github.com/dgiagio/warp/releases/download/v0.3.0/linux-x64.warp-packer && chmod +x warp-packer
	dotnet publish -c Release -r linux-x64
	./warp-packer --arch linux-x64 --input_dir telegram/bin/Release/netcoreapp3.1/linux-x64/publish --exec telegram --output tgcli.linux.run
	chmod +x tgcli.linux.run
}

package() {
	cd "$srcdir/$pkgname"
	mkdir -p $pkgdir/usr/bin
	cp tgcli.linux.run $pkgdir/usr/bin/tgcli
}

