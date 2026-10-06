# Maintainer: Aaron Friesen <aaron@frie.dev>
# shellcheck shell=bash disable=SC2034,SC2154,SC2164
pkgname=nickel-mod-loader
pkgver=1.21.3
pkgrel=1
pkgdesc='A modding API / mod loader for the game Cobalt Core (Windows version)'
arch=(x86_64)
url=https://github.com/Shockah/Nickel
license=(Apache-2.0)
makedepends=(dotnet-sdk)
optdepends=('steam: launch Nickel via Proton')
install=nickel-mod-loader.install
source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/release/$pkgver.tar.gz"
	proton-appdata.patch
)
sha256sums=(
	'd9815d46a6356f53bd0d105b4c88b483efec6231c07420b6eb39a05223d4b66c'
	'3df6067e52ffef756ee22713a0cdc16a459647fe98b1fe65c14124b30556abb8'
)

prepare() {
	cd "$srcdir/Nickel-release-$pkgver"
	patch -Np1 -i "$srcdir/proton-appdata.patch"
}

build() {
	cd "$srcdir/Nickel-release-$pkgver"

	local build_dir="$srcdir/Nickel-release-$pkgver/_Publish/win-x64/Nickel"
	dotnet publish NickelLauncher/NickelLauncher.csproj \
		-c Release \
		-r win-x64 \
		-p:PublishReadyToRun=false \
		-p:TieredCompilation=false \
		-p:PublishSingleFile=false \
		-p:UseReferenceAssembly=true \
		-p:OutDir="$build_dir" \
		--self-contained

	# Build internal mods
	local mod
	for mod in \
		Nickel.Bugfixes \
		Nickel.Essentials \
		Nickel.InfoScreens \
		Nickel.Legacy \
		Nickel.ModSettings \
		Nickel.UpdateChecks \
		Nickel.UpdateChecks.GitHub \
		Nickel.UpdateChecks.NexusMods \
		Nickel.UpdateChecks.UI; do
		dotnet build "$mod/$mod.csproj" \
			-c Release \
			-p:EnableDllReference=false \
			-p:ModLoaderPath="$build_dir" \
			-p:ModDeployModsPath="$build_dir/InternalModLibrary"
	done
}

package() {
	local build_dir="$srcdir/Nickel-release-$pkgver/_Publish/win-x64/Nickel"
	local install_dir="$pkgdir/opt/$pkgname"

	install -d "$install_dir"
	cp -a "$build_dir/." "$install_dir/"

	install -Dm644 "$srcdir/Nickel-release-$pkgver/LICENSE" \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "$srcdir/Nickel-release-$pkgver/docs/player-guide.md" \
		"$pkgdir/usr/share/doc/$pkgname/player-guide.md"
}
