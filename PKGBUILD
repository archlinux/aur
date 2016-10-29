# Contributor: Bug <bug2000@gmail.com>
# Maintainer: Bug <bug2000@gmail.com>
pkgname=xpra-winswitch
pkgver=0.17.6
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
        "xpra-winswitch.install"
        'xpra@.service')
sha256sums=('f266df26c866699ec71fe7e33e71d38e397563230f0bb12f8b20bc422a2afbfc'
            'ae7cffba6c132517ef4bd41d107ac665d4319dd7f7f606898884e0885cf4ce8f'
            'b882f72380ca6bdee9580e839440dd5bd3523b9db804095887127b9cce6cfaf2')

build() {
  cd ${srcdir}/xpra-$pkgver
  #python2 setup.py build || return 1
  #CFLAGS="$CFLAGS -Wno-error=deprecated-declarations" && export CFLAGS
  CFLAGS="$CFLAGS -fno-strict-aliasing" python2 setup.py build || return 1
}

package() {
  install -Dm644 'xpra@.service' "$pkgdir/usr/lib/systemd/user/xpra@.service"
  cd ${srcdir}/xpra-$pkgver
  python2 setup.py install --root=${pkgdir} || return 1
  sed -i -e '/^xvfb\s*=\s*Xorg/s/Xorg/xpra_Xdummy/' ${pkgdir}/etc/xpra/xpra.conf
  mkdir -p ${pkgdir}/usr/lib/sysusers.d
  echo g xpra - - > ${pkgdir}/usr/lib/sysusers.d/xpra.conf
}
