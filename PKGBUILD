# Maintainer: Vincent B. <vb AT luminar.eu.org>
pkgname=klong
pkgver=20221212
pkgrel=1
pkgdesc="A simple array language"
arch=('armv7h' 'aarch64' 'x86_64')
url="http://t3x.org/klong"
license=("CC0")
source=("http://t3x.org/klong/klong${pkgver}.tgz"
        "vplot.patch"
        "editor.patch")
sha256sums=('5e1a4877228a3c643a99dbfd2d73e60bc3fa856e2615ac2fe78c80370e7f96b4'
            '60be54e072864940c728d1d792b97590886358ecf5fb8f2751f6ce2d36e5e8c5'
            'b6ab6648c783959f21cc3fbdf983218caedd7a91faafb363e4240725daa64ef5')

prepare() {
  cd ${srcdir}/${pkgname}
  patch -p0 < ../../vplot.patch
  patch -p0 < ../../editor.patch
  chmod a+r ${srcdir}/${pkgname}/lib/huffman.kg
}

build() {
  cd ${srcdir}/${pkgname}
  make
}

check() {
  cd ${srcdir}/${pkgname}
  KLONGPATH=. make test
}

package() {
  mkdir -p ${pkgdir}/usr/{bin,lib} ${pkgdir}/etc/profile.d
  cp ${srcdir}/${pkgname}/{kg,kplot} ${pkgdir}/usr/bin
  cp -a ${srcdir}/${pkgname}/lib ${pkgdir}/usr/lib/klong
  echo "KLONGPATH=/usr/lib/klong" > ${pkgdir}/etc/profile.d/klong.sh
}
