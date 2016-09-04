# shellcheck shell=bash
# shellcheck disable=SC2034,SC2148,SC2154
# Maintainer: Zeke Sonxx <zeke@zekesonxx.com>
# Contributer: Matjaz Mozetic <rationalperseus@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Lauri Niskanen <ape@ape3000.com>
# Contributor: Sebastian.Salich@gmx.de
# Contributor: Doc Angelo

# Based both on the community/mumble package and the old lib32-libmumble package.
# https://git.archlinux.org/svntogit/community.git/tree/trunk/PKGBUILD?h=packages/mumble
# http://pkgbuild.com/git/aur-mirror.git/tree/lib32-libmumble/PKGBUILD

pkgname=lib32-libmumble
pkgver=1.2.16
pkgrel=1
arch=('x86_64')
pkgdesc="A voice chat application similar to TeamSpeak (32-bit overlay library)"
license=('BSD')
depends=("mumble=$pkgver" 'lib32-libgl')
makedepends=('boost' 'mesa' 'gcc-multilib')
url="http://mumble.sourceforge.net/"
source=("https://github.com/mumble-voip/mumble/releases/download/${pkgver}/mumble-${pkgver}.tar.gz")
md5sums=('58e7574af80e36e0b943df0e6a44d6ce')
sha512sums=('8624d4db8ae135dae780bd5743f50d3a4740c5b983d18da6a19803e340fbac939204bac81b34d55a114e963b33eddefc292bc3cfea3827431ded5cad5284e565')

build() {
  cd "$srcdir/mumble-$pkgver/overlay_gl" || exit

  qmake-qt4 overlay_gl.pro QMAKE_CFLAGS+="-m32" QMAKE_LFLAGS+="-m32"
  make
}

package() {
  cd "$srcdir/mumble-$pkgver" || exit

  # lib stuff
  install -m755 -D "./release/libmumble.so.$pkgver" "$pkgdir/usr/lib32/mumble/libmumble.so.$pkgver"
  ln -s "libmumble.so.$pkgver" "$pkgdir/usr/lib32/mumble/libmumble.so"
  ln -s "libmumble.so.$pkgver" "$pkgdir/usr/lib32/mumble/libmumble.so.1"
  ln -s "libmumble.so.$pkgver" "$pkgdir/usr/lib32/mumble/libmumble.so.1.2"

  # license
  install -d "$pkgdir/usr/share/licenses"
  ln -s "/usr/share/licenses/mumble" "$pkgdir/usr/share/licenses/$pkgname"
}
