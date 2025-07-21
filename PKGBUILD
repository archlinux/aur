# Maintainer: Lone_Wolf <Lone_Wolf@klaas-de-kat.nl>
# Contributor: Evert Vorster <superchief@evertvorster.com>

pkgname=oolite-git
pkgver=1.91.0.7684.250719.75e511b.r0.75e511b31
pkgrel=2
pkgdesc="Open Source remake of Elite with many, many enhancements"
arch=('x86_64')
url="https://oolite.space/"
license=('GPL-2.0-or-later')
groups=('game')
depends=(espeak gnustep-base gnustep-make glu nspr openal
         libpng14 gcc-libs libglvnd glibc zlib sdl12-compat bash
         libvorbis)
makedepends=(curl zip libx11 gcc-objc git)
source=(oolite-git::git+https://github.com/OoliteProject/oolite
        oolite-git.sh
        linux-force-use-of-libpng14.patch
)

sha512sums=('SKIP'
            '2d0431cc2cdfa82c9c7f897d2f2311519a9b5ef9f73fb276a445bdd4e834d5a9ed0f4442223b6c3703d899ce1b072b1db66548fab65782a8cd1b492a56c3793a'
            'd0b77a8375bdaadef9a79d287abcb2941b6b50e9e7f8d400d89ec384eaacabaa12353d5d3432b8e8714bae687c3026748e781ab104cc6ad96b81590cf6eac743')

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
  patch -Np1 -i "$srcdir"/linux-force-use-of-libpng14.patch
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
