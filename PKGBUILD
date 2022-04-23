# Maintainer: yuhldr <yuhldr@qq.com>
# Maintainer: Chan Beom Park <cbpark@gmail.com>

_pkgname=pmix
pkgname=${_pkgname}4
pkgver=4.1.2
pkgrel=3
pkgdesc='Process Management Interface Exascale'
url='https://pmix.org/'
arch=('x86_64')
license=('custom:OpenMPI')
conflicts=('pmix')
depends=('glibc' 'libevent' 'hwloc' 'zlib')
source=(https://github.com/pmix/pmix/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.bz2)
sha1sums=('64d66d1897de64d7ae3ded2f90ad9e5e676d9b32')

build() {
  cd ${_pkgname}-${pkgver}
  ./configure --prefix=/usr \
              --disable-pmi-backward-compatibility \
              --with-libevent \
              --with-zlib \
              --with-hwloc

  make -j
}

package() {
  cd ${_pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install

  rm "$pkgdir/usr/share/pmix/"help-pmix-{mca-base,mca-var,plog,psensor-file,psensor-heartbeat,runtime,server}.txt
  rm "$pkgdir/usr/share/pmix/"pmix-valgrind.supp
  rm "$pkgdir/usr/lib/pkgconfig/pmix.pc"

  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}
