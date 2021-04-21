# Maintainer: CubeTheThird <cubethethird@gmail.com>
# Maintainer: Simon Perry <aur [at] sanxion [dot] net>

pkgname=broguelite
_distname=BrogueLite
pkgver=1.9.3
pkgrel=1
pkgdesc="Brogue Community Edition: A 26-level dungeon crawl to the Amulet of Yendor."
arch=('i686' 'x86_64')
url="https://github.com/HomebrewHomunculus/BrogueLite"
license=('AGPL3')
depends=('sdl2_image' 'sdl2')
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/HomebrewHomunculus/${_distname}/archive/v${pkgver}.tar.gz" brogue.sh)
sha256sums=('bc95355cdb089c608594b539f2af8a8f94d1ff68f9b745ddcf7c6e3f845fbe23'
            '296083114076a47fea7aa3e287e4c4b889f697dbb0e30e09230963d7ae840173')

build() {
  cd "$srcdir/$_distname-$pkgver"
  
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

  cd "$srcdir/$_distname-$pkgver"

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
