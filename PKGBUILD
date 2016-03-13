pkgname=ultrastardx-git
pkgver=r141.b14cc1b
pkgrel=1
pkgdesc='Free and open source karaoke game. (GIT)'
arch=('i686' 'x86_64')
url="http://ultrastardeluxe.org/"
license=('GPL')
depends=('ffmpeg2.8' 'lua51' 'portaudio' 'sdl2' 'sdl2_gfx' 'sdl2_mixer'  'sdl2_net' 'sdl2_ttf' 'sdl2_image' 'opencv' 'ttf-dejavu' 'ttf-freefont' 'wqy-microhei' 'pcre')
makedepends=('git' 'fpc')
#options=('!libtool')
provides=('ultrastardx')
conflicts=('ultrastardx')
groups=('usdx')
source=(
	"git://github.com/UltraStar-Deluxe/USDX.git"
	"usdx.patch"
)
sha256sums=(
	'SKIP'
	'2f0c8713230976e293b519db8c9058e7937e8be04d54de821067334f7481e533'	
)

pkgver() {
  cd "${srcdir}/USDX"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
cd "${srcdir}/USDX"
./autogen.sh
}


build() {
  cd "${srcdir}/USDX"
  PKG_CONFIG_PATH="/usr/lib/ffmpeg2.8/pkgconfig" ./configure
  patch "src/config-linux.inc" "${srcdir}/usdx.patch"
  make LDFLAGS="-O1 --sort-common --as-needed -z relro"
}

package() {
	cd "${srcdir}/USDX"
	touch COPYING.txt
	make DESTDIR="$pkgdir/" install
}
