# Maintainer: Nathan Chere <aur@nathanchere.com.au>
pkgname=ratools
_appname=RATools
pkgver=1.16.2
pkgrel=1
pkgdesc="CLI script interpreter and toolkit for writing RetroAchievements (rascript-cli)"
arch=('x86_64')
url="https://github.com/Jamiras/RATools"
license=('MIT')
depends=('icu')
makedepends=('dotnet-sdk-6.0' 'git')
source=("${_appname}::git+https://github.com/Jamiras/${_appname}.git#tag=v${pkgver}")
sha256sums=('SKIP')
options=('!strip' 'staticlibs')

prepare() {
	cd "$srcdir/$_appname"
	git submodule update --init --recursive
}

build() {
	cd "$srcdir/$_appname"

	export DOTNET_CLI_TELEMETRY_OPTOUT=1
	export DOTNET_NOLOGO=1

	dotnet publish Source/rascript-cli/rascript-cli.csproj \
		-c Release \
		--self-contained \
		-r linux-x64 \
		-p:PublishSingleFile=true \
		-o build/publish
}

check() {
	cd "$srcdir/$_appname"

	export DOTNET_CLI_TELEMETRY_OPTOUT=1
	export DOTNET_NOLOGO=1

	dotnet test Tests/Parser/RATools.Parser.Tests.csproj -c Release
	dotnet test Tests/Data/RATools.Data.Tests.csproj -c Release
}

package() {
	cd "$srcdir/$_appname"

	install -Dm755 build/publish/rascript-cli "$pkgdir/usr/bin/rascript"
	install -Dm644 license.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
