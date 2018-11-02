# Maintainer: adambot <adambot@gmail.com>
# Contributor: boscowitch <boscowitch@boscowitch.de>

pkgname=advcp
pkgver=8.30
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
        https://raw.githubusercontent.com/mrdrogdrog/advcpmv/master/advcpmv-0.8-8.30.patch)
sha256sums=("e831b3a86091496cdba720411f9748de81507798f6130adeaef872d206e1b057"
            "9954d975554f3c06b518d4d17c5247ef751fe8f29d692799e79c9386ab4a1c1b")

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
