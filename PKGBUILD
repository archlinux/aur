# Maintainer: batot <archpackager @ algrim . pl>
# Contributor: Jelle van der Waa <jelle@archlinux.org>
# Contributor: Grey Christoforo <my first name [at] my last name [dot] net>

pkgname=cura
pkgver=5.3.0
pkgrel=1
pkgdesc="A software solution for 3D printing aimed at RepRaps and the Ultimaker."
depends=('python-pyqt5' 'qt5-svg' 'python-scipy' 'python-pyserial' 'python-numpy' 'uranium' 'python-requests'
         'curaengine' 'libsavitar' 'qt5-graphicaleffects'
         'python-certifi' 'python-pynest2d' 'python-keyring' 'python-trimesh'
         'cura-resources-materials')
makedepends=('qt5-tools' 'cmake')
optdepends=('python-zeroconf: network printing support'
            'python-trimesh: Reading AMF files'
            'python-libcharon: UFPWriter/UFPReader'
            'cura-binary-data: Binary data (firmwares and such) for cura')

provides=('cura')
url="https://ultimaker.com/software/ultimaker-cura"
license=('LGPL')
arch=('any')
source=($pkgname-$pkgver.tar.gz::https://github.com/Ultimaker/Cura/archive/${pkgver}.tar.gz
        cura-${pkgver}-no-sentry.patch::https://github.com/Ultimaker/Cura/commit/aad41807c365ccef001b787407d7dc756e11de02.patch)
sha512sums=('79421486e89082a0b9f9435e778193f26d067c87fa52dbd277113da5614d5ce340d676aacdc1193bd2ab76de8c9456163bf983181d8d213e96b1af25b4a6b713'
            'c602c5e585862d9bab280a8d5bd2289fe1b10d79f54cd76171b76fcf48793b190ff5bf6fca22818d8b65a726ee64098750c79cba67f044e0186a83aeb78e8a14')

# Build order
# arcus -> uranium -> curaengine -> libsavitar -> pynest2d ->

#prepare(){
#  cd $srcdir/Cura-${pkgver}
#  sed -i 's,/dist-packages,.${PYTHON_VERSION_MINOR}/site-packages,g' CMakeLists.txt
#  patch -Np1 -i $srcdir/cura-${pkgver}-no-sentry.patch
#}

build(){
  cd Cura-${pkgver}
  mkdir -p build
  cd build
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DURANIUM_SCRIPTS_DIR=/usr/share/uranium/scripts \
    -DCURA_VERSION=$pkgver \
    -DCURA_SDK_VERSION=6.0.0 \
    -DCURA_CLOUD_API_VERSION=1 \
    -DCURA_CLOUD_API_ROOT:STRING="https://api.ultimaker.com" \
    -DCURA_CLOUD_ACCOUNT_API_ROOT:STRING="https://account.ultimaker.com"

  make
}

package(){
  cd Cura-${pkgver}/build
  make DESTDIR="${pkgdir}" install

  # make sure cura can find uranium plugins:
  # ln -s /usr/lib/uranium/plugins/* "${pkgdir}/usr/lib/cura/plugins/."

  # don't ever send any user or print info through the internet to Ultimaker
  rm -rf "${pkgdir}/usr/lib/cura/plugins/SliceInfoPlugin"
}
