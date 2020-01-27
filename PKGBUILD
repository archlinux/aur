#Maintainer: CubeTheThird <cubethethird@gmail.com>

pkgname=brogue-ce
pkgver=1.8.1
pkgrel=1
pkgdesc="Brogue Community Edition: A 26-level dungeon crawl to the Amulet of Yendor."
arch=('i686' 'x86_64')
url="https://github.com/tmewett/BrogueCE"
license=('AGPL3')
depends=('sdl2_image')
makedepends=('git')
source=("https://github.com/tmewett/BrogueCE/releases/download/v${pkgver}/BrogueCE-${pkgver}-linux-x86_64.tar.gz"
        'brogue.sh')
md5sums=('d01c1e0ed41fc63f963343a17f80d0c1'
         '76eb49cd487ebbbf0b96e76661e66839')

build() {
  cd "$srcdir"
  
  ./make-link-for-desktop.sh > /dev/null
  sed -i -e "s|$(pwd)|/opt/${pkgname}|" -e 's/brogue$/brogue.sh/' -e 's/bin\///' "brogue.desktop"
}

package() {

  cd "$srcdir"

  install -Dm644 brogue.desktop "$pkgdir/usr/share/applications/brogue.desktop"

  _dest_dir="$pkgdir/opt/$pkgname"
  mkdir -p "$_dest_dir/assets"

  install -Dm755 "$srcdir/brogue.sh" "$_dest_dir"

  cd bin/

  install -Dm755 brogue "$_dest_dir"
  install -Dm644 keymap.txt "$_dest_dir"
  install -Dm644 assets/* "$_dest_dir/assets" 

  mkdir -p $pkgdir/usr/bin
  ln -s "/opt/${pkgname}/brogue.sh" "$pkgdir/usr/bin/$pkgname"
}
