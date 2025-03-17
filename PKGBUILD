# Maintainer: Aptivi <ceo at aptivi dot anonaddy dot com>
pkgname=bassboom-3-git
pkgver=v0.1.0.r741.e2aecf6d2
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
source=("${pkgname}::git+https://github.com/Aptivi/BassBoom#branch=x/exp/libmpv")
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
	cp vnd/OfflineNuGet.config ./NuGet.config
	curl -L --output vnd/mpv-dev-x86_64-20250225-git-5459b0f.7z https://github.com/zhongfly/mpv-winbuild/releases/download/2025-02-25-5459b0f/mpv-dev-x86_64-20250225-git-5459b0f.7z
	curl -L --output vnd/mpv-dev-aarch64-20250225-git-5459b0f.7z https://github.com/zhongfly/mpv-winbuild/releases/download/2025-02-25-5459b0f/mpv-dev-aarch64-20250225-git-5459b0f.7z
}

build() {
	cd "${pkgname}"
	HOME="$srcdir/homedir" DOTNET_CLI_TELEMETRY_OPTOUT=1 make all-offline
}

package() {
	cd "${pkgname}"
	make install DESTDIR="$pkgdir"
}
