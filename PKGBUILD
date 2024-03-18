# Maintainer: Noa <coolreader18@gmail.com>
pkgname=celeste64-fuji
pkgver=0.5.0
_tag=stable-19068e0
pkgrel=1
pkgdesc="A free and open source mod loader for Celeste 64: Fragments of the Mountain"
arch=(x86_64 aarch64)
url="https://fujiapi.github.io"
license=('custom:celeste64-fuji')
makedepends=(dotnet-sdk)
options=('!strip' '!debug')
source=(Fuji-$pkgver.tar.gz::"https://github.com/FujiAPI/Fuji/archive/refs/tags/$_tag.tar.gz"
	'fuji.desktop'
	'mods-in-user-dir.patch')
noextract=()
sha256sums=('7d6f1148f951897f07084547eb25413cb8f79cac8daf9d6b332e362a9155e72d'
            '35ffe246db00f9a6e54d50eb7e37d637ac2107413e88f2fe12d27c64ef1830dd'
            'e85dfceb917f508fa3480984e53d8eb3d3050c7ba73987a5e7af32fc40db4c74')

prepare() {
	cd "Fuji-$_tag"
	patch -p1 -i ../mods-in-user-dir.patch
	dotnet restore
}

build() {
	cd "Fuji-$_tag"
	dotnet build Celeste64.Launcher/Celeste64.Launcher.csproj -c Release --ucr
	awk '/License/{license=1} !$0{license=0} license' README.md >License.txt
}

package() {
	cd "Fuji-$_tag"
	dotnet publish Celeste64.Launcher/Celeste64.Launcher.csproj -c Release --ucr --no-build -o "$pkgdir"/opt/fuji
	cp -r Content Mods fuji.png "$pkgdir"/opt/fuji
	install -Dm 644 "$srcdir"/fuji.desktop -t "$pkgdir"/usr/share/applications
	install -Dm 644 License.txt -t "$pkgdir"/usr/share/licenses/fuji
	install -Dm 644 Source/License.txt "$pkgdir"/usr/share/licenses/fuji/SourceLicense.txt
}
