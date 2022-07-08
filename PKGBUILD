# Maintainer: Eden Rose(endlesseden) <eden "at" rose.place >
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Matthew Bowra-Dean <matthew@ijw.co.nz>
#
pkgname=openra-git
pkgver=20220709.ga03e794140
pkgrel=1
pkgdesc="An open-source implementation of the Red Alert engine using .NET/Mono and OpenGL. -GIT VERSION"
arch=('x86_64' 'i386' 'i686' 'pentium4' 'core2' 'armv6h' 'armv7h' 'armv8h' 'armv9h' 'arm64')
url="http://www.openra.net"
license=('GPL3')
install=openra.install
depends=('mono' 'ttf-dejavu' 'openal' 'libgl' 'freetype2' 'sdl2' 'lua51' 'hicolor-icon-theme' 'gtk-update-icon-cache'
         'desktop-file-utils' 'xdg-utils' 'zenity')
optionaldepends=('openra-ra2-git: An OpenRA mod inspired by Command and Conquer: Red Alert 2' 'openra-d2-git: A Dune II-inspired mod of OpenRA' 'openra-yr-git:A Command and Conquer: Yuri's Revenge-inspired mod of OpenRA' 'openra-ca-git: A mod of OpenRA that combines units from the official Red Alert and Tiberian Dawn mods' 'openra-dr-git: A Dark Reign-inspired mod of OpenRA' 'openra-gen-git: A mod of OpenRA based on Command and Conquer: Generals' 'openra-kknd-git: A Krush, Kill n' Destroy-inspired mod of OpenRA' 'openra-mw-git: An mod of OpenRA depicting medieval warfare' 'openra-raclassic-git: A mod of OpenRA that more faithfully recreates the Command and Conquer: Red Alert game' 'openra-radot5-git: OpenRA mod that tell the storyline between 1936 to Red Alert 1' 'openra-raplus-git: A Command and Conquer: Red Alert-inspired mod of OpenRA' 'openra-rv-git: A Command and Conquer: Red Alert 2-inspired mod of OpenRA' 'openra-sp-git: A Tiberian Sun-inspired mod of OpenRA' 'openra-ss-git: A Sole Survivor-inspired mod of OpenRA, warning you will need the original game assets to play this game' 'openra-ura-git: A Command and Conquer: Red Alert-inspired mod of OpenRA' 'dotnet-sdk: Proprietary Microsoft dot.net(mono) SDK. Used in place of mono-msbuild' 'dotnet-runtime: Proprietary Microsoft dot.net(mono) Runtime. Replaces Mono Runtime')
makedepends=('git' 'unzip' 'mono-msbuild' 'msbuild')
provides=('openra')
conflicts=('openra')
options=(!strip)

source=($pkgname::'git+https://github.com/OpenRA/OpenRA.git#branch=bleed')
md5sums=('SKIP')



pkgver() {
  cd "$srcdir"/"$pkgname"
  
  DATE="$(date +%Y%m%d)"
  PV=$(git name-rev --name-only --tags --no-undefined HEAD 2>/dev/null || echo git-`git rev-parse --short HEAD`) ### get GIT version
  echo "$DATE"$PV | sed -e 's/git-/.g/g' 
}

build() {
  cd "$srcdir"/"$pkgname"
    make all RUNTIME=mono DEBUG=false TARGETPLATFORM=unix-generic  
}

package() {
  cd "$srcdir"/"$pkgname"
  mkdir -p "$pkgdir"/usr/bin "$pkgdir"/usr/share "$pkgdir"/usr/lib/openra # Those pesky directories... That install cant create? why...

  make prefix=/usr DESTDIR="$pkgdir" install DEBUG=false RUNTIME=mono
  make prefix=/usr DESTDIR="$pkgdir" install-linux-shortcuts DEBUG=false
  make prefix=/usr DESTDIR="$pkgdir" install-linux-appdata DEBUG=false
  
 make clean 
 mkdir -p $pkgdir/usr/lib/openra/src
 cp -r "$srcdir"/"$pkgname" "$pkgdir"/usr/lib/openra/src/ #Source for building OpenRA mods against ^_^

}
