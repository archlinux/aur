# Maintainer: George Tokmaji <tokmajigeorge@gmail.com>
# Contributor:
pkgbase=clonk_rage-git
pkgname=legacyclonk-git
pkgver=r433.e70d3d3
pkgrel=1
pkgdesc="An entertaining, action-packed game of strategy, tactics, and skill."
arch=('i686' 'x86_64')
url="http://clonk.de"
license=('ISC' 'CCPL:by-nc' 'custom:trademark')
groups=('games')
provides=('clonk_rage-git' 'clonk_rage' 'legacyclonk')
replaces=('clonk_rage-git')
conflicts=('clonk_rage' 'legacyclonk')

depends=('libxpm' 'sdl_mixer' 'gtk2' 'libpng12'
         'libjpeg-turbo' 'desktop-file-utils' 'timidity++' 'glew')

makedepends=('git' 'cmake' 'make' 'zip')

source=(
    "$pkgname::git+https://github.com/legacyclonk/LegacyClonk#branch=master"
    'https://github.com/legacyclonk/content/releases/download/continuous-master/LC_Content.zip'
    )

md5sums=('SKIP' 'SKIP')
options=('!strip')
_directory='legacyclonk'

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$pkgname"
  rm 'licenses/LGPL.txt'
  rm 'licenses/OpenSSL.txt'
}

build() {
  cd "$pkgname"
  cmake . -DCMAKE_PREFIX_PATH='/usr' -DCMAKE_BUILD_TYPE=RelWithDebInfo -DWITH_DEVELOPER_MODE=ON
  make
}
package() {
  cd "$pkgname"
  
  C4GROUP='./c4group' tools/make_System.c4g.sh
  C4GROUP='./c4group' tools/make_Graphics.c4g.sh
  
  # create directories
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  install -d "$pkgdir"/usr/share/icons/hicolor/48x48/mimetypes

  # install licenses
  install -Dm644 licenses/clonk_{trademark,source}_license.txt "$pkgdir/usr/share/licenses/$pkgname/"
  
  mkdir --parents $pkgdir/usr/share/$_directory || true
  
  install -Dm774 clonk $pkgdir/usr/share/$_directory/clonk
  install -Dm774 c4group $pkgdir/usr/share/$_directory/c4group
  
  install -Dm644 {System,Graphics}.c4g "$pkgdir"/usr/share/$_directory
  
  unzip -o ../../LC_Content.zip -d .
  install -Dm644 *.c4? "$pkgdir"/usr/share/$_directory
  
  # install icons
  install -dm644 /usr/share/icons/hicolor/48x48/apps
  install -Dm644 src/res/lc.png "$pkgdir"/usr/share/icons/hicolor/48x48/apps
  
  install -dm644 /usr/share/icons/hicolor/scalable/mimetypes
  install -Dm644 -t "$pkgdir"/usr/share/icons/hicolor/scalable/mimetypes src/res/c4{d,f,g,k,p,s,u}.ico 
  
  # desktop launcher
  #mkdir --parents $pkgdir/usr/share/applications || true
  install -Dm644 "$srcdir"/../legacyclonk.desktop "$pkgdir"/usr/share/applications/legacyclonk.desktop
  
  # mime types
  install -Dm644 "$srcdir"/../legacyclonk.xml "$pkgdir"/usr/share/mime/packages/legacyclonk.xml
}
