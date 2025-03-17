# Maintainer: Aptivi <ceo at aptivi dot anonaddy dot com>
pkgname=bassboom-1-git
pkgver=v0.1.12.r0.1dc618a
pkgrel=1
pkgdesc="Cross-platform music player written in C#"
arch=('x86_64' 'aarch64')
url="https://aptivi.github.io"
license=('GPL-3.0-or-later')
depends=('dotnet-runtime-8.0' 'tzdata')
makedepends=('git' 'dotnet-sdk-8.0' 'make' 'which')
optdepends=('jack2: Jack support for BassBoom'
			'portaudio: PortAudio support for BassBoom'
			'openal: OpenAL support for BassBoom'
			'sdl2: SDL support for BassBoom'
			'libpulse: PulseAudio support for BassBoom')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=('!strip')
source=("${pkgname}::git+https://github.com/Aptivi/BassBoom#branch=x/oob/v0.1.x")
sha256sums=('SKIP')

pkgver() {
	cd "${pkgname}"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
	cd "${pkgname}"
	HOME=`pwd`/nuget DOTNET_CLI_TELEMETRY_OPTOUT=1 dotnet restore BassBoom.sln
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
