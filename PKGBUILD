# Maintainer: Kef Schecter <furrykef@gmail.com>
# Contributor: Josip Ponjavic <josipponjavic at gmail dot com>

pkgname=lincity
pkgver=1.13.1
pkgrel=1
pkgdesc="A free construction and management simulation game"
arch=('i686' 'x86_64')
url="http://lincity.sourceforge.net/"
license=('GPL2')
depends=('libice' 'libpng' 'libsm' 'libx11' 'libxext')
options=(!emptydirs)
source=("http://http.debian.net/debian/pool/main/l/$pkgname/${pkgname}_${pkgver}.orig.tar.gz"
        "http://http.debian.net/debian/pool/main/l/$pkgname/${pkgname}_${pkgver}-13.debian.tar.xz")
sha256sums=('7b4cbd11ffd4cbed79a0aadb25f2b1c34e25a8201182fbb259ce2f450fe5015d'
            '618faf140325c03715ae2c29d040a24381693475a54e7bc9b6a18c4d9870170b')

prepare() {
  cd "$pkgname-$pkgver"
  for i in $(grep -v '#' $srcdir/debian/patches/series); do
    msg "Applying ${i}"
    patch -p1 -i "$srcdir/debian/patches/${i}"
  done
}

build() {
  cd "${pkgname}-${pkgver}"
  autoreconf -fi
  ./configure \
    --prefix=/usr \
    --bindir=/usr/bin \
    --mandir=/usr/share/man \
    --with-gzip \
    --with-x- \
    --without-svga \
    --disable-rpath
  make V=1
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm755 xlincity "$pkgdir/usr/bin/xlincity"
  ln -sf /usr/bin/xlincity "$pkgdir/usr/bin/lincity"
  ln -sf /usr/share/man/man6/lincity.6.gz "$pkgdir/usr/share/man/man6/xlincity.6.gz"
  install -Dm644 ../debian/lincity.xpm "$pkgdir/usr/share/pixmaps/lincity.xpm"
  install -Dm644 ../debian/lincity.desktop "$pkgdir/usr/share/applications/lincity.desktop"
  sed -i 's|usr/games|usr/bin|' "$pkgdir/usr/share/applications/lincity.desktop"
}

