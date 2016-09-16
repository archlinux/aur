# Maintainer: Ainola
# Contributor: Ner0
# Contributor: quantax

pkgname=ags
pkgver=3.4.0.12
pkgrel=1
pkgdesc="A development tool that is primarily used to create graphical adventure games"
arch=('i686' 'x86_64')
url="https://github.com/adventuregamestudio/ags"
license=('Artistic2.0')
depends=('allegro' 'dumb' 'libogg' 'libtheora' 'libvorbis')
makedepends=('wxgtk')
optdepends=('wine: for installing and configuring the game')
install=ags.install
source=("https://github.com/adventuregamestudio/ags/archive/v.${pkgver}.tar.gz"
        "fix-cpp-11-mode.patch")
sha256sums=('64422a3ad7ed1d78d207158f6d8a67499e6d0b50a9dd6438d086373ac66d1a76'
            '67ba92334c08626cec954edca5e164fdb619d690e518685402632be9ea4348ce')

prepare() {
  # Fixes https://github.com/adventuregamestudio/ags/issues/356 until an
  # official release
  patch -p1 -d "$srcdir/ags-v.${pkgver}" < fix-cpp-11-mode.patch

  cd "$srcdir/ags-v.${pkgver}"
  sed -i 's/-Wfatal-errors\ //' Engine/Makefile-defs.linux
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
