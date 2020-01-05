#Maintainer: CubeTheThird <cubethethird@gmail.com>

pkgname=brogue-ce-git
pkgver=1.8.r153.c344d3c
_pkgverbase=1.8
pkgrel=1
pkgdesc="Brogue Community Edition: A 26-level dungeon crawl to the Amulet of Yendor."
arch=('i686' 'x86_64')
url="https://github.com/tmewett/BrogueCE"
license=('AGPL3')
depends=('sdl2_image')
makedepends=('git')
source=(brogue-ce-git::"git+https://github.com/tmewett/BrogueCE.git"
        'brogue.sh')
md5sums=('SKIP'
         '38dc6a1ba7f29decb26a5745784341b3')

pkgver() {
cd "$srcdir/$pkgname"
printf "${_pkgverbase}.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"

  make clean
  make
  
  ./make-link-for-desktop.sh
  sed -i -e "s|$(pwd)|/opt/${pkgname}|" -e 's/brogue$/brogue.sh/' -e 's/bin\///' "brogue.desktop"
}

package() {

  cd "$srcdir/$pkgname"

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
