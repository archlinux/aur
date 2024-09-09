#Maintainer: CubeTheThird <cubethethird@gmail.com>

pkgname=brogue-ce
pkgver=1.14.1
pkgrel=1
pkgdesc="Brogue Community Edition: A 26-level dungeon crawl to the Amulet of Yendor."
arch=('i686' 'x86_64')
url="https://github.com/tmewett/BrogueCE"
license=('AGPL-3.0-only')
depends=('sdl2_image' 'sdl2')
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/tmewett/BrogueCE/archive/v${pkgver}.tar.gz")
md5sums=('952b9ac1b8c05d7489a30b9427bbb65e')

build() {
  cd "$srcdir/BrogueCE-$pkgver"
  
  make clean
  make DATADIR="/opt/$pkgname" RELEASE="YES"

  cd linux
  ./make-link-for-desktop.sh > /dev/null
  sed -i -e "s|$(pwd)|/opt/${pkgname}|" -e 's/brogue$/brogue-multiuser.sh/' -e 's/bin\///' "brogue.desktop"
  sed -i -e "s|/opt/brogue|/opt/${pkgname}|" -e "s|/Brogue|/${pkgname}|" brogue-multiuser.sh
}

package() {

  cd "$srcdir/BrogueCE-$pkgver"

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
