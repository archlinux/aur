# Maintainer: yustin <#archlinux-proaudio@libera.chat>
# Contributor: kiasoc5 <kiasoc5 at tutanota dot com>
# Contributor: xantares

pkgname=stargate
pkgver=23.05.2
pkgrel=1
pkgdesc="A digital audio workstation (DAW) with a powerful pattern-based workflow"
license=('GPL')
arch=('x86_64' 'aarch64')
url="https://github.com/stargatedaw/stargate"
depends=(
    'alsa-lib'
    'fftw'
    'libsndfile'
    'portaudio'
    'portmidi'
    'python-jinja'
    'python-mido'
    'python-mutagen'
    'python-numpy'
    'python-psutil'
    'python-yaml'
    'python-pymarshal'
    'python-wavefile'
    'python-pyqt6'
    'qt6-svg'
    'rubberband'
    'sbsms'
)
makedepends=(
    'jq'
    'libsbsms'
)
optdepends=(
    'lame'
    'ffmpeg'
    'vorbis-tools'
    'python-pyqt5: qt5 backend'
)
source=("https://github.com/stargateaudio/stargate/archive/refs/tags/release-${pkgver}.tar.gz"
	"git+https://codeberg.org/soundtouch/soundtouch.git#commit=dd2252e9af3f2d6b749378173a4ae89551e06faf"
	)
sha256sums=('30559c431eb3c59ce74152d2150d4009b3f826ada136870da2f1fe8c8e12603f'
  'SKIP'
  )

prepare(){
  cd stargate-release-${pkgver}
	rm -rf src/vendor/soundtouch/
	cd src/vendor
	cp -r ${srcdir}/soundtouch .
	cd .. 
	sed "/\binstall_symlinks:/s/:.*/:/" -i Makefile 
}

build() {
  cd stargate-release-${pkgver}/src
  # for non-x86 architectures
  PLAT_FLAGS="${CFLAGS}" make all
}

package() {
  cd stargate-release-${pkgver}/src
  DESTDIR=${pkgdir} make install
}
