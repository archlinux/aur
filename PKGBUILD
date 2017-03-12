# Maintainer : Alois Nešpor <info@aloisnespor.info>
# Contributor : Pedro Martinez-Julia <pedromj@um.es>
# Contributor : Anugrah Redja Kusuma <anugrah.redja@gmail.com>
# Contributor : Vincent B. <vbmithr@gmail.com>

pkgname=libva-intel-driver-g45-h264
epoch=1
pkgver=1.7.3
pkgrel=3
pkgdesc="VA-API implementation for Intel G45 chipsets with H264 support."
arch=('i686' 'x86_64')
url="http://freedesktop.org/wiki/Software/vaapi"
license=('MIT')
depends=(libva)
conflicts=('libva-intel-driver')
provides=('libva-intel-driver')
replaces=('libva-intel-driver')
source=(https://bitbucket.org/alium/g45-h264/downloads/intel-driver-g45-h264-$pkgver.tar.gz
        libva-intel-driver-1.7.3-glvnd-fix.patch)

prepare () {
    cd "$srcdir"/intel-driver
    ./autogen.sh --prefix=/usr

  # Only relevant if intel-gpu-tools is installed,
  # since then the shaders will be recompiled
  sed -i '1s/python$/&2/' src/shaders/gpp.py

  # fix with libglvnd
  patch -Np1 -i ../libva-intel-driver-1.7.3-glvnd-fix.patch
}

package () {
    cd ${srcdir}/intel-driver
    make DESTDIR="${pkgdir}" install
    install -m644 -D COPYING ${pkgdir}/usr/share/licenses/${pkgname}/COPYING
}
sha256sums=('0d64274924523020b467944cfa88c0d6c11696a4b33b45f5fc92c26ec12eaeb3'
            'dc966f7957a815acdf3f281eb400bc43e2da5f117f1f7c6e6c0699524bc76ca1')
