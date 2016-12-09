# Contributor: Bug <bug2000@gmail.com>
# Maintainer: Bug <bug2000@gmail.com>
pkgname=xpra-winswitch
pkgver=1.0
pkgrel=1
pkgdesc="Modified version of xpra by Winswitch"
arch=('i686' 'x86_64')
url='http://xpra.org/'
license=('GPL2')
depends=('python2' 'pygtk' 'libxtst' 'python2-pillow' 'python2-lz4'
         'ffmpeg' 'libvpx' 'xf86-video-dummy' 'libwebp' 'libxkbfile'
         'python2-numpy' 'rencode' 'python2-opengl'
         'python2-gtkglext' 'python-lz4' 'python-opengl' 'python2-opengl')
optdepends=('x264: Codec' 'python2-dbus: dbus features'
            'python2-pycups: Printing support' 'python2-netifaces: mdns'
            'python2-cryptography: Cryptography'
            'python-cryptography: Cryptography'
            'python2-crypto: Cryptography'
            'python-crypto: Cryptography')
conflicts=('parti-all')
provides=('parti-all')
makedepends=('python2-setuptools' 'cython2')
backup=('etc/xpra/xpra.conf' 'etc/xpra/xorg.conf')
install=xpra-winswitch.install
source=("https://xpra.org/src/xpra-$pkgver.tar.xz"
        "xpra-winswitch.install")
sha256sums=('87b7c4e4bd4afe40363b23add4b3246004c8a027b305faee23b6063761c3826a'
            'ae7cffba6c132517ef4bd41d107ac665d4319dd7f7f606898884e0885cf4ce8f')

build() {
  cd ${srcdir}/xpra-$pkgver
  #python2 setup.py build || return 1
  CFLAGS="$CFLAGS -fno-strict-aliasing" python2 setup.py build || return 1
}

package() {
  cd ${srcdir}/xpra-$pkgver
  python2 setup.py install --root=${pkgdir} || return 1
  sed -i -e '/^xvfb\s*=\s*Xorg/s/Xorg/xpra_Xdummy/' ${pkgdir}/etc/xpra/xpra.conf
  mkdir -p ${pkgdir}/usr/lib/sysusers.d
  echo g xpra - - > ${pkgdir}/usr/lib/sysusers.d/xpra.conf
}
