#Maintainer: CubeTheThird <cubethethird@gmail.com>

pkgname=brogue-ce-curses
pkgver=1.15.1
pkgrel=1
pkgdesc="Brogue Community Edition: A 26-level dungeon crawl to the Amulet of Yendor."
arch=('i686' 'x86_64')
url="https://github.com/tmewett/BrogueCE"
license=('AGPL-3.0-only')
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/tmewett/BrogueCE/archive/v${pkgver}.tar.gz")
md5sums=('39d144786339fcac57b2aa1ff43ccec5')
replaces=('brogue-ce')

build() {
  cd "$srcdir/BrogueCE-$pkgver"

  sed -i 's/TERMINAL := NO/TERMINAL := YES/' config.mk
  sed -i 's/GRAPHICS := YES/GRAPHICS := NO/' config.mk
  sed -i 's/SDL_CONFIG := sdl2-config/#/' config.mk
  
  make clean
  make DATADIR="/opt/$pkgname" RELEASE="YES"

  cd linux
  sed -i -e "s|/opt/brogue|/opt/${pkgname}|" -e "s|/Brogue|/${pkgname}|" brogue-multiuser.sh
}

package() {

  cd "$srcdir/BrogueCE-$pkgver"

  _dest_dir="$pkgdir/opt/$pkgname"
  mkdir -p "$_dest_dir/assets"

  install -Dm755 "linux/brogue-multiuser.sh" "$_dest_dir/brogue-curses-multiuser.sh"

  cd bin/

  install -Dm755 brogue "$_dest_dir"
  install -Dm644 keymap.txt "$_dest_dir"
  install -Dm644 assets/* "$_dest_dir/assets" 

  mkdir -p $pkgdir/usr/bin
  ln -s "/opt/${pkgname}/brogue-curses-multiuser.sh" "$pkgdir/usr/bin/$pkgname"
}
