# Maintainer: Jenrikku (JkKU)
pkgname=ctrstudio-git
pkgver=r494.d359eb8
pkgrel=1
pkgdesc="An editor for 3DS formats including BCH and BCRES."
arch=('x86_64')
url="https://github.com/MapStudioProject/CTR-Studio"
license=('MIT')
depends=('dotnet-runtime>=6.0' 'hicolor-icon-theme')
makedepends=('dotnet-sdk>=6.0' 'icoutils' 'git')
source=("git+https://github.com/MapStudioProject/CTR-Studio.git"
        "ctrstudio.desktop"
        "prepare.patch")
sha256sums=('SKIP'
            'b0eaaf5cd8ccf49b0fac1f3f2736817d8a581af3a2c8af5fefa1010bd7b831d7'
            '1e06e2a0cbf2a12f7697b10f28f3abf1997712a61d83e4d0186c3a1f70d02c5b')
options=(!strip !debug)

prepare() {
	cd "CTR-Studio"
	patch -Np1 -i ../prepare.patch
	git submodule update --init --recursive
}

pkgver() {
	cd "CTR-Studio"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "CTR-Studio"
	export DOTNET_CLI_TELEMETRY_OPTOUT=1
	icotool -x -o "$srcdir" "./CTR Studio/Icon.ico"
	dotnet publish -c Release -r linux-x64 -o "$srcdir/publish" "./CTR Studio"

	cd "$srcdir/publish/"
	rm *.pdb
	cp -r "$srcdir/CTR-Studio/Plugins/CtrLibrary/bin/Release/net6.0" "Plugins"
}

package() {
	install -d "$pkgdir/opt/ctrstudio/"
	install -d "$pkgdir/usr/bin/"

	cp -r publish/* "$pkgdir/opt/ctrstudio/"
	chmod -R 777 "$pkgdir/opt/ctrstudio/"

	install -D ctrstudio.desktop "$pkgdir/usr/share/applications/ctrstudio.desktop"
	install -D Icon_1_128x128x32.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/ctrstudio.png"

	ln -s "/opt/ctrstudio/CTR Studio" "$pkgdir/usr/bin/ctrstudio"
}
