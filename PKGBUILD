# Maintainer: Bipin Kumar <kbipinkumar@pm.me> 
# Previous Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname=centrifuge
pkgver=1.0.4.2
pkgrel=1
pkgdesc="Rapid and memory-efficient tool for classification of metagenomic sequences"
arch=('x86_64')
url=https://ccb.jhu.edu/software/centrifuge/
license=('GPL3')
depends=(
         'glibc'
         'gcc-libs'
         'python'
         'perl'
         'bash'
         'jellyfish'
         'hisat2'
        )
makedepends=('git' 'inetutils' 'pandoc')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/DaehwanKimLab/centrifuge/archive/refs/tags/v${pkgver}.tar.gz"
        'alphabet.cpp.patch'
        'alphabet.h.patch'
        'centrifuge-build.patch'
        'centrifuge_evaluate_mason.py.patch'
        'centrifuge_evaluate.py.patch'
        'centrifuge-inspect.patch'
        'centrifuge_simulate_reads.py.patch'
        'Makefile.patch'
        )
sha256sums=('db142790522a72971c7deda7d22e1f29fce54dbf23afc2e40def9f5a764f4c99'
            'ae9334ddd0cb9b09811969c151350c4e5ee73452fe5d00f01fd7cf23d6573d78'
            'f681bd2fd89429245ff092b689d53c7e119a5f1270a414b8629896fd5ced90f5'
            '12be02a7c3b63679703874b45b6491c81402bac7159859936fe4c78a47632ded'
            'ee6e4c8d8b3d12c141bfeff1aa8c7afd027259d8aa0d1380f6854d4619d868ad'
            'ad05064999c0da91866c82063e42ef60107142acc878fde0342bd629d26d3e68'
            'bf19a2b9e4ef745227eb593d93543020d31726e38d000c6a0091aeb0c3931ffc'
            'f4268c3aa84fc1e14281470251217c1a4a36317c6ad93fc772ea4a46218a3a67'
            'e523ba32ad8163db09fd516a51756f726434dbbe2a2dd9697a5e6a6d606097c1')

prepare() {
  cp *.py.patch ${pkgname}-${pkgver}/evaluation
  cp *.patch ${pkgname}-${pkgver}/
  cp ${pkgname}-${pkgver}/evaluation/centrifuge_evaluate_mason.py.patch ${pkgname}-${pkgver}/evaluation/test
  cd "${pkgname}-${pkgver}"
  # patch Makefile to be inline with archlinux build guidelines
    patch -p1 < Makefile.patch
  # patch for arm compatibility (not tested fully)
    patch -p1 < alphabet.cpp.patch
    patch -p1 < alphabet.h.patch
  # patch scripts for python3 compatibility
    patch -p1 < centrifuge-build.patch
    patch -p1 < centrifuge-inspect.patch
  cd evaluation
    patch -p1 < centrifuge_evaluate.py.patch
    patch -p1 < centrifuge_simulate_reads.py.patch
  cd test
    patch -p1 < centrifuge_evaluate_mason.py.patch
}

build() {
  cd "${pkgname}-${pkgver}"
  make prefix="/usr"
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR=${pkgdir} install
}
