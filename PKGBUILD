# Maintainer: Jenrikku (JkKU)
pkgname=autumn-git
pkgver=r298.dc10c6e
pkgrel=1
pkgdesc="A WIP 3D Land stage editor."
arch=('x86_64')
url="https://github.com/Jenrikku/Autumn"
license=('GPL-3.0-only')
depends=('dotnet-runtime>=8.0' 'hicolor-icon-theme')
makedepends=('dotnet-sdk-8.0' 'git')
source=("git+https://github.com/Jenrikku/Autumn.git"
        "autumn.desktop"
        "autumn.svg")
sha256sums=('SKIP'
            'b4aab3c4c51b1b4940ca8dcdc7eadca0a85be47f538a6b0bf1edf4486808bf25'
            '20e9908698469cdd00e397fe4b0858f854f6611589b5f935f6dc208b59530e98')
options=(!strip !debug)

prepare() {
	cd "Autumn"
	git submodule update --init --recursive
}

pkgver() {
	cd "Autumn"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "Autumn"
	export DOTNET_CLI_TELEMETRY_OPTOUT=1
	dotnet publish -c Release -r linux-x64 -o "$srcdir/publish" ./Autumn

	cd "$srcdir/publish/"
	mv "runtimes/linux-x64/native/libtinyfiledialogs.so" .
	rm -r runtimes/

	rm *.pdb
}

package() {
	install -d "$pkgdir/usr/share/autumn/"
	install -d "$pkgdir/usr/bin/"

	cp -R publish/* "$pkgdir/usr/share/autumn/"

	install -D autumn.desktop "$pkgdir/usr/share/applications/autumn.desktop"
	install -D autumn.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/autumn.svg"

	ln -s "/usr/share/autumn/Autumn" "$pkgdir/usr/bin/autumn"
}
