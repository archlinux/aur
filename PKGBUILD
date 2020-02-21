# Maintainer: adambot <adambot@gmail.com>
# Contributor: boscowitch <boscowitch@boscowitch.de>

pkgname=advcp
pkgver=8.31
pkgrel=1

_pkgname=coreutils
pkgdesc="'cp' and 'mv' utilities with progress bar patches" 
arch=("i686" "x86_64")
license=("GPL3")
url="https://www.gnu.org/software/coreutils/"
groups=("base")
depends=("glibc" "pam" "acl" "gmp" "libcap")
provides=("acp" "amv" "advcp" "advmv" "cpg" "mvg")
install=${pkgname}.install
source=(ftp://ftp.gnu.org/gnu/$_pkgname/$_pkgname-$pkgver.tar.xz
        https://raw.githubusercontent.com/jarun/advcpmv/master/advcpmv-0.8-8.31.patch)
sha256sums=("ff7a9c918edce6b4f4b2725e3f9b37b0c4d193531cac49a48b56c4d0d3a9e9fd"
            "57cd37e98e52aeae7657b5f79489c2457e83ef7d80f5c42a4ae2865170b572ad")

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
    
  patch -p1 -i ${srcdir}/advcpmv-0.8-${pkgver}.patch

  ./configure --prefix=/usr \
              --libexecdir=/usr/lib \
              --enable-no-install-program=groups,hostname,kill,uptime
  make $MAKEFLAGS -j1
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  install -D src/cp ${pkgdir}/usr/bin/advcp
  ln -s advcp ${pkgdir}/usr/bin/acp
  ln -s advcp ${pkgdir}/usr/bin/cpg
  install -D src/mv ${pkgdir}/usr/bin/advmv
  ln -s advmv ${pkgdir}/usr/bin/amv
  ln -s advmv ${pkgdir}/usr/bin/mvg
}
