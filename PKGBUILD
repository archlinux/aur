# Maintainer: xylosper <darklin20@gmail.com>
# Contributor: willemw <willemw12@gmail.com>
# Contributor: Pedro Gabriel <pedrogabriel@dcc.ufmg.br>
# Contributor: itsme <mymail@ishere.ru>


pkgname=bomi
pkgver=0.9.11
pkgrel=7
pkgdesc="Powerful and easy-to-use GUI multimedia player based on mpv"
arch=('i686' 'x86_64')
url="http://${pkgname}-player.github.io"
license=('GPL2')
provides=('cmplayer')
conflicts=('bomi-fresh' 'bomi-git')
install=${pkgname}.install
depends=('qt5-base' 'qt5-declarative' 'qt5-x11extras' 'qt5-quickcontrols' 'qt5-svg'
         'libdvdread' 'libdvdnav' 'libcdio-paranoia' 'libcdio' 'smbclient'
         'alsa-lib' 'libpulse' 'jack' 'libchardet' 'libbluray' 'hicolor-icon-theme'
         'libva' 'libvdpau' 'libgl' 'fribidi' 'libass' 'ffmpeg2.8')
makedepends=('mesa' 'gcc' 'pkg-config' 'python' 'qt5-tools')
optdepends=('libva-intel-driver: hardware acceleration support for Intel GPU'
            'mesa-vdpau: hardware acceleration support for AMD/NVIDIA opensource driver'
            'youtube-dl: streaming website support including YouTube'
            'libaacs: AACS decryption for Blu-ray support'
            'libbdplus: BD+ decryption for Blu-ray support')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/xylosper/${pkgname}/archive/v${pkgver}.tar.gz"
	"ffmpeg2.8.patch"
	"qml_internal_types.patch"
	"upgrade_waf.patch")
md5sums=('543c592f588c68d6f0c3cf254c288f58'
         'cf0ea80c4a355f935199968cb59df408'
	 '965ead6202472215d8cb2d875584dfb7'
	 '6bbade797cd850a576794fbf8aef0247')
#options=(debug !strip)


prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p0 < "${srcdir}/ffmpeg2.8.patch"
  patch -p1 < "${srcdir}/qml_internal_types.patch"

  # While compiling mpv, an error occurs in waf python code.
  # Upgrading waf version fixes it.
  patch -Np1 -i $srcdir/upgrade_waf.patch
  pushd src/mpv
  rm waf
  ./bootstrap.py
  popd
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DEST_DIR="${pkgdir}/" install
}

