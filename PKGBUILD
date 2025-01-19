# Maintainer: Aptivi <ceo at aptivi dot anonaddy dot com>
pkgname=nitrocid-27-git
pkgver=v0.1.0.r741.e2aecf6d2
pkgrel=1
pkgdesc="Simulates our future-planned kernel"
arch=('x86_64' 'aarch64')
url="https://aptivi.github.io"
license=('GPL-3.0-or-later')
depends=('dotnet-runtime-8.0' 'tzdata')
makedepends=('git' 'dotnet-sdk-8.0' 'make' 'which')
optdepends=('jack2: Jack support for BassBoom addon'
			'portaudio: PortAudio support for BassBoom addon'
			'openal: OpenAL support for BassBoom addon'
			'sdl2: SDL support for BassBoom addon'
			'libpulse: PulseAudio support for BassBoom addon')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=('!strip')
source=("${pkgname}::git+https://github.com/Aptivi/Nitrocid#branch=main")
sha256sums=('SKIP')

pkgver() {
	cd "${pkgname}"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
	cd "${pkgname}"
	HOME=`pwd`/nuget DOTNET_CLI_TELEMETRY_OPTOUT=1 dotnet restore Nitrocid.sln
	mkdir -p deps
	cp nuget/.nuget/packages/*/*/*.nupkg deps/
	rm -rf nuget
	cp tools/OfflineNuGet.config ./NuGet.config
}

build() {
	cd "${pkgname}"
	HOME="$srcdir/homedir" DOTNET_CLI_TELEMETRY_OPTOUT=1 make all-offline
}

package() {
	cd "${pkgname}"
	make install DESTDIR="$pkgdir"
}
