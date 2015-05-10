# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=mkxp-git
pkgver=r745.794e86d
pkgrel=1
pkgdesc="Open source implementation of the Ruby Game Scripting System of RPG Maker XP/VX/VX Ace (development version)"
arch=('i686' 'x86_64')
url="https://github.com/Ancurio/mkxp"
license=('GPL2')
depends=('ruby' 'physfs-hg' 'sdl2-hg' 'sdl2_image' 'sdl2_ttf' 'sdl_sound-patched-hg'
         'pixman' 'openal' 'boost-libs' 'libgl' 'libsigc++' 'fluidsynth-git')
makedepends=('git' 'boost' 'cmake' 'mesa' 'vim')
conflicts=('mkxp')
provides=('mkxp')
install=mkxp.install
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
  cd mkxp
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd mkxp

  # get the major and minor version of installed ruby, remove any strings (like beta, patchlevel)
  _rubyver=$(pacman -Q ruby | sed -r 's/^ruby //;s/\.[^\.]+-.+$//;s/[^0-9\.]//')
  # check for validity, for example rubinius-ruby provides ruby, but cannot be used (no library)
  [ -z $_rubyver ] && exit 1

  cmake ./ -DMRIVERSION=$_rubyver -DWORKDIR_CURRENT=ON -DSHARED_FLUID=ON
  make
}

package() {
  cd mkxp

  # install architecture dependent executeable
  install -Dm755 mkxp.bin.x* "$pkgdir"/usr/bin/mkxp

  # install documentation
  install -Dm644 README.md "$pkgdir"/usr/share/doc/mkxp/README.md
  install -m644 mkxp.conf.sample "$pkgdir"/usr/share/doc/mkxp
}
