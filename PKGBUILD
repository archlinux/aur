# Maintainer: Bipin Kumar <bipin@ccmb.res.in>

pkgname=spaln
pkgver=2.4.13f
pkgrel=1
pkgdesc='Splicing-aware transcript (cDNA/EST or protein sequences) alignment to genomic DNA'
arch=('x86_64')
url='https://github.com/ogotoh/spaln'
license=('GPL2')
depends=('zlib' 'perl')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ogotoh/spaln/archive/refs/tags/ver.${pkgver}.tar.gz"
        "spaln.sh"
        "spaln.csh"
        "destdir.patch")
sha256sums=('024fdcf58e38373983092280a7e10ff9c7e246e7d2465c165e158512e686225e'
            '9a0b4fa808ab2d88d277cbe5d49b6ed02eff768c45409cba70d4132230ca676d'
            '9b77f3a31dd260703a8cefc6416794fc0ddb04999cd5078be9c5a287664561d1'
            'b78d8bf6c79cee8aa0a06e5aa61098041d46a468275fda911883d356866f8a8f')

prepare() {
  cp destdir.patch ${pkgname}-ver.${pkgver}/src
  cp spaln.* ${pkgname}-ver.${pkgver}/src
  cd ${pkgname}-ver.${pkgver}/src
  # patch to enable support for GNU make's staged install process
  patch -p1 < destdir.patch 
  CXX=g++ CFLAGS="-O2" ./configure --exec_prefix=/usr/bin --table_dir=/usr/share/spaln/table --alndbs_dir=/usr/share/spaln/seqdb --use_zlib=1
}

build() {
  cd ${pkgname}-ver.${pkgver}/src
  make -j1
}

package() {
  cd ${pkgname}-ver.${pkgver}/src
  make DESTDIR=${pkgdir} install
  # set paths to tables and alndbs
  install -dm755 "${pkgdir}"/etc/profile.d/
  install -Dm644 spaln.sh -t "${pkgdir}"/etc/profile.d/
  install -Dm644 spaln.csh -t "${pkgdir}"/etc/profile.d/

}
