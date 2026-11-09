# Maintainer: Luna Z. <stoffi05@pm.me>
_pkgname="silkfly"
pkgname="${_pkgname}-git"
pkgver=0.1.1.r0.g9a42cd8
pkgrel=1
pkgdesc="Mod manager for Hollow Knight: Silksong"
arch=('x86_64')
url="https://github.com/Ishmael-GameDev/Silkfly"
license=('GPL-3.0-only')
depends=('dotnet-runtime-10.0' 'fontconfig' 'libx11' 'libice' 'libsm' 'hicolor-icon-theme' 'sh')
makedepends=('git' 'dotnet-sdk-10.0')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
options=('!strip' '!debug')
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

_project="src/Silkfly.App/Silkfly.App.csproj"
_assembly="Silkfly"

_rid() {
	case "$CARCH" in
	x86_64) echo linux-x64 ;;
	*)
		error "Unsupported architecture: $CARCH"
		return 1
		;;
	esac
}

_dotnet_env() {
	export DOTNET_CLI_TELEMETRY_OPTOUT=1
	export DOTNET_NOLOGO=1
	export DOTNET_SKIP_FIRST_TIME_EXPERIENCE=1
	export DOTNET_CLI_HOME="$srcdir/.dotnet"
	export NUGET_PACKAGES="$srcdir/nuget-packages"
	export MSBUILDDISABLENODEREUSE=1
}

pkgver() {
	cd "$_pkgname"
	(
		set -o pipefail
		git describe --long --tags --abbrev=7 2>/dev/null |
			sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
			printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
	)
}

prepare() {
	cd "$_pkgname"
	_dotnet_env
	dotnet restore Silkfly.sln
	dotnet restore "$_project" --runtime "$(_rid)"
}

build() {
	cd "$_pkgname"
	_dotnet_env
	dotnet publish "$_project" \
		--no-restore \
		--configuration Release \
		--runtime "$(_rid)" \
		--self-contained false \
		--output "$srcdir/publish" \
		-p:UseAppHost=false \
		-p:DebugType=None \
		-p:DebugSymbols=false \
		-p:ContinuousIntegrationBuild=true
}

check() {
	cd "$_pkgname"
	_dotnet_env
	dotnet test Silkfly.sln \
		--no-restore \
		--configuration Release \
		--nologo \
		--verbosity quiet \
		--logger "console;verbosity=quiet"
}

package() {
	install -dm755 "$pkgdir/usr/lib/$_pkgname"
	cp -r --no-preserve=ownership "$srcdir/publish/." "$pkgdir/usr/lib/$_pkgname/"

	install -Dm755 /dev/stdin "$pkgdir/usr/bin/$_pkgname" <<EOF
#!/bin/sh
exec /usr/bin/dotnet /usr/lib/$_pkgname/$_assembly.dll "\$@"
EOF

	install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$_pkgname.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=Silkfly
Comment=$pkgdesc
Exec=$_pkgname
Icon=$_pkgname
Terminal=false
Categories=Game;Utility;
EOF

	cd "$_pkgname"

	install -Dm644 build/icons/silkfly.png \
		"$pkgdir/usr/share/icons/hicolor/256x256/apps/$_pkgname.png"

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 THIRD-PARTY-NOTICES.md "$pkgdir/usr/share/licenses/$pkgname/THIRD-PARTY-NOTICES.md"
}
