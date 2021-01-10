# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Laurent Carlier <lordheavym@gmail.com>
# Contributor: Florian Pritz <bluewind@xinu.at>
# Contributor: josephgbr <rafael.f.f1 at gmail.com>

_pkgbase=libtasn1
pkgname=lib32-${_pkgbase}-git
pkgver=4.16.0
pkgrel=1
pkgdesc="The ASN.1 library used in GNUTLS (32 bit)"
arch=('x86_64')
license=('GPL3' 'LGPL')
url="https://www.gnu.org/software/libtasn1/"
depends=('lib32-glibc' ${_pkgbase})
makedepends=('gcc-multilib')
provides=(lib32-libtasn1)
conflicts=(lib32-libtasn1)
source=("git+https://gitlab.com/gnutls/libtasn1.git")
sha256sums=('SKIP')
#validpgpkeys=('1F42418905D8206AA754CCDC29EE58B996865171') #Nikos Mavrogiannopoulos <nmav@gnutls.org>

pkgver() {
  cd libtasn1
  git describe --tags | sed 's/-/+/g'
}

build() {
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cd ${_pkgbase}

  ./bootstrap
  ./configure --prefix=/usr \
      --libdir=/usr/lib32 \
      --with-packager=Archlinux \
      --with-packager-bug-reports="http://bugs.archlinux.org/" \
      --with-packager-version=${pkgver}-${pkgrel}
  make
}

package() {
  cd ${_pkgbase}

  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}/usr/"{bin,include,share}
}
