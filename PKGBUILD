# Maintainer: Kim Nordmo <kim.nordmo@gmail.com>
pkgname=gitreleasemanager-git
pkgver=r634.7651190
pkgrel=1
pkgdesc="Tool for creating and exporting releases for software applications hosted on GitHub"
arch=('x86_64')
url="https://github.com/GitTools/GitReleaseManager"
license=('MIT')
depends=('dotnet-runtime')
makedepends=('git' 'mono' 'openssl-1.0' 'dos2unix' 'dotnet-sdk')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=()
source=(
	"${pkgname%-git}::git+${url}#branch=develop"
	"0001-Update-target-framework-to-netcore-3.1.patch"
)
noextract=()
sha512sums=('SKIP'
            'fcb63898e2aba05591f2d4ca58bab25747ec030555d08d0af8224c5a51cf6b6db17737f2081c5493866b6323e3d00a281a2194af9e935f148a871e019bf8b7e4')

prepare() {
	cd "$srcdir/${pkgname%-git}"
	dos2unix src/GitReleaseManager.Cli/GitReleaseManager.Cli.csproj
	patch -p1 -i "$srcdir/0001-Update-target-framework-to-netcore-3.1.patch" --binary
}

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	./build.sh --target=DotNetCore-Build
}

#check() {
#	cd "$srcdir/${pkgname%-git}"
#	./build.sh --target=DotNetCore-Test
#} Currently disabled due to issues running unit tests

package() {
	cd "$srcdir/${pkgname%-git}"
	dest="$pkgdir/opt/${pkgname%-git}"
	install -d "$dest"
	cp -aT "BuildArtifacts/temp/_PublishedApplications/GitReleaseManager.Cli/netcoreapp3.1" "$dest"
	install -d "$pkgdir/usr/bin"
	ln -s "/opt/${pkgname%-git}/GitReleaseManager" "$pkgdir/usr/bin/${pkgname%-git}"
	install -Dm0644 "LICENSE" -t "$pkgdir/usr/share/licenses/${pkgname}"
}
