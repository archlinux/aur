# Maintainer:
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Angelo Theodorou <encelo@users.sourceforge.net>
# Contributor: Lex Rivera <aur@x-demon.org>
# Contributor: Gianluca Sforna <giallu@fedoraproject.org>

pkgname=alleyoop
pkgver=0.9.8
pkgrel=8
pkgdesc='Valgrind front-end for the GNOME environment'
arch=(x86_64)
url='https://alleyoop.sourceforge.net/'
license=(GPL2)
depends=(gconf gtk2 valgrind)
makedepends=(gnome-common)
source=("https://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz"
        "https://roboticoverlords.org/$pkgname/$pkgname"{16,32,64,128,256}.png
        git-fixes.patch)
sha256sums=('0b36fd3af83aa74d363a5d13414b7a38c3efabd2fce0fbeb2a8171998e0b6756'
            '470287270aafada00fc1be9e47713a62b44836fca677a0a2ea29f2bcbd46926f'
            '9f461fa169ee7fd43a1d58bc0c4afe4f807437b7d585ac4445390dac7590f4af'
            '9e33d888ef45ae520ce8610507af6a7867e3c3cfe99beab2040a7d42e44dc1e0'
            'c32c5a900f4521599c497f15e8f3edb7125ebcc7571ceaa2f9ebfe45fa2dfe27'
            '15f4fb65a102cefd9e80cdb7a7cf8ab6be02e1d773a75536396076c1136875bd'
            '4717940eea026bf2b38ca704a35c2a7169c84315554768e1a39265522a509014')

prepare() {
  cd $pkgname-$pkgver
  patch -Np1 -i ../git-fixes.patch
  ./autogen.sh
}

build() {
  cd $pkgname-$pkgver
  ./configure \
    --prefix=/usr \
    --disable-schemas-install \
    --with-gconf-schema-file-dir=/usr/share/gconf/schemas
  make
}

package() {
  make -C $pkgname-$pkgver DESTDIR="$pkgdir" install
  for dim in 16 32 64 128 256; do
    install -Dm644 "${pkgname}${dim}.png" \
      "$pkgdir/usr/share/icons/hicolor/${dim}x$dim/apps/$pkgname.png"
  done
}

# vim:ts=2 sw=2 et:
