# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=kobodeluxe
pkgver=0.5.1
pkgrel=12
pkgdesc='3rd person scrolling 2D shooter'
arch=(x86_64)
url='http://www.olofson.net/kobodl/'
license=(GPL LGPL)
depends=(hicolor-icon-theme sdl_image)
source=("http://www.olofson.net/kobodl/download/KoboDeluxe-${pkgver}.tar.gz"
        kobodeluxe-gcc-4.3.patch
        kobodeluxe-0.5.1-glibc2.10.patch)
b2sums=('7dd17b4613a467428b09274f7374b921c2d2b40cfed83b019b665e61240bfa097160e3bd4ca09a48264b1ec02653a8ef6218d753dc5631fa8d2f9001856fcb91'
        '566b474b40eea4bf7abb3d414beb3bac38576a534ac105db8814eb890f5ad2ffd77d245a083395c60b4b73f07e0cadf52e6c40befb0664254da7f4f168f1d559'
        'c539d01a3f3dbedaf90503aba74a4a54754fb9d9e82dace7b0b6a5832aed757c260415816cf41ff75a3cfdee3b7616303f031647706f7b514e98c0e85a6beb01')

prepare() {
  cd KoboDeluxe-$pkgver
  patch -p0 -i ../kobodeluxe-gcc-4.3.patch
  patch -p0 -i ../kobodeluxe-0.5.1-glibc2.10.patch
  tar xf icons.tar.gz
  # Fix paths, thanks Gentoo!
  sed -i \
    -e 's:\$(datadir)/kobo-deluxe:$(datadir)/kobodeluxe:' \
    -e 's:\$(sharedstatedir)/kobo-deluxe/scores:$(localstatedir)/kobodeluxe:' \
    configure
  sed -i -e 's:kobo-deluxe:kobodeluxe:' data/{gfx,sfx}/Makefile.in
}

build() {
  cd KoboDeluxe-$pkgver
  ./configure --localstatedir=/var --prefix=/usr --sharedstatedir=/var/games
  make
}

package() {
  cd KoboDeluxe-$pkgver
  DESTDIR="$pkgdir" make install
  ln -s /usr/bin/kobodl "$pkgdir/usr/bin/kobodeluxe"
  install -D -m644 icons/KDE/kobo-deluxe.desktop \
    "$pkgdir/usr/share/applications/kobodeluxe.desktop"
  for i in 16 22 32 48 64 128 ; do
    install -Dm644 icons/KDE/icons/${i}x$i/kobodl.png \
      "$pkgdir/usr/share/icons/hicolor/${i}x$i/apps/kobodl.png"
  done
}
