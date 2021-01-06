# Maintainer:  Vincent Grande <shoober420@gmail.com
# Contributor: Florian Pritz <bluewind@xinu.at>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Christoph Vigano <mail at cvigano dot de>
# Contributor: Biru Ionut <ionut@archlinux.ro>
# Contributor: Pierre Schmitz <pierre@archlinux.de>
# Contributor: Mikko Seppälä <t-r-a-y@mbnet.fi>

_pkgbasename=gnutls
pkgname=lib32-$_pkgbasename-git
pkgver=3.7.0
pkgrel=1
pkgdesc="A library which provides a secure layer over a reliable transport layer (32-bit)"
arch=('x86_64')
license=('GPL3' 'LGPL2.1')
url="https://gnutls.org/"
depends=('lib32-zlib' 'lib32-nettle' 'lib32-p11-kit' 'lib32-libtasn1' 'lib32-libidn2' $_pkgbasename)
makedepends=('gcc-multilib')
provides=(lib32-gnutls)
conflicts=(lib32-gnutls)
source=("git+https://gitlab.com/gnutls/gnutls.git")
sha256sums=('SKIP')
#validpgpkeys=('0424D4EE81A0E3D119C6F835EDA21E94B565716F'  # "Simon Josefsson <simon@josefsson.org>"
#              '1F42418905D8206AA754CCDC29EE58B996865171'  # "Nikos Mavrogiannopoulos <nmav@gnutls.org>
#              '462225C3B46F34879FC8496CD605848ED7E69871') # "Daiki Ueno <ueno@unixuser.org>"

pkgver() {
  cd gnutls
  git describe --tags | sed 's/-/+/g'
}

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd ${_pkgbasename}

  # disable libidn for security reasons:
  # http://lists.gnupg.org/pipermail/gnutls-devel/2015-May/007582.html

  ./bootstrap
  ./configure --prefix=/usr --libdir=/usr/lib32 --build=i686-pc-linux-gnu \
    --with-zlib \
    --with-included-unistring \
    --disable-static \
    --disable-guile \
    --disable-valgrind-tests
  make
}

#check() {
#  cd ${_pkgbasename}
  #make -k check
#}

package() {
  cd ${_pkgbasename}
  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}"/usr/{bin,include,share}
}
