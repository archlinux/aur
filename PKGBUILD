# Maintainer: Sébastien Luttringer

pkgname=cnijfilter-mx880
pkgver=3.50_1
pkgrel=1
pkgdesc='Canon IJ Printer Driver for Pixma MX885'
arch=('i686' 'x86_64')
url='http://software.canon-europe.com/software/0040869.asp'
license=('custom')
depends=('libglade' 'cups' 'ghostscript' 'popt')
source=("http://files.canon-europe.com/files/soft40869/software/cnijfilter-source-${pkgver//_/-}.tar.gz"
        'cups.patch'
        'id.po.patch'
        'png.patch')
md5sums=('a900a47246c3d17d1ed5ed801ee29787'
         'f0b3e72bbf0b0426aa31f52eac755f49'
         '8440dbf3edd142e746d0b3043d6307b2'
         'da5fcef8eef444ea1d049bc75323611a')

prepare() {
  patch -Np0 -i cups.patch
  patch -Np0 -i id.po.patch
  patch -Np0 -i png.patch
}

build() {
  cd cnijfilter-source-${pkgver//_/-}

  for _d in backend libs pstocanonij cngpij ppd cnijfilter printui lgmon cngpijmon; do
    msg2 "$_d"
    pushd "$_d"
    ./autogen.sh \
      --prefix=/usr \
      --program-suffix=mx880 \
      --enable-progpath=/usr/bin \
      --enable-binpath=/usr/bin \
      --enable-libpath=/usr/lib/bjlib \
      --datadir=/usr/share
    make
    popd
  done
}

package() {
  cd cnijfilter-source-${pkgver//_/-}

  for _d in backend libs pstocanonij cngpij ppd cnijfilter printui lgmon cngpijmon; do
    msg2 "$_d"
    pushd "$_d"
    make install DESTDIR="$pkgdir"
    popd
  done
  install -Dm644 LICENSE-cnijfilter-${pkgver%_*}EN.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  ln -s pstocanonijmx880 "$pkgdir/usr/lib/cups/filter/pstocanonij"
  install -dm755 "$pkgdir/usr/lib/bjlib"
  install -m 755 383/database/* "$pkgdir/usr/lib/bjlib"
  case $CARCH in
    i686) install -m 755 383/libs_bin32/*.so.* "$pkgdir/usr/lib";;
    x86_64) install -m 755 383/libs_bin64/*.so.* "$pkgdir/usr/lib";;
  esac
}

# vim:set ts=2 sw=2 et:
