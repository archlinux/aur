# Maintainer: Aptivi <ceo at aptivi dot anonaddy dot com>
pkgname=nitrocid-27-git
pkgver=v0.1.2.r3.6925bae55
pkgrel=1
pkgdesc="Simulates our future-planned kernel"
arch=('x86_64' 'aarch64')
url="https://aptivi.github.io"
license=('GPL-3.0-or-later')
depends=('dotnet-runtime-10.0' 'tzdata')
makedepends=('git' 'dotnet-sdk-10.0' 'make' 'which')
optdepends=('jack2: Jack support for BassBoom addon'
			'portaudio: PortAudio support for BassBoom addon'
			'openal: OpenAL support for BassBoom addon'
			'sdl2: SDL support for BassBoom addon'
			'libpulse: PulseAudio support for BassBoom addon')
provides=("${pkgname%-git}" "${pkgname%-git}-lite" "${pkgname}-lite")
conflicts=("${pkgname%-git}" "${pkgname%-git}-lite" "${pkgname}-lite")
options=('!strip')
source=("${pkgname}::git+https://gitlab.com/aptivi/main/Nitrocid#branch=v0.1.2.x-saas")
sha256sums=('SKIP')

pkgver() {
	cd "${pkgname}"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
	cd "${pkgname}"
	make init-offline
	make clean
	git submodule update --init --remote
}

build() {
	cd "${pkgname}"
	make all-offline
}

package() {
	cd "${pkgname}"
	make install DESTDIR="$pkgdir"
}
