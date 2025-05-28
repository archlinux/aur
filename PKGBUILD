# Maintainer: gilcu3
# Previous Maintainer: Karol Babioch <karol@babioch.de>
# Contributor: Oleg Rakhmanov <oleg [at] archlinuxarm [dot] org>

pkgname='unixbench'
pkgver=6.0.0
pkgrel=1
pkgdesc='UnixBench is a simple benchmark whose purpose is to provide a  basic indicator of the performance of a Unix-like system.'
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
license=('GPL')
url="https://github.com/kdlucas/byte-unixbench"
depends=('perl')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kdlucas/byte-unixbench/archive/refs/tags/v${pkgver}.tar.gz"
    'no-make.patch'
    'ubench')

sha256sums=('c151d28b6f4f3f40faad19e877c1ab06fbd4b3da006ccfa26b36200c741fc3ba'
            'a1cb8aba9d0a3bbf4215f8b56efbc1aed2a0d0a592d6955275d15be49a8122e4'
            '8dda604fbb8cbec355c220965b0a014f8efcee1218d2df763aad6d4f9d8a8a21')


prepare() {
   cd "${srcdir}/byte-unixbench-${pkgver}/UnixBench"
   patch -Np1 -i ${srcdir}/no-make.patch
}

build() {
   cd "${srcdir}/byte-unixbench-${pkgver}/UnixBench"
   CFLAGS="${CFLAGS} -std=gnu17"
   make
}

package() {
   cd "${srcdir}/byte-unixbench-${pkgver}/UnixBench"

   install -dm775 ${pkgdir}/usr/lib/unixbench
   cp -a {pgms,results,testdir,tmp,Run} ${pkgdir}/usr/lib/unixbench
   install -Dm755 ${srcdir}/ubench ${pkgdir}/usr/bin/ubench

   chmod 775 ${pkgdir}/usr/bin/ubench
   chmod 775 ${pkgdir}/usr/lib/unixbench/Run
   chmod ugoa+w ${pkgdir}/usr/lib/unixbench/{results,testdir,tmp}
}

