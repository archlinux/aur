# Contributor: Bug <bug2000@gmail.com>
# Maintainer: Bug <bug2000@gmail.com>
pkgname=xpra-svn
pkgver=r22367
pkgrel=1
pkgdesc="multi-platform screen and application forwarding system screen for X11"
arch=('x86_64')
url='https://www.xpra.org'
license=('GPL2')
depends=('python2' 'pygtk' 'libxtst' 'python2-pillow' 'python2-lz4'
         'ffmpeg' 'libvpx' 'xf86-video-dummy' 'libxkbfile'
         'python2-netifaces' 'python2-numpy' 'python2-rencode' 'python2-opengl'
         'python2-gtkglext' 'python-lz4' 'python-opengl')
optdepends=('x264: Codec' 'python2-dbus: dbus features'
            'python2-pycups: Printing support'
            'python2-cryptography: Cryptography'
            'python-cryptography: Cryptography'
            'gst-python2: Sound Forwarding'
            'opencv: Webcam Capture')
conflicts=('xpra')
provides=('xpra')
makedepends=('subversion' 'python2-setuptools' 'cython2' 'uglify-js')
backup=('etc/xpra/xpra.conf' 'etc/xpra/xorg.conf'
        'etc/xpra/conf.d/05_features.conf'
        'etc/xpra/conf.d/10_network.conf'
        'etc/xpra/conf.d/12_ssl.conf'
        'etc/xpra/conf.d/15_file_transfers.conf'
        'etc/xpra/conf.d/16_printing.conf'
        'etc/xpra/conf.d/20_sound.conf'
        'etc/xpra/conf.d/30_picture.conf'
        'etc/xpra/conf.d/35_webcam.conf'
        'etc/xpra/conf.d/40_client.conf'
        'etc/xpra/conf.d/42_client_keyboard.conf'
        'etc/xpra/conf.d/50_server_network.conf'
        'etc/xpra/conf.d/55_server_x11.conf'
        'etc/xpra/conf.d/60_server.conf'
        'etc/xpra/conf.d/65_proxy.conf'
        'etc/pam.d/xpra')
source=("xpra::svn+https://xpra.org/svn/Xpra/trunk/src")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-svn}"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

build() {
  cd "${srcdir}/${pkgname%-svn}"

  export pkgdir
  python2 setup.py build --without-enc_x265
}

package() {
  cd "${srcdir}/${pkgname%-svn}"
  python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build --without-enc_x265
  sed -i 's|/build/xpra/pkg/xpra/etc/xpra/xorg.conf|/etc/xpra/xorg.conf|' "${pkgdir}"/etc/xpra/conf.d/55_server_x11.conf
  mv "${pkgdir}"/lib/* "${pkgdir}"/usr/lib/
  rmdir "${pkgdir}/lib"
  mkdir -p "${pkgdir}"/usr/share/dbus-1
  #Move D-BUS Policy
  mv "${pkgdir}"/{etc,usr/share}/dbus-1/system.d
}

# vim:set ts=2 sw=2 et:
