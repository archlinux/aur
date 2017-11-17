# Maintainer: Karol Babioch <karol@babioch.de>
# Contributor: Oleg Rakhmanov <oleg [at] archlinuxarm [dot] org>

pkgname='unixbench'
pkgver=5.1.3
pkgrel=4
pkgdesc='UnixBench is a simple benchmark whose purpose is to provide a  basic indicator of the performance of a Unix-like system.'
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
license=('GPL')
url="https://github.com/kdlucas/byte-unixbench"
depends=('perl')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kdlucas/byte-unixbench/archive/v${pkgver}.tar.gz"
    'no-make.patch'
    'use_volatile.patch'
    'make_maxcopies_unbound_for_misc_and_system_suites.patch'
    'unreasonable_multicore-whetstone_results_fix.patch'
    'modern_compiler_optimizations.patch'
    'ubench')

sha256sums=('3a6bb00f270a5329682dff20fd2c1ab5332ef046eb54a96a0d7bd371005d31a3'
            '4b12e902ff32ffd82fd2db889b21617f1eafaa42f9335b24d28b217e70175003'
            'cd7dbd374630fa4dafae7388f5535be63d32a33c681cab0da2ead499e0805948'
            'd574a7b4c21f764ab62c9e0bc8f9f7f3704c0655618c63e6cff32925c9fe0895'
            '138e57267273e83f4f701246498f783e7066cea4ecc58658079d6f673041fda9'
            'aba3d5aa768d99763ab7cb662e4f34ba395c1342ae2f72623b1eafe2e5682b1b'
            'bfbb545d11fb9b5c695c4cee0fe8a9e28f1e934c0058423d37531c9bcf711f44')

prepare() {
   cd "${srcdir}/byte-unixbench-${pkgver}/UnixBench"

   patch -Np1 -i ${srcdir}/no-make.patch
   patch -Np1 -i ${srcdir}/use_volatile.patch
   patch -Np2 -i ${srcdir}/make_maxcopies_unbound_for_misc_and_system_suites.patch
   patch -Np1 -i ${srcdir}/unreasonable_multicore-whetstone_results_fix.patch
   patch -Np1 -i ${srcdir}/modern_compiler_optimizations.patch
}

build() {
   cd "${srcdir}/byte-unixbench-${pkgver}/UnixBench"

   make
}

package() {
   cd "${srcdir}/byte-unixbench-${pkgver}/UnixBench"

   install -dm775 ${pkgdir}/usr/bin/unixbench
   cp -a {pgms,results,testdir,tmp,Run} ${pkgdir}/usr/bin/unixbench
   cp ${srcdir}/ubench ${pkgdir}/usr/bin/
   
   chmod 775 ${pkgdir}/usr/bin/ubench
   chmod 775 ${pkgdir}/usr/bin/unixbench/Run
   chmod ugoa+w ${pkgdir}/usr/bin/unixbench/{results,testdir,tmp}
}

