# Maintainer: boscowitch <boscowitch@boscowitch.de>

pkgname=advcp
pkgver=8.25
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
sha256sums=("31e67c057a5b32a582f26408c789e11c2e8d676593324849dcf5779296cdce87"
            "SKIP"
            "357034a0dca1a5f2e8fc3a0fabe0268c378192449c4094f690e3f900f7a5ae7f")
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
