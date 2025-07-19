# Maintainer: Lone_Wolf <Lone_Wolf@klaas-de-kat.nl>
# Contributor: Evert Vorster <superchief@evertvorster.com>

pkgname=oolite-git
_gitname=oolite-git
pkgver=1.91.0.7683.250717.68de802.r0.68de80200
pkgrel=1
pkgdesc="Open Source remake of Elite with many, many enhancements"
arch=('x86_64')
url="https://oolite.space/"
license=('GPL-2.0-or-later')
groups=('game')
depends=(espeak gnustep-base sdl_mixer sdl_image glu nspr openal
         libpng gcc-libs libglvnd glibc zlib sdl12-compat bash
         libvorbis)
makedepends=(gnustep-make curl zip mesa gcc-objc)
provides=('oolite')
conflicts=('oolite')
source=($_gitname::git+https://github.com/OoliteProject/oolite
        oolite)

sha512sums=('SKIP'
            '4591184f3190b1b8fa3ee9c324811259c0fb0c1a82ce748f3d2b898675df11efc4496a98fa3d1a2dde7d4c8ed88d7a99d9c54ec6adf9a79961664e05cfa4e397')

pkgver() {
  git -C $_gitname describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}


prepare(){
  cd $_gitname
  echo "Initialize Submodules"
  cp .absolute_gitmodules .gitmodules
  git submodule update --init

  echo "Updating git submodules"
  git checkout -- .gitmodules

  # Workaround for -Werror=format-security default flag from GNUstep
  sed -Ei 's|(include \$\(GNUSTEP_MAKEFILES\)/common\.make)|\1\nCCFLAGS += -Wno-error=format-security\nOPTFLAG += -Wno-error=format-security|' GNUmakefile
}


build() {
  cd $_gitname
  source /usr/share/GNUstep/Makefiles/GNUstep.sh
  make -f Makefile release
}

package() {
  cd $_gitname

  mkdir -p "$pkgdir"/usr/bin
  mkdir -p "$pkgdir"/usr/share/{oolite,applications,pixmaps,doc/oolite}
  cp -r oolite.app/* "$pkgdir"/usr/share/oolite/
  install -D -m755 ../../oolite "$pkgdir"/usr/bin/oolite
  install -D -m644 installers/FreeDesktop/oolite-icon.png "$pkgdir"/usr/share/pixmaps/oolite-icon.png
  install -D -m644 installers/FreeDesktop/oolite.desktop "$pkgdir"/usr/share/applications/oolite.desktop
  install -D -m644 Doc/AdviceForNewCommanders.pdf Doc/OoliteReadMe.pdf Doc/OoliteRS.pdf "$pkgdir"/usr/share/doc/oolite/
}
