# Maintainer: Kim Nordmo <kim.nordmo@gmail.com>
pkgname=gitreleasemanager
pkgver=0.11.0
pkgrel=2
pkgdesc="Tool for creating and exporting releases for software applications hosted on GitHub"
arch=('x86_64')
url="https://github.com/GitTools/GitReleaseManager"
license=('MIT')
depends=('dotnet-runtime>=3.1')
makedepends=('git' 'mono' 'openssl-1.0' 'dos2unix' 'dotnet-sdk>=3.1')
options=()
source=(
	"${pkgname}::git+${url}#tag=${pkgver}"
	"0001-Fix-building-of-GRM.patch"
	"0002-Re-Target-to-.NET-Core-3.1.patch"
)
noextract=()
sha512sums=('SKIP'
            '79e4b5aba93b67f40906132058a68387ef4e7ad32e5acf590e8beccd12f31895c95db4ca60b4337004dd82852a7bc7190b8f8d47d7718189c62e33952c0ed06e'
            'd72f2c6c44f196e461dfc09e5e668ce4aa4d0de935e41904e0ac1b5587a335a6c1ae3b394b2dcab42a1a7f4d1e3f75b6970e45a6727ddb674da2d3501c1775e6')

prepare() {
	cd "$srcdir/${pkgname}"
	dos2unix {recipe.cake,tools/packages.config}
	dos2unix Source/GitReleaseManager.{*/*.csproj,sln}

	patch -p1 -i "$srcdir/0001-Fix-building-of-GRM.patch"
	patch -p1 -i "$srcdir/0002-Re-Target-to-.NET-Core-3.1.patch"
}

build() {
	cd "$srcdir/${pkgname}"
	./build.sh --target=DotNetCore-Build
}

#check() {
#	cd "$srcdir/${pkgname}"
#	./build.sh --target=DotNetCore-Test
#} Currently disabled due to issues running unit tests

package() {
	cd "$srcdir/${pkgname}"
	dest="$pkgdir/opt/${pkgname}"
	install -d "$dest"
	cp -aT "BuildArtifacts/temp/_PublishedApplications/GitReleaseManager.Cli/netcoreapp3.1" "$dest"
	install -d "$pkgdir/usr/bin"
	ln -s "/opt/${pkgname}/GitReleaseManager" "$pkgdir/usr/bin/${pkgname}"
	install -Dm0644 "LICENSE" -t "$pkgdir/usr/share/licenses/${pkgname}"
}
