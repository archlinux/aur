# Maintainer: Lone_Wolf <Lone_Wolf@klaas-de-kat.nl>
# Contributor: Evert Vorster <superchief@evertvorster.com>

pkgname=oolite-git
pkgver=1.93.0.7809.260501.626c8d9.r0.626c8d98a
pkgrel=1
pkgdesc="Open Source remake of Elite with many, many enhancements, git version"
arch=('x86_64')
url="https://oolite.space/"
license=('GPL-2.0-or-later')
groups=('game')
depends=(bash libglvnd glibc zlib gnustep-base hicolor-icon-theme libstdc++ libobjc libgcc 
          espeak-ng glu nspr openal sdl12-compat sdl2-compat libvorbis libpng)
makedepends=(gnustep-make gcc-objc git mozillajs-linux-bin)
source=(oolite-git::git+https://github.com/OoliteProject/oolite
        oolite-git.sh
)

sha512sums=('SKIP'
            'c76629108a3c2bc3975208e4d9a1b51fb6688b59c08c4cd1b189b317492fe08b7d78b77076baafd550cec9c64ab083b52035a1b7244c7776149927e2294c3d18')
options=(!strip)

pkgver() {
  git -C oolite-git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}


build() {
  cd $pkgname
  source /usr/share/GNUstep/Makefiles/GNUstep.sh
  make -f Makefile release
}

package() {
  cd $pkgname

  mkdir -p "$pkgdir"/usr/bin
  mkdir -p "$pkgdir"/usr/share/{oolite-git,applications,icons/hicolor/256x256/apps}
  cp -r oolite.app/* "$pkgdir"/usr/share/oolite-git/
  # remove files not needed/wanted for archlinux
  rm "$pkgdir"/usr/share/oolite-git/run_oolite.sh
  
  install -D -m755 "$srcdir"/oolite-git.sh "$pkgdir"/usr/bin/oolite-git.sh
  install -D -m644 Resources/Textures/oolite-logo1.png "$pkgdir"/usr/share/icons/hicolor/256x256/apps/space.oolite.Oolite.png
  
  sed -e 's:Name=oolite:Name=oolite--git:' \
      -e 's:Exec=run_oolite.sh:Exec=/usr/bin/oolite-git.sh:' \
      -e 's:StartupWMClass=oolite:StartupWMClass=oolite-git:' \
      <installers/FreeDesktop/space.oolite.Oolite.desktop \
      >"$pkgdir"/usr/share/applications/space.oolite.Oolite-git.desktop
  chmod 644 "$pkgdir"/usr/share/applications/space.oolite.Oolite-git.desktop
}
