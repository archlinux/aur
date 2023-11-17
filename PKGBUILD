# Maintainer: Bipin Kumar <kbipinkumar@pm.me>

pkgname=spaln
pkgver=3.0.2
pkgrel=2
pkgdesc='Splicing-aware transcript (cDNA/EST or protein sequences) alignment to genomic DNA'
arch=('x86_64')
url='https://github.com/ogotoh/spaln'
license=('GPL2')
depends=('zlib' 'perl' 'glibc' 'gcc-libs')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ogotoh/spaln/archive/refs/tags/ver${pkgver}.tar.gz"
        "spaln.sh"
        "spaln.csh"
        "harden.patch::https://patch-diff.githubusercontent.com/raw/ogotoh/spaln/pull/65.diff")
sha256sums=('830e02617c90cd9f245b406e29d4ab03fe29712832eff837ce24431db14a5555'
            '9a0b4fa808ab2d88d277cbe5d49b6ed02eff768c45409cba70d4132230ca676d'
            '9b77f3a31dd260703a8cefc6416794fc0ddb04999cd5078be9c5a287664561d1'
            '689b5e7166a03dcb8c62d47bc526bf3df6aa085dbbfd4fb215b4dcb6518ca63b')

prepare() {
  cd ${pkgname}-ver${pkgver}/src
  patch -p2 < "${srcdir}"/harden.patch
  CFLAGS=${CFLAGS} ./configure --exec_prefix=/usr/bin --table_dir=/usr/share/spaln/table --alndbs_dir=/usr/share/spaln/seqdb
  
}

build() {
  cd ${pkgname}-ver${pkgver}/src 
  make -j1
  
}

package() {
  cd ${pkgname}-ver${pkgver}/src
  make DESTDIR=${pkgdir} install
  # set paths to tables and alndbs
  install -dm755 "${pkgdir}"/etc/profile.d/
  install -Dm644 "${srcdir}"/spaln.sh -t "${pkgdir}"/etc/profile.d/
  install -Dm644 "${srcdir}"/spaln.csh -t "${pkgdir}"/etc/profile.d/
  cd ..
  # man page
    install -Dm0644 "spaln.1" -t "$pkgdir/usr/share/man/man1"
    install -Dm0644 "sortgrcd.1" -t "$pkgdir/usr/share/man/man1"

}
