# Maintainer: Daniel Peukert <daniel@peukert.cc>
pkgname='vrf-decompiler'
_reponame='ValveResourceFormat'
pkgver='0.4.0'
pkgrel='1'
pkgdesc="File data viewer and decompiler for Valve's Source 2 resource file format"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/SteamDatabase/$_reponame"
license=('MIT')
depends=('dotnet-runtime>=7.0.0' 'skia-sharp')
makedepends=('dotnet-sdk>=7.0.0')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('f5698c28a01838ca2a0c6ff75ebe36a278171dbafb4f7ba464722aaf0785a23a7a0290888f0659577a8559dad89801ee63847b976e737087b345d8e5b6fcf329')

_sourcedirectory="$_reponame-$pkgver"

case "$CARCH" in
	armv7h)
		_dotnetarch="linux-arm"
	;;
	aarch64)
		_dotnetarch="linux-arm64"
	;;
	*)
		_dotnetarch="linux-x64"
	;;
esac

prepare() {
	cd "$srcdir/$_sourcedirectory/"

	# Disable welcome message and telemetry
	export DOTNET_NOLOGO='true'
	export DOTNET_SKIP_FIRST_TIME_EXPERIENCE='true'
	export DOTNET_CLI_TELEMETRY_OPTOUT='true'

	# Get rid of the dependency on the prebuild SkiaSharp library, as we use the system one
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

	# Build the project (disable Source Link, as we're not in a git repo; don't publish as self-contained, as we use the system dotnet runtime)
	dotnet build --verbosity 'normal' --configuration 'Release' -p:EnableSourceLink=false --runtime "$_dotnetarch" --self-contained false 'Decompiler/Decompiler.csproj'
	dotnet publish --verbosity 'normal' --configuration 'Release' -p:EnableSourceLink=false -p:PublishSingleFile=true -p:DebugType=embedded --runtime "$_dotnetarch" --self-contained false 'Decompiler/Decompiler.csproj'
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	install -Dm755 "$srcdir/$_sourcedirectory/Decompiler/bin/Release/$_dotnetarch/publish/Decompiler" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
