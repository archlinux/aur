# Maintainer: Aaron Friesen <aaron@frie.dev>
# Contributor: pynappo <pynappo at proton dot me>
# shellcheck shell=bash disable=SC2034,SC2154,SC2164
pkgname=ddinfo-tools
_dotnet_version=10.0
pkgver=0.13.7.1
pkgrel=1
pkgdesc='Cross-platform Devil Daggers modding tools, practice tools, and custom leaderboards client'
arch=(x86_64)
url='https://devildaggers.info/tools'
license=(MIT)
depends=(glibc libgcc glib2 libstdc++ "dotnet-runtime-${_dotnet_version}" gtk3)
makedepends=("dotnet-sdk-${_dotnet_version}")
source=("$pkgname-$pkgver.tar.gz::https://github.com/NoahStolk/ddinfo-tools/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b81a4e3c55ac263d0b96e7d134ab3dbe96b6de0f3d311f003fedc603d9b64478')

build() {
	cd "$pkgname-$pkgver/scripts"
	args=(
		-p:PublishProtocol=FileSystem
		"-p:TargetFramework=net$_dotnet_version"
		-p:RuntimeIdentifier=linux-x64
		-p:Platform=x64
		-p:Configuration=Release
		-p:PublishDir=release-linux-x64
	)

	dotnet publish ../src/DevilDaggersInfo.Tools/DevilDaggersInfo.Tools.csproj "${args[@]}"
}

package() {
	cd "$pkgname-$pkgver"
	install -dm755 "$pkgdir/usr/lib/$pkgname"
	install -m644 src/artifacts/bin/DevilDaggersInfo.Tools/release_linux-x64/* "$pkgdir/usr/lib/$pkgname/"
	chmod 755 "$pkgdir/usr/lib/$pkgname/ddinfo-tools" "$pkgdir/usr/lib/$pkgname/"*.so*

	install -dm755 "$pkgdir/usr/bin"
	ln -s ../lib/$pkgname/$pkgname "$pkgdir/usr/bin/$pkgname"

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
