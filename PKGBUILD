# Maintainer: Daniel Peukert <daniel@peukert.cc>
pkgname='vrf-decompiler'
_reponame='ValveResourceFormat'
pkgver='10.0'
pkgrel='1'
pkgdesc="File data viewer and decompiler for Valve's Source 2 resource file format"
arch=('x86_64')
url="https://github.com/$_reponame/$_reponame"
license=('MIT')
depends=('dotnet-runtime>=8.0.0' 'skia-sharp')
makedepends=('dotnet-sdk>=8.0.0' 'git')
options=('!strip')
source=("$pkgname-$pkgver::git+$url#tag=$pkgver?signed")
sha512sums=('cedb81f4f56cd7eb8ca46a4c44d5db4a1aee6e6558a2b49d0d27c85a96e7db132f97e65549ea9b1ccdca815954e59aa351d944e4d8bb39dabe3ff0327ab93493')
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
	"./Decompiler/bin/Release/$_dotnetarch/publish/Decompiler" -i 'Tests/Files/small_map_with_material.vpk' -l | tee '/dev/stderr' | grep -q 'maps/ui/nametag/world.vwrld_c$'
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	install -Dm755 "$srcdir/$_sourcedirectory/Decompiler/bin/Release/$_dotnetarch/publish/Decompiler" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/MIT"
}
