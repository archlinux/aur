# Maintainer : Alois Nešpor <info@aloisnespor.info>
# Contributor : Pedro Martinez-Julia <pedromj@um.es>

pkgname=libva-intel-driver-g45-h264
epoch=1
pkgver=2.4.0
pkgrel=2
pkgdesc="VA-API implementation for Intel G45 chipsets with H264 support."
arch=('i686' 'x86_64')
url='https://01.org/linuxmedia/vaapi'
pkgdesc='Video Acceleration (VA) API for Linux'
depends=('libdrm' 'libgl' 'glibc' 'libva>=2.0.0')
conflicts=('libva-intel-driver' 'intel-gpu-tools')
provides=('libva-intel-driver')
replaces=('libva-intel-driver')
optdepends=('libva-utils: Applications and Scripts for libva (vainfo and others)')
license=(MIT)
makedepends=(mesa)

source=(https://bitbucket.org/alium/g45-h264/downloads/intel-driver-g45-h264-$pkgver-2.tar.gz
	gcc10.patch gcc10-2.patch)

prepare () {
  cd intel-vaapi-driver
  # Only relevant if intel-gpu-tools is installed,
  # since then the shaders will be recompiled
  sed -i '1s/python$/&2/' src/shaders/gpp.py

  # fix gcc10 errors
  patch -Np1 -i ../gcc10.patch
  patch -Np1 -i ../gcc10-2.patch
}

build() {
  cd $srcdir/intel-vaapi-driver
  ./autogen.sh --prefix=/usr
  make
}


package() {
    cd intel-vaapi-driver
    make DESTDIR="${pkgdir}" install
    install -m644 -D COPYING ${pkgdir}/usr/share/licenses/${pkgname}/COPYING
}

sha256sums=('6850c0e519b09bd720bab8bdbf8e53974c44fec7ebca7389990cd1262ce35f09'
            'ca9db2bace98932deadc1301d57194b8ad777ecb43b31b10e76b2b6b1ac2bfd9'
            'f87c8398a26faf50fa23769a3bbbedb865ced964a2257a14211eb3434c4a5658')
