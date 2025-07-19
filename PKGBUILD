# Maintainer: Lone_Wolf <Lone_Wolf@klaas-de-kat.nl>
# Contributor: Evert Vorster <superchief@evertvorster.com>

pkgname=oolite-git
_gitname=oolite-git
pkgver=1.91.0.7683.250717.68de802.r0.68de80200
pkgrel=1.3
pkgdesc="Open Source remake of Elite with many, many enhancements"
arch=('x86_64')
url="https://oolite.space/"
license=('GPL-2.0-or-later')
groups=('game')
depends=(espeak gnustep-base sdl_mixer sdl_image glu nspr openal
         libpng gcc-libs libglvnd glibc zlib sdl12-compat bash
         libvorbis)
makedepends=(gnustep-make curl zip mesa gcc-objc git)
source=($_gitname::git+https://github.com/OoliteProject/oolite
        oolite-git.sh)

sha512sums=('SKIP'
            '9eacfddce04dcc91df12038be04387abd508e2e16248561d15c92c173d5b94a363d6b8fa4df644c07732b2cb484aaa0c11b7a07e56295e2d30a87de59f760aef')

pkgver() {
  git -C oolite-git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}


prepare(){
  cd oolite-git
  echo "Initialize Submodules"
  cp .absolute_gitmodules .gitmodules
  git submodule update --init

  echo "Updating git submodules"
  git checkout -- .gitmodules

  # Workaround for -Werror=format-security default flag from GNUstep
#  sed -Ei 's|(include \$\(GNUSTEP_MAKEFILES\)/common\.make)|\1\nCCFLAGS += -Wno-error=format-security\nOPTFLAG += -Wno-error=format-security|' GNUmakefile
}


build() {
  cd oolite-git
  source /usr/share/GNUstep/Makefiles/GNUstep.sh
  make -f Makefile release \
    OBJCFLAGS+="-Wno-format-security"
}

package() {
  cd oolite-git

  mkdir -p "$pkgdir"/usr/bin
  mkdir -p "$pkgdir"/usr/share/{oolite-git,applications,pixmaps,doc/oolite-git}
  cp -r oolite.app/* "$pkgdir"/usr/share/oolite-git/
  install -D -m755 "$srcdir"/oolite-git.sh "$pkgdir"/usr/bin/oolite-git.sh
  install -D -m644 installers/FreeDesktop/oolite-icon.png "$pkgdir"/usr/share/pixmaps/oolite-icon-git.png
  
      sed -e 's:Name=Oolite:Name=oolite--git:' \
        -e 's:Exec=oolite:Exec=/usr/bin/oolite-git.sh:' \
        -e 's:Icon=oolite-icon:Icon=/usr/share/pixmaps/oolite-icon-git.png:' \
        -e 's:StartupWMClass=oolite:StartupWMClass=oolite-git:' \
        <installers/FreeDesktop/oolite.desktop \
        >oolite-git.desktop

  install -D -m644 oolite-git.desktop "$pkgdir"/usr/share/applications/oolite-git.desktop
  install -D -m644 Doc/AdviceForNewCommanders.pdf Doc/OoliteReadMe.pdf Doc/OoliteRS.pdf "$pkgdir"/usr/share/doc/oolite-git/
}
