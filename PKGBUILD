# Maintainer: Aptivi <ceo at aptivi dot anonaddy dot com>
pkgname=bassboom-2
pkgver=1.0.2.0+0.2.7.0
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
options=('!strip')
source=("${pkgname}::git+https://github.com/Aptivi/BassBoom#tag=v0.2.7")
sha256sums=('SKIP')

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
