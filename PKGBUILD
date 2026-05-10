# Maintainer: Lone_Wolf <Lone_Wolf@klaas-de-kat.nl>
# Contributor: Evert Vorster <superchief@evertvorster.com>

pkgname=oolite-git
pkgver=1.93.0.7815.260502.f71e5c6.r2.bc26e9105
pkgrel=2
pkgdesc="Open Source remake of Elite with many, many enhancements, git version"
arch=('x86_64')
url="https://oolite.space/"
license=('GPL-2.0-or-later')
groups=('game')
depends=(bash libglvnd glibc zlib gnustep-base hicolor-icon-theme libstdc++ libobjc libgcc 
          espeak-ng glu nspr openal sdl12-compat sdl2-compat libvorbis libpng gnustep-make)
makedepends=(gcc-objc git mozillajs-linux-bin)
source=(oolite-git::git+https://github.com/OoliteProject/oolite
        oolite-git.sh
)

sha512sums=('SKIP'
            'cecba38425516b6479baf7f24dec24ec13d68ef943ac15810625a64ea80d8d1d90823ea801dfc7402f3df37fe25f8f7b6385964bf5f80839cb09230ca4ea99c5')
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
  
  install -D -m755 "$srcdir"/oolite-git.sh "$pkgdir"/usr/bin/oolite-git.sh
  install -D -m644 Resources/Textures/oolite-logo1.png "$pkgdir"/usr/share/icons/hicolor/256x256/apps/space.oolite.Oolite.png
  
  sed -e 's:Name=oolite:Name=oolite--git:' \
      -e 's:Exec=run_oolite.sh:Exec=/usr/bin/oolite-git.sh:' \
      -e 's:StartupWMClass=oolite:StartupWMClass=oolite-git:' \
      <installers/FreeDesktop/space.oolite.Oolite.desktop \
      >"$pkgdir"/usr/share/applications/space.oolite.Oolite-git.desktop
  chmod 644 "$pkgdir"/usr/share/applications/space.oolite.Oolite-git.desktop
}
