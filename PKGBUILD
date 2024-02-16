# Maintainer: Jenrikku (JkKU)
pkgname=autumn-git
pkgver=r186.17c8787
pkgrel=1
pkgdesc="A WIP 3D Land stage editor."
arch=('x86_64')
url="https://github.com/Jenrikku/Autumn"
license=('GPL3')
depends=('dotnet-runtime-8.0')
makedepends=('dotnet-sdk-8.0' 'git')
source=("git+https://github.com/Jenrikku/Autumn.git")
sha256sums=('SKIP')
options=(!strip)

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
	dotnet publish -c Release -o "$srcdir/publish" ./Autumn
}

package() {
	mkdir -p "$pkgdir/opt/autumn/"
	mkdir -p "$pkgdir/usr/bin/"

	cp -R publish/* "$pkgdir/opt/autumn/"

	ln -s "/opt/autumn/Autumn" "$pkgdir/usr/bin/autumn"
}
