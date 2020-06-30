# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=libpurple-lurch
pkgver=0.6.8
pkgrel=4
pkgdesc='Plugin for libpurple (Pidgin, Adium, etc) implementing OMEMO (using axolotl)'
arch=('x86_64')
url='https://github.com/gkdr/lurch'
license=('GPL')
makedepends=('cmake' 'git')
depends=('libpurple' 'mxml' 'libxml2' 'sqlite' 'libgcrypt')
optdepends=('libpurple-carbons: message carbons support')
source=("git+https://github.com/gkdr/lurch.git#tag=v${pkgver}"
        'git+https://github.com/gkdr/axc'
        'git+https://github.com/gkdr/libomemo'
        'git+https://github.com/WhisperSystems/libsignal-protocol-c.git')
b2sums=('SKIP'
        'SKIP'
        'SKIP'
        'SKIP')

prepare() {
  cd ${pkgname##libpurple-}
  git submodule init
  git config submodule.'lib/axc'.url "${srcdir}"/axc
  git config submodule.'lib/libomemo'.url "${srcdir}"/libomemo
  git submodule update --recursive
  cd lib/axc
  git config submodule.'lib/libsignal-protocol-c'.url "${srcdir}"/libsignal-protocol-c
  cd "${srcdir}"/${pkgname##libpurple-}
  git submodule update --recursive
}

build() {
  cd ${pkgname##libpurple-}
  make
}

package() {
  cd ${pkgname##libpurple-}
  make DESTDIR="${pkgdir}" install
}
