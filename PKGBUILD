# Maintainer: George Tokmaji <tokmajigeorge@gmail.com>
# Contributor:
pkgname=clonk_rage-git
pkgver=r66.aeee02d
pkgrel=1
pkgdesc="An entertaining, action-packed game of strategy, tactics, and skill."
arch=('i686' 'x86_64')
url="http://clonk.de"
license=('ISC' 'CCPL:by-nc' 'custom:trademark')
groups=('games')
provides=('clonk_rage-git', 'clonk_rage')
conflicts=('clonk_rage', 'openclonk')

depends=('glu' 'libxpm' 'sdl_mixer' 'gtk2' 'libpng12'
         'libjpeg-turbo' 'desktop-file-utils' 'timidity++' 'glew')

makedepends=('git')

source=("$pkgname::git+https://git.maxmitti.tk/lc#branch=master")

md5sums=('SKIP')

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
  cmake .
  make
}
package() {
  cd "$pkgname"
  # create directories
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  install -d "$pkgdir"/usr/share/icons/hicolor/48x48/mimetypes

  # install licenses
  install -Dm644 licenses/clonk_{trademark,source}_license.txt "$pkgdir/usr/share/licenses/$pkgname/"
  rm licenses/clonk_{trademark,source}_license.txt
  
  mkdir --parents $pkgdir/usr/share/$pkgname || true
  
  mv -f clonk $pkgdir/usr/share/$pkgname/clonk
  mv -f c4group $pkgdir/usr/share/$pkgname/c4group
  
  cd planet
  #mv * "$pkgdir"/usr/share/$pkgname
  cd ..
  
  # load game data
  if [ ! -e cr_full_linux.tar.bz2 ]
  then
    curl -O "http://www.clonkx.de/rage/cr_full_linux.tar.bz2"
  fi
  tar -xjvf cr_full_linux.tar.bz2
  cd cr_full_linux
  # rm System.c4g -- commented for now
  mv *.c4? "$pkgdir"/usr/share/$pkgname
  
  # install icons
  install -Dm644 icons/cr.png "$pkgdir"/usr/share/icons/hicolor/48x48/apps/clonk_rage.png
  install -Dm644 icons/c4{d,f,g,k,p,s,u}.png "$pkgdir"/usr/share/icons/hicolor/48x48/mimetypes/
  
  chgrp -R games "$pkgdir"/usr/share/$pkgname
  chmod -R g+w "$pkgdir"/usr/share/$pkgname
  
  # chmod exec's
  chmod 774 "$pkgdir"/usr/share/$pkgname/clonk
  chown root:root "$pkgdir"/usr/share/$pkgname/clonk
  
  chmod 774 "$pkgdir"/usr/share/$pkgname/c4group
  chown root:root "$pkgdir"/usr/share/$pkgname/c4group
  
  # c4group link
  mkdir --parents $pkgdir/usr/bin || true
  ln -s /usr/share/$pkgname/c4group "$pkgdir"/usr/bin/
  
  # desktop launcher
  mkdir --parents $pkgdir/usr/share/applications || true
  install -Dm644 "$srcdir"/../clonk_rage.desktop "$pkgdir"/usr/share/applications/clonk_rage.desktop
  
  # mime types
  install -Dm644 "$srcdir"/../de_clonk.xml "$pkgdir"/usr/share/mime/packages/clonk_rage.xml

}
