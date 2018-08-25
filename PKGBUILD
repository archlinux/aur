# Maintainer: Ainola
# Contributor: Ner0
# Contributor: quantax
# Contributor: xyproto

pkgname=ags
pkgver=3.4.1.14
pkgrel=1
pkgdesc='A development tool that is primarily used to create graphical adventure games'
arch=('i686' 'x86_64')
url='https://github.com/adventuregamestudio/ags'
license=('Artistic2.0')
depends=('allegro4' 'dumb-a4' 'libogg' 'libtheora' 'libvorbis')
makedepends=('wxgtk')
optdepends=('wine: for installing and configuring the game')
source=("https://github.com/adventuregamestudio/ags/archive/v.${pkgver}.tar.gz"
        'https://github.com/adventuregamestudio/ags/commit/44d954493bb5f3e95a11a4eddbb62bd6110b1b63.patch')
sha256sums=('4ca76b919689c68a9fda4bd56bfb63268ab5326a539ce4d681ac4ed6a908b51c'
            '6b7092e5794ae532f79c5c6ad5f5761c217b3ec874da43537152fb8e60b20019')

prepare() {
  # Copious use of auto_ptr spams the compilation output. Until they're
  # replaced, just suppress the message.
  sed -i 's/-Wfatal-errors/-Wfatal-errors\ -Wno-deprecated-declarations/' \
    "ags-v.$pkgver/Engine/Makefile-defs.linux"

  # avoid conflicts with glibc functions with the same names
  cd "$srcdir/ags-v.${pkgver}"
  patch -p1 < ../44d954493bb5f3e95a11a4eddbb62bd6110b1b63.patch
}

build() {
  cd "$srcdir/ags-v.${pkgver}"
  make -C Engine
}

package() {
  install -Dm755 "$srcdir/ags-v.${pkgver}/Engine/ags" \
                 "$pkgdir/usr/bin/ags"
  install -Dm644 "$srcdir/ags-v.${pkgver}/License.txt" \
                 "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2 sw=2 et
