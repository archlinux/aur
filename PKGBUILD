# Maintainer: Magnus Groß, for email contact see AUR commit author email
_pkgname=grandorgue
pkgname="$_pkgname"-git
pkgver=3.7.0.1.r0.gf42eabea
pkgrel=1
pkgdesc="Virtual Pipe Organ Software"
arch=('i686' 'x86_64')
url="https://github.com/GrandOrgue/$_pkgname"
license=('GPL2+')
depends=(wxwidgets-gtk3 wavpack fftw jack rtmidi rtaudio portaudio zita-convolver)
makedepends=(git cmake rtaudio rtmidi docbook-xsl)
conflicts=(grandorgue grandorgue-bin)
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	( set -o pipefail
		git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^v//' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	cd "$_pkgname"
	cmake -B build -DCMAKE_INSTALL_PREFIX="/usr" -DUSE_INTERNAL_RTAUDIO=Off -DUSE_INTERNAL_PORTAUDIO=Off -DUSE_INTERNAL_ZITACONVOLVER=Off
	cmake --build build
}

package() {
	cd "$_pkgname"
	DESTDIR="$pkgdir" cmake --install build
}
