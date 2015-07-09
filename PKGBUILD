# Maintainer: David Christenson <david@the-david.com> 

pkgname=advcp
pkgver=8.24
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
sha256sums=("a2d75286a4b9ef3a13039c2da3868a61be4ee9f17d8ae380a35a97e506972170"
            "SKIP"
            "3e4a9aa16c5aa7177d375310e4035717cbd1ba3b311c44458c8c2fa99f630eed")
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
