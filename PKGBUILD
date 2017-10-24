# Maintainer : Alois Nešpor <info@aloisnespor.info>
# Contributor : Pedro Martinez-Julia <pedromj@um.es>

pkgbase=libva-intel-driver-g45-h264
pkgname=(libva-g45-h264 libva-intel-driver-g45-h264)
epoch=1
pkgver=1.8.2
pkgrel=2
pkgdesc="VA-API implementation for Intel G45 chipsets with H264 support."
arch=('i686' 'x86_64')
url='https://01.org/linuxmedia/vaapi'
license=(MIT)
makedepends=(mesa)

source=(https://bitbucket.org/alium/g45-h264/downloads/intel-driver-g45-h264-$pkgver.tar.gz 
	https://github.com/01org/libva/releases/download/$pkgver/libva-$pkgver.tar.bz2
	fix_surface_querys.patch)

prepare () {
  cd intel-vaapi-driver
  #./autogen.sh --prefix=/usr
  patch -Np1 -i ../fix_surface_querys.patch
  # Only relevant if intel-gpu-tools is installed,
  # since then the shaders will be recompiled
  sed -i '1s/python$/&2/' src/shaders/gpp.py
}

build() {
  cd $srcdir/libva-${pkgver}
  ./configure \
    --prefix='/usr'
  make
  
  cd $srcdir/intel-vaapi-driver
  ./autogen.sh --prefix=/usr
  make
}

package_libva-g45-h264() {

pkgdesc='Video Acceleration (VA) API for Linux'
depends=('libdrm' 'libgl' 'libxfixes')
conflicts=('libva')
provides=('libva')
replaces=('libva')
optdepends=('libva-utils: Applications and Scripts for libva (vainfo and others)')


  cd libva-${pkgver}

  make DESTDIR="${pkgdir}" install
  install -Dm 644 COPYING -t "${pkgdir}"/usr/share/licenses/libva
}

package_libva-intel-driver-g45-h264() {

depends=('libva-g45-h264')
conflicts=('libva-intel-driver')
provides=('libva-intel-driver')
replaces=('libva-intel-driver')

    cd intel-vaapi-driver
    make DESTDIR="${pkgdir}" install
    install -m644 -D COPYING ${pkgdir}/usr/share/licenses/${pkgname}/COPYING
}

sha256sums=('86afce92c83555abf16412689f181c3a7cfeef9727109f87c373466bffb22329'
            '9ed3e3ddc8f47a715d4c6ec366beb21c83fc4e8a3d4d39a811baff76f0a0cede'
            '64bb9d0fae82adba367de0e6ee21737cdb23a7d7eed1bae9f1536af1becbae92')
