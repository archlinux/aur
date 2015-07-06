# Maintainer: Stefan Seemayer <mail@semicolonsoftware.de>
pkgname=invedit-git
pkgver=20120305
pkgrel=1
pkgdesc="Minecraft Inventory Editor"
arch=(any)
url="http://www.minecraftforum.net/topic/14190-invedit/"
license=('GPL')
groups=()
depends=( mono )
makedepends=('git')
provides=()
conflicts=( invedit )
replaces=()
backup=()
options=()
install=invedit.install
source=(http://mirror.mcmyadmin.com/copyboy/INVedit/INVedit.zip invedit.desktop)
noextract=()
md5sums=('ce1429a56881ba3e2eaa5a64bc25821c'
         '8a74dfee530af3181a8c3b0ec50cf4b7')
_gitroot="git://github.com/copyboy/INVedit.git"
_gitname="invedit"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  sed -i".bak" -e 's/this\.btnUpdate,/\/\/this.btnUpdate/g' MainForm.Designer.cs

  #
  # BUILD HERE
  #

  xbuild || exit 1

}

package() {
  cd "$srcdir/$_gitname-build/bin/Debug/"
  
  mkdir -p $pkgdir/usr/{bin,share/{pixmaps,applications,invedit}}
  install -Dm755 "INVedit.exe" "NBT.dll" "$pkgdir/usr/share/invedit/"
  
  cd "$srcdir/INVedit/"
  install -m644 "items.txt" "items.png" "special.png" "terrain.png" "$pkgdir/usr/share/invedit/"

  echo -e "#!/bin/bash\nmono /usr/share/invedit/INVedit.exe" > "$pkgdir/usr/bin/invedit" && chmod 755 "$pkgdir/usr/bin/invedit"

  install -Dm644 "$srcdir/$_gitname-build/icon.png" "$pkgdir/usr/share/pixmaps/invedit.png"
  install -Dm644 "$srcdir/invedit.desktop" "$pkgdir/usr/share/applications/invedit.desktop"
} 

