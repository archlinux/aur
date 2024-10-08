# Maintainer: Noa <coolreader18@gmail.com>
pkgname=celeste64-fuji-beta
pkgver=0.5.0.r0.8c1d346
pkgrel=2
pkgdesc="A free and open source mod loader for Celeste 64: Fragments of the Mountain (beta branch)"
arch=(x86_64 aarch64)
url="https://fujiapi.github.io"
license=('custom:celeste64-fuji')
depends=(dotnet-runtime)
makedepends=('git' dotnet-sdk)
options=('!strip' '!debug')
provides=("${pkgname%-beta}")
conflicts=("${pkgname%-beta}")
source=('celeste64-fuji::git+https://github.com/FujiAPI/Fuji#branch=beta'
				fuji.desktop)
noextract=()
sha256sums=('SKIP'
            '35ffe246db00f9a6e54d50eb7e37d637ac2107413e88f2fe12d27c64ef1830dd')

pkgver() {
	cd "$srcdir/${pkgname%-beta}"
	git fetch origin main
	last_common=$(git merge-base origin/main HEAD)
	num_revs=$(git rev-list --count "$last_common"...HEAD)
	ver=$(git cat-file blob "$last_common":Celeste64.Launcher/Celeste64.Launcher.csproj | grep '<Version>' | sed 's/\s*\|<\/\?Version>//g')
	printf "%s.r%s.%s" "$ver" "$num_revs" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-beta}"
	dotnet build Celeste64.Launcher/Celeste64.Launcher.csproj -c Release --ucr
	awk '/License/{license=1} !$0{license=0} license' README.md >License.txt
}

package() {
	cd "$srcdir/${pkgname%-beta}"
	dotnet publish Celeste64.Launcher/Celeste64.Launcher.csproj -c Release --ucr --no-build -o "$pkgdir"/opt/fuji
	cp -r Content Mods fuji.png "$pkgdir"/opt/fuji
	install -Dm 644 "$srcdir"/fuji.desktop -t "$pkgdir"/usr/share/applications
	install -Dm 644 License.txt -t "$pkgdir"/usr/share/licenses/fuji
	install -Dm 644 Source/License.txt "$pkgdir"/usr/share/licenses/fuji/SourceLicense.txt
}
