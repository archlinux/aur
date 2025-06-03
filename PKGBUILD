# Maintainer: Daniel Peukert <daniel@peukert.cc>
pkgname='vrf-decompiler'
_reponame='ValveResourceFormat'
pkgver='13.0'
pkgrel='1'
pkgdesc="File data viewer and decompiler for Valve's Source 2 resource file format"
arch=('x86_64')
url="https://github.com/$_reponame/$_reponame"
license=('MIT')
depends=('dotnet-runtime>=9.0.0')
makedepends=('dotnet-sdk>=9.0.0' 'git')
options=('!strip')
source=("$pkgname-$pkgver::git+$url#tag=$pkgver?signed")
b2sums=('824c5db46895522a79687ac3143b7a760b11057b527d66910e1778ec9033a9c59f43ff88cbf3af3db23d00a918e53999d8494068eaa7bfdc642841712d6f820d')
validpgpkeys=('E58081FB804DF24DF217AB772B6E7BF31D171C61') # Pavel Djundik <github@xpaw.me> (https://github.com/xPaw.gpg)

_sourcedirectory="$pkgname-$pkgver"
_dotnetarch='linux-x64'

prepare() {
	cd "$srcdir/$_sourcedirectory/"

	# Disable welcome message and telemetry
	export DOTNET_NOLOGO='true'
	export DOTNET_SKIP_FIRST_TIME_EXPERIENCE='true'
	export DOTNET_CLI_TELEMETRY_OPTOUT='true'

	# Download dependencies
	dotnet restore --verbosity 'normal' --runtime "$_dotnetarch" 'CLI/CLI.csproj'
}

build() {
	cd "$srcdir/$_sourcedirectory/"

	# Disable welcome message and telemetry
	export DOTNET_NOLOGO='true'
	export DOTNET_SKIP_FIRST_TIME_EXPERIENCE='true'
	export DOTNET_CLI_TELEMETRY_OPTOUT='true'

	# Build the project (don't publish as self-contained, as we use the system dotnet runtime)
	dotnet build --verbosity 'normal' --configuration 'Release' -p:EnableSourceControlManagerQueries=false --runtime "$_dotnetarch" --self-contained false 'CLI/CLI.csproj'
	dotnet publish --verbosity 'normal' --configuration 'Release' -p:EnableSourceControlManagerQueries=false --runtime "$_dotnetarch" --self-contained false 'CLI/CLI.csproj'
}

check() {
	cd "$srcdir/$_sourcedirectory/"

	# Run tests
	dotnet test --verbosity 'normal' -p:EnableSourceControlManagerQueries=false -p:Include='[ValveResourceFormat*]*' --runtime "$_dotnetarch" 'Tests/Tests.csproj'

	# Verify that the basic functionality works
	_checkoutput="$("./CLI/bin/Release/$_dotnetarch/publish/Source2Viewer-CLI" -i 'Tests/Files/small_map_with_material.vpk' -l)"
	printf '%s\n' "$_checkoutput"
	printf '%s\n' "$_checkoutput" | grep -q '^maps/ui/nametag/world.vwrld_c'
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	install -Dm755 "$srcdir/$_sourcedirectory/CLI/bin/Release/$_dotnetarch/publish/Source2Viewer-CLI" "$pkgdir/usr/bin/Source2Viewer-CLI"
	ln -sf '/usr/bin/Source2Viewer-CLI' "$pkgdir/usr/bin/$pkgname"
	install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/MIT"
}
