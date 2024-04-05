# Maintainer: Noa <coolreader18@gmail.com>
pkgname=celeste64-fuji
pkgver=0.6.0
pkgrel=1
pkgdesc="A free and open source mod loader for Celeste 64: Fragments of the Mountain"
arch=(x86_64 aarch64)
url="https://fujiapi.github.io"
license=('custom:celeste64-fuji')
makedepends=(dotnet-sdk)
options=('!strip' '!debug')
source=(Fuji-$pkgver.tar.gz::"https://github.com/FujiAPI/Fuji/archive/refs/tags/$pkgver.tar.gz"
	'fuji.desktop')
noextract=()
sha256sums=('7a015175dab16fcb0b33b6e07c52d9a59715404a69b191d93d9ef01e5e87bbac'
            '35ffe246db00f9a6e54d50eb7e37d637ac2107413e88f2fe12d27c64ef1830dd')

prepare() {
	cd "Fuji-$pkgver"
	dotnet restore
}

build() {
	cd "Fuji-$pkgver"
	dotnet build Celeste64.Launcher/Celeste64.Launcher.csproj -c Release --ucr
	awk '/License/{license=1} !$0{license=0} license' README.md >License.txt
}

package() {
	cd "Fuji-$pkgver"
	dotnet publish Celeste64.Launcher/Celeste64.Launcher.csproj -c Release --ucr --no-build -o "$pkgdir"/opt/fuji
	cp -r Content Mods fuji.png "$pkgdir"/opt/fuji
	install -Dm 644 "$srcdir"/fuji.desktop -t "$pkgdir"/usr/share/applications
	install -Dm 644 License.txt -t "$pkgdir"/usr/share/licenses/fuji
	install -Dm 644 Source/License.txt "$pkgdir"/usr/share/licenses/fuji/SourceLicense.txt
}
