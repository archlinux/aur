# Maintainer: Magnus Groß, for email contact see AUR commit author email
_pkgname=grandorgue
pkgname="$_pkgname"-git
pkgver=3.6.4.1.r1.gfd3aa076
pkgrel=1
pkgdesc="Virtual Pipe Organ Software"
arch=('i686' 'x86_64')
url="https://github.com/GrandOrgue/$_pkgname"
license=('GPL2+')
depends=(wxgtk2 wavpack fftw jack)
makedepends=(git cmake rtaudio rtmidi portaudio docbook-xsl)
source=("git+$url.git"
	"git+https://github.com/GrandOrgue/ZitaConvolver.git"
)
sha256sums=('SKIP'
            'SKIP')

pkgver() {
	cd "$_pkgname"
	( set -o pipefail
		git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^v//' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

prepare() {
	cd "$_pkgname"
	# Unfortunately we are unable to use system zita at the moment
	git submodule init submodules/ZitaConvolver
	git config submodule.submodules/ZitaConvolver.url "$srcdir/ZitaConvolver"
	git submodule update
}

build() {
	cd "$_pkgname"
	cmake -B build -DCMAKE_INSTALL_PREFIX="/usr" -DCMAKE_BUILD_TYPE=Release -DUSE_INTERNAL_RTAUDIO=Off -DUSE_INTERNAL_PORTAUDIO=Off
	cmake --build build
}

package() {
	cd "$_pkgname"
	DESTDIR=$pkgdir cmake --install build
}
