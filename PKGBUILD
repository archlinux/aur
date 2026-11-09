# Maintainer: Luna Z. <stoffi05@pm.me>
_pkgname="silkfly"
pkgname="${_pkgname}-bin"
pkgver=r8.9a42cd8
pkgrel=1
pkgdesc="Mod manager for Hollow Knight: Silksong"
arch=('x86_64')
url="https://github.com/Ishmael-GameDev/Silkfly"
license=('GPL-3.0-only')
depends=()
makedepends=('git' 'dotnet-sdk')
provides=("${_pkgname=${pkgver}}")
conflicts=("${_pkgname}")
_appimage=("${_pkgname}-${pkgver}.AppImage")
noextract=("${_appimage}")
options=('!strip' '!debug')

source=("${_pkgname}::git+${url}.git")
sha256sums=(SKIP)

_project="silkfly/src/Silkfly.App/Silkfly.App.csproj"
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
	export DOTNET_CLI_TELEMETRY_OUTPUT=1
	export DOTNET_NOLOGO=1
	export DOTNET_SKIP_FIRST_TIME_EXPERIENCE=1
	export DOTNET_CLI_HOME="$srcdir/.notnet"
	export NUGET_PACKAGES="$srcdir/nuget-packages"
}

pkgver() {
	cd "$_pkgname"
	(
		set -o pipefail
		git describle --long --tags --abbrev=7 2>/dev/null |
			sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
			printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
	)
}

prepare() {
	cd "$_pkgname"
	_dotnet_env
	dotnet publish "$srcdir/$_project" \
		--configuration Release \
		--runtime "$(_rid)" \
		--self-contained=false \
		--output "$srcdir/publish" \
		-p:UseAppHost=false \
		-p:DebugType=None \
		-p:DebugSymbols=false \
		-p:ContinuousIntegrationBuild=true
}

check() {
	cd "$_pkgname"
	_dotnet_env
	dotnet test --configuration Release
}

package() {
	install -dm755 "$pkgdir/usr/lib/$_pkgname"
	cp -dr --no-preserve=ownership "$srcdir/publish/." "$pkgdir/usr/lib/$_pkgname"

	install -dm755 "$pkgdir/usr/bin"
	cat >"$pkgdir/usr/bin/$_pkgname" <<EOF
#!/bin/sh
exec /usr/bin/dotnet /usr/lib/$_pkgname/$_assembly.dll "\$@"
EOF

	chmod 755 "$pkgdir/usr/bin/$_pkgname"

	install -dm755 "$pkgdir/usr/share/applications"
	cat >"$pkgdir/usr/share/applications/$_pkgname.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=$_assembly
Exec=$_pkgname %U
Icon=$_pkgname
Terminal=false
Categories=Utility;
EOF

	install -Dm644 silkfly/src/Silkfly.App/Assets/silkfly.ico \
		"$pkgdir/usr/share/icons/hicolor/256x256/apps/$_pkgname.png"

	install -Dm644 "$srcdir/publish/LICENSE" \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 silkfly/src/Silkfly.App/Assets/silkfly.ico \
		"$pkgdir/usr/share/icons/hicolor/256x256/apps/$_pkgname.png"
}
