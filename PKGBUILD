#Maintainer: CubeTheThird <cubethethird@gmail.com>

pkgname=brogue-ce-git
pkgver=1.9.4.r106.dev.0ca1176
pkgrel=1
pkgdesc="Brogue Community Edition: A 26-level dungeon crawl to the Amulet of Yendor."
arch=('i686' 'x86_64')
url="https://github.com/tmewett/BrogueCE"
license=('AGPL3')
depends=('sdl2_image')
source=(brogue-ce-git::"git+https://github.com/tmewett/BrogueCE.git")
md5sums=('SKIP')

pkgver() {
cd "$srcdir/$pkgname"
VER=$(grep "BROGUE_DUNGEON_VERSION_STRING" src/brogue/Rogue.h | grep -o '[0-9.]\{1,\}')
PAT=$(grep "BROGUE_PATCH" src/brogue/Rogue.h | grep -o '[0-9]\{1,\}')
REV="$(git rev-list $(git describe --abbrev=0)..HEAD --count)"
EXT="dev.$(git log -1 --format='%h')"
echo ${VER}.${PAT}.r${REV}.${EXT}
}

build() {
  cd "$srcdir/$pkgname"

  make clean
  make DATADIR="/opt/${pkgname}"
  
  cd linux
  ./make-link-for-desktop.sh > /dev/null 
  sed -i -e "s|$(pwd)|/opt/${pkgname}|" -e 's/brogue$/brogue-multiuser.sh/' -e 's/bin\///' "brogue.desktop"
  sed -i -e "s|/opt/brogue|/opt/${pkgname}|" -e "s|/Brogue|/${pkgname}|" brogue-multiuser.sh
}

package() {

  cd "$srcdir/$pkgname"

  install -Dm644 "linux/brogue.desktop" "$pkgdir/usr/share/applications/${pkgname}.desktop"

  _dest_dir="$pkgdir/opt/$pkgname"
  mkdir -p "$_dest_dir/assets"

  install -Dm755 "linux/brogue-multiuser.sh" "$_dest_dir"

  cd bin/

  install -Dm755 brogue "$_dest_dir"
  install -Dm644 keymap.txt "$_dest_dir"
  install -Dm644 assets/* "$_dest_dir/assets" 

  mkdir -p $pkgdir/usr/bin
  ln -s "/opt/${pkgname}/brogue-multiuser.sh" "$pkgdir/usr/bin/$pkgname"
}
