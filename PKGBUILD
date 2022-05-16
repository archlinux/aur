# Maintainer: 3ED <krzysztof1987 _at_ gmail _dot_ com>

pkgname=milena
pkgver=0.2.95
pkgrel=1
pkgdesc="a Polish speech synthesizer for Linux"
arch=('i686' 'x86_64')
url="http://milena.polip.com/"
license=('GPL')
depends=('milena-data' 'mbrola-voices-pl1' 'enca' 'antiword' 'odt2txt' 'poppler' 'libao' 'sox')
install=milena.install
optdepends=('milena-basewords: for milena_book'
            'lame: for milena_book'
            'vorbis-tools: for milena_book'
            'faac: for milena_book'
            'amrwb: for milena_nokia'
            'ImageMagick: for milena_nokia')
source=(http://www.polip.com/files/$pkgname-dist-$pkgver.tar.gz
        10-makefile-fix.patch
        20-build_without_data_archive.patch
        40-archlinux_package.patch)
sha512sums=('95c90b515df40cdadbf298bb89270dea3b64d9c08c21a870a11ab8cc333414bdfb1535368aee87a8fac0767dc52935f611f68527ad91c438f62bd9a01e420db6'
            '8166da0000e3e8f7c2503f04049ed1c527d67cf1715474a84dfcafce8d727b104d38d19aa76f7ce467a0645823edd36c7e482e58bd309059a5543d3b5c30c1f1'
            '9b38b09353e1bee86af9956c983d9a43f5827dac74ca1f91c74ae8587e93a2b2fae7800de100d8f27b7b36a21f7148ad07291ae5995fdeffc768a1a2802ccb32'
            '43cd6e0760f63319336df8c5915509324672d30a2ca70d2d9653dc60871839892dcca087d2b641474330a114a0c9773ab9304832c86ca5027499a777c8613eeb')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  for (( i=0; i < ${#source[@]}; i++ )); do
    if [ "${source[i]##*.}" = "patch" ]; then
      msg2 "Applying patch: ${source[i]##*/}"
      patch -Np1 -i "${srcdir}/${source[i]##*/}"
    fi
  done
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make prefix="/usr"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" prefix="/usr" install

  # 54 fix
  test -d "$pkgdir"/usr/lib64 \
    && mv "$pkgdir"/usr/lib{64,}
}

