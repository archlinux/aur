# Maintainer: Daniel Peukert <daniel@peukert.cc>
pkgname='vrf-decompiler'
_reponame='ValveResourceFormat'
pkgver='10.2'
pkgrel='1'
pkgdesc="File data viewer and decompiler for Valve's Source 2 resource file format"
arch=('x86_64')
url="https://github.com/$_reponame/$_reponame"
license=('MIT')
depends=('dotnet-runtime>=8.0.0' 'skia-sharp')
makedepends=('dotnet-sdk>=8.0.0' 'git')
options=('!strip')
source=("$pkgname-$pkgver::git+$url#tag=$pkgver?signed")
sha512sums=('337a9ebaf04029a9eb65760bf0feded3d3abe8402f45d42ae0b385de0253382b7bbfb19ebb780a13bae393a29a3983faad22b5b28c8b6ce3eb8fcc201e01b4c9')
validpgpkeys=('E58081FB804DF24DF217AB772B6E7BF31D171C61') # Pavel Djundik <github@xpaw.me> (https://github.com/xPaw.gpg)

_sourcedirectory="$pkgname-$pkgver"
_dotnetarch="linux-x64"

prepare() {
	cd "$srcdir/$_sourcedirectory/"

	# Disable welcome message and telemetry
	export DOTNET_NOLOGO='true'
	export DOTNET_SKIP_FIRST_TIME_EXPERIENCE='true'
	export DOTNET_CLI_TELEMETRY_OPTOUT='true'

	# Get rid of the dependency on the prebuilt SkiaSharp library, as we use the system one
	sed -i '/"SkiaSharp\.NativeAssets\.Linux\.NoDependencies"/d' 'ValveResourceFormat/ValveResourceFormat.csproj'

	# Download dependencies
	dotnet restore --verbosity 'normal' --runtime "$_dotnetarch" 'Decompiler/Decompiler.csproj'
}

build() {
	cd "$srcdir/$_sourcedirectory/"

	# Disable welcome message and telemetry
	export DOTNET_NOLOGO='true'
	export DOTNET_SKIP_FIRST_TIME_EXPERIENCE='true'
	export DOTNET_CLI_TELEMETRY_OPTOUT='true'

	# Build the project (don't publish as self-contained, as we use the system dotnet runtime)
	dotnet build --verbosity 'normal' --configuration 'Release' -p:EnableSourceControlManagerQueries=false --runtime "$_dotnetarch" --self-contained false 'Decompiler/Decompiler.csproj'
	dotnet publish --verbosity 'normal' --configuration 'Release' -p:EnableSourceControlManagerQueries=false --runtime "$_dotnetarch" --self-contained false 'Decompiler/Decompiler.csproj'
}

check() {
	cd "$srcdir/$_sourcedirectory/"

	# Run tests
	dotnet test --verbosity 'normal' -p:EnableSourceControlManagerQueries=false -p:Include="[ValveResourceFormat*]*" --runtime "$_dotnetarch" 'Tests/Tests.csproj'

	# Verify that the basic functionality works
	_checkoutput="$("./Decompiler/bin/Release/$_dotnetarch/publish/Decompiler" -i 'Tests/Files/small_map_with_material.vpk' -l)"
	printf '%s\n' "$_checkoutput"
	printf '%s\n' "$_checkoutput" | grep -q '^maps/ui/nametag/world.vwrld_c'
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	install -Dm755 "$srcdir/$_sourcedirectory/Decompiler/bin/Release/$_dotnetarch/publish/Decompiler" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/MIT"
}
