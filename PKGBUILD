# Maintainer: yuhldr <yuhldr@qq.com>
# Maintainer: Chan Beom Park <cbpark@gmail.com>

pkgname=pmix
pkgver=3.2.3
pkgrel=3
pkgdesc='Process Management Interface Exascale'
url='https://pmix.org/'
arch=('x86_64')
license=('custom:OpenMPI')
conflicts=('pmix4')
depends=('glibc' 'libevent' 'hwloc' 'zlib')
source=(https://github.com/pmix/pmix/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.bz2)
sha1sums=('97978abcd4da1b2a3d2bf2452247c4d47f8cc6a3')

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr \
              --disable-pmi-backward-compatibility \
              --with-libevent \
              --with-zlib \
              --with-hwloc
  make -j
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install

  rm "$pkgdir/usr/share/pmix/"help-pmix-{mca-base,mca-var,plog,psensor-file,psensor-heartbeat,runtime,server}.txt
  rm "$pkgdir/usr/share/pmix/"pmix-valgrind.supp
  rm "$pkgdir/usr/lib/pkgconfig/pmix.pc"

  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
