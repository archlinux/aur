# Contributor: Bug <bug2000@gmail.com>
# Maintainer: Bug <bug2000@gmail.com>
pkgname=xpra-winswitch-svn
pkgver=9586
pkgrel=2
pkgdesc="Modified version of xpra by Winswitch"
arch=('i686' 'x86_64')
url="http://xpra.org/"
license=('GPL2')
depends=('python2' 'pygtk' 'libxtst' 'python2-imaging' 'python2-lz4'
         'ffmpeg' 'libvpx' 'xf86-video-dummy' 'libwebp')
optdepends=('x264: Codec')
makedepends=('subversion' 'python2-setuptools' 'cython2')
provides=('parti-all' 'xpra-winswitch')
conflicts=('parti-all')
backup=('etc/conf.d/xpra' 'etc/xpra/xpra.conf' 'etc/xpra/xorg.conf')
install=xpra-winswitch.install
source=("xpra::svn+https://xpra.org/svn/Xpra/trunk/src"
        "xpra-winswitch.install"
        "xpra@.service"
        "xpra.conf")

md5sums=(SKIP
         'f3bdf0f695617ba4e26af55af263ba82'
         '64b2d9e10e07fc839db40dff2be6e139'
         'aa6cd03320236227b835d49a3d069300')

_svnmod=xpra
pkgver() {
      LANG=C svn info "$SRCDEST/$_svnmod" | awk '/Last Changed Rev/ {print $4}'
}

build() {
  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  #
  # BUILD HERE
  #
  python2 setup.py build || return 1  
  cd rencode
  python2 setup.py build || return 1

}

package() {
  install -Dm644 xpra@.service ${pkgdir}/usr/lib/systemd/user/xpra@.service
  install -Dm600 xpra.conf ${pkgdir}/etc/conf.d/xpra
  cd "$srcdir/$_svnmod-build"
  python2 setup.py install --root=${pkgdir} || return 1
  cd rencode
  python2 setup.py install --root=${pkgdir} || return 1
}

# vim:set ts=2 sw=2 et:
