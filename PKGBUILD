# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: Marco Süß <m_a_r_c_o.suess at gmx.de>

_pkgname=lash
pkgname=lib32-$_pkgname
pkgver=0.6.0~rc2
_relver=0.6.0.594
pkgrel=3
pkgdesc="A session management system for JACK and ALSA (32-bit)"
arch=('x86_64')
url="http://lash.nongnu.org"
license=('GPL')
depends=('lash' 'lib32-dbus' 'jack' 'lib32-util-linux')
makedepends=('gcc-multilib' 'libtool-multilib' 'lib32-python2')
optdepends=('lib32-python2: Python bindings')
source=("http://download.savannah.gnu.org/releases/lash/${_pkgname}-${pkgver}.tar.bz2")
md5sums=('af1dc4f4ceb284b1b0845de4f4c2fe47')

build() {
  cd "${srcdir}/${_pkgname}-${_relver}"

  # We can't put the python includes in *FLAGS since that way they would be
  # overwritten with the 64-bit ones by the build system of lash
  export CC='gcc -m32 -I/usr/lib32/python2.7/include/python2.7'
  export CXX='g++ -m32 -I/usr/lib32/python2.7/include/python2.7'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  export PYTHON='/usr/bin/python2-32'

  ./configure --prefix=/usr \
              --libdir=/usr/lib32 \
              --enable-static=no
  make -C liblash
  make -C pylash
}

package() {
  cd "${srcdir}/${_pkgname}-${_relver}"

  make install-pkgconfigDATA DESTDIR="${pkgdir}"
  make -C liblash install DESTDIR="${pkgdir}"
  make -C pylash install DESTDIR="${pkgdir}"
}
