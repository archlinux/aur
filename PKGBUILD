# Maintainer: CubeTheThird <cubethethird@gmail.com>
# Maintainer: Simon Perry <aur [at] sanxion [dot] net>

pkgname=broguelite
pkgver=1.11.1_RC2
_distname=BrogueCE-Lite
_distver=v1.11.1-RC2
pkgrel=1
pkgdesc="No item-ID fork of Brogue Community Edition: A 26-level dungeon crawl to the Amulet of Yendor."
arch=('i686' 'x86_64')
url="https://github.com/HomebrewHomunculus/BrogueCE"
license=('AGPL3')
depends=('sdl2_image' 'sdl2')
source=(${pkgname}-${pkgver}.tar.gz::"${url}/archive/refs/tags/Lite-${_distver}.tar.gz" brogue.sh)
sha256sums=('8702229a3e019425a8c11b9bf7be8a497dbb2e563613df852aa716d271f26f18'
            '296083114076a47fea7aa3e287e4c4b889f697dbb0e30e09230963d7ae840173')

build() {
  cd "$srcdir/$_distname-$_distver"
  
  make clean
  make DATADIR="/opt/$pkgname" RELEASE="YES"

  cd linux
  ./make-link-for-desktop.sh > /dev/null
  sed -i -e "s|$(pwd)|/opt/${pkgname}|" \
         -e 's/brogue$/broguelite-multiuser.sh/' \
         -e 's/bin\///' \
         -e 's/^Name=Brogue$/Name=BrogueLite/' "brogue.desktop"
  sed -i -e "s|/opt/brogue|/opt/${pkgname}|" -e "s|/Brogue|/${pkgname}|" brogue-multiuser.sh
}

package() {

  cd "$srcdir/$_distname-$_distver"

  install -Dm644 "linux/brogue.desktop" "$pkgdir/usr/share/applications/${pkgname}.desktop"

  _dest_dir="$pkgdir/opt/$pkgname"
  mkdir -p "$_dest_dir/assets"

  install -Dm755 "linux/brogue-multiuser.sh" "$_dest_dir/$pkgname-multiuser.sh"

  cd bin/

  install -Dm755 brogue "$_dest_dir"
  install -Dm644 keymap.txt "$_dest_dir"
  install -Dm644 assets/* "$_dest_dir/assets" 

  mkdir -p $pkgdir/usr/bin
  ln -s "/opt/${pkgname}/${pkgname}-multiuser.sh" "$pkgdir/usr/bin/$pkgname"
}
