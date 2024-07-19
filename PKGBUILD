# Maintainer: Giancarlo Razzolini <grazzolini@archlinux.org>
# Contributor: Bug <bug2000@gmail.com>

pkgname=xpra-updated
pkg=xpra
pkgver=6.1.0
pkgrel=1
pkgdesc="multi-platform screen and application forwarding system screen for X11"
provides=("${pkg}=$pkgver")
conflicts=(${pkg})
arch=('x86_64')
url='https://www.xpra.org'
license=('GPL2')
depends=('gtk3' 'python' 'libxtst' 'python-cairo' 'python-gobject' 'python-pillow' 'python-lz4'
         'ffmpeg' 'libvpx' 'xf86-video-dummy' 'libxkbfile' 'libxres'
         'python-netifaces' 'python-rencode' 'python-opengl' 'python-paramiko'
         'python-lz4')
optdepends=('x264: Codec' 'python-dbus: dbus features'
            'python-pycups: Printing support'
            'python-cryptography: Cryptography'
            'python-numpy: GPU accelerated capture and compression for NVIDIA cards'
            'gst-python: Sound Forwarding'
            'opencv: Webcam Forwarding')
makedepends=('pkgconf' 'pygobject-devel' 'python-setuptools' 'cython' 'uglify-js' 'pandoc')
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
source=($pkg-$pkgver.tar.gz::https://github.com/Xpra-org/xpra/archive/refs/tags/v$pkgver.tar.gz)
        

md5sums=('a39d0c20c6227621629f7d3f357010c0')
sha1sums=('9ab1303162f3bae7f34cd9f71876a9bc731c235f')
sha256sums=('9d8c10586e5d275021e06dc88e1652075f3d9c80ca3b2682babc9e07a89f8600')
validpgpkeys=('B4993B57323148E37977E5D873254CAD17978FAF') # Xpra <xpra@xpra.org>

build() {
  cd "${srcdir}/$pkg-$pkgver"
  python setup.py build
}

package() {
  cd "${srcdir}/$pkg-$pkgver"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  sed -i 's|/build/xpra/pkg/xpra/etc/xpra/xorg.conf|/etc/xpra/xorg.conf|' "${pkgdir}"/etc/xpra/conf.d/55_server_x11.conf
  mv "${pkgdir}"/lib/* "${pkgdir}"/usr/lib/
  rmdir "${pkgdir}/lib"
  mkdir -p "${pkgdir}"/usr/share/dbus-1
  #Move D-BUS Policy
  mv "${pkgdir}"/{etc,usr/share}/dbus-1/system.d
  #Fix for FS#69804
  chmod +x "${pkgdir}"/usr/bin/*
}

