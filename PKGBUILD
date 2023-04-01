# Maintainer: Daniel Peukert <daniel@peukert.cc>
pkgname='vrf-decompiler'
_reponame='ValveResourceFormat'
pkgver='0.3.1'
pkgrel='1'
pkgdesc="File data viewer and decompiler for Valve's Source 2 resource file format"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/SteamDatabase/$_reponame"
license=('MIT')
depends=('dotnet-runtime' 'skia-sharp')
makedepends=('dotnet-sdk')
options=('!strip')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('8f8bff9240e2ade9cdfd601d975e5590ba174459cab48381257ce15e54ac616553d9ad38ccb4329f58061a0c8261e08a6c37c1166eb18984f95170dc61f84273')

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
