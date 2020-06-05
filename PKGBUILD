# Contributor: Bug <bug2000@gmail.com>
# Maintainer: Bug <bug2000@gmail.com>
pkgname=xpra-svn
pkgver=r26625
pkgrel=1
pkgdesc="multi-platform screen and application forwarding system screen for X11"
arch=('x86_64')
url='https://www.xpra.org'
license=('GPL2')
depends=('gtk3' 'python' 'libxtst' 'python-cairo' 'python-gobject' 'python-pillow' 'python-lz4'
         'ffmpeg' 'libvpx' 'xf86-video-dummy' 'libxkbfile'
         'python-netifaces' 'python-rencode' 'python-opengl'
         'python-lz4')
optdepends=('x264: Codec' 'python-dbus: dbus features'
            'python-pycups: Printing support'
            'python-cryptography: Cryptography'
            'python-numpy: GPU accelerated capture and compression for NVIDIA cards'
            'gst-python: Sound Forwarding'
            'opencv: Webcam Forwarding')
conflicts=('xpra')
provides=('xpra')
makedepends=('subversion' 'python-setuptools' 'cython' 'uglify-js')
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
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname%-svn}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  sed -i 's|/build/xpra/pkg/xpra/etc/xpra/xorg.conf|/etc/xpra/xorg.conf|' "${pkgdir}"/etc/xpra/conf.d/55_server_x11.conf
  mv "${pkgdir}"/lib/* "${pkgdir}"/usr/lib/
  rmdir "${pkgdir}/lib"
  mkdir -p "${pkgdir}"/usr/share/dbus-1
  #Move D-BUS Policy
  mv "${pkgdir}"/{etc,usr/share}/dbus-1/system.d
}

# vim:set ts=2 sw=2 et:
