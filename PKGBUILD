# Maintainer: David Christenson <david@the-david.com> 

pkgname=advcp
pkgver=8.23
pkgrel=1

_pkgname=coreutils
pkgdesc="'cp' and 'mv' utilities with progress bar patches" 
arch=("i686" "x86_64")
license=("GPL3")
url="https://www.gnu.org/software/coreutils/"
groups=("base")
depends=("glibc" "pam" "acl" "gmp" "libcap")
provides=("acp" "amv")
install=${pkgname}.install
source=(ftp://ftp.gnu.org/gnu/$_pkgname/$_pkgname-$pkgver.tar.xz{,.sig}
        advcpmv-${pkgver}.patch)
sha256sums=("ec43ca5bcfc62242accb46b7f121f6b684ee21ecd7d075059bf650ff9e37b82d"
            "SKIP"
            "296ffcd4988a4cb47588cf7fe72f3e796d78af73bf6d38ef101c542b3cfdd454")
validpgpkeys=("6C37DC12121A5006BC1DB804DF6FD971306037D9") # Pádraig Brady

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
    
  patch -p1 -i ${srcdir}/advcpmv-${pkgver}.patch

  ./configure --prefix=/usr \
              --libexecdir=/usr/lib \
              --enable-no-install-program=groups,hostname,kill,uptime
  make $MAKEFLAGS -j1
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  install -D src/cp ${pkgdir}/usr/bin/acp
  install -D src/mv ${pkgdir}/usr/bin/amv
}
