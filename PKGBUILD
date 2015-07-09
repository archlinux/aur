# Maintainer: Sam S. <smls75@gmail.com>

pkgname=arx-fatalis-data-demo
pkgver=0
pkgrel=1
pkgdesc='Arx Fatalis game data from official free demo'
url='http://www.arkane-studios.com/uk/arx.php'
arch=('i686' 'x86_64')
license=('custom:freeware')
makedepends=('cabextract' 'libarchive')
provides=('arx-fatalis-data')
conflicts=('arx-fatalis-data-gog' 'arx-fatalis-data-copy')
source=("install-demo")
md5sums=('d6bc2486243986694426260d2d76f5cb')
install='arx-fatalis-data-demo.install'
PKGEXT='.pkg.tar'

_gamepkg="arx_demo_english.zip"


package() {
  cd $srcdir
  _get_local_source "$_gamepkg" || {
    error "Unable to find the game demo archive. Please download it from one of
           the sites listed at
             http://wiki.arx-libertatis.org/Getting_the_game_data#Demo ,
           rename it to 'arx_demo_english.zip', and copy or symlink it into one
           of the above directories."
    exit 1; }

  msg "Starting setup..."
  chmod +x install-demo
  ./install-demo "$_gamepkg" "$pkgdir/usr/share/arx"
  mkdir "$pkgdir/usr/share/games" && ln -s "/usr/share/arx/" "$pkgdir/usr/share/games/arx"
}


# Locate a file or folder provided by the user, and symlink it into $srcdir
_get_local_source() {
  msg "Looking for '$1'..."
  declare -A _search=(['build dir']="$startdir"
                      ['$LOCAL_PACKAGE_SOURCES']="$LOCAL_PACKAGE_SOURCES")
  for _key in "${!_search[@]}"; do local _dir="${_search["$_key"]}"
    if [ -z "$_dir" ]; then _dir="<undefined>"; fi
    echo -n "    - in $_key ['$_dir'] ... ";
    if [ -e "$_dir/$1" ]; then
      echo "FOUND"; ln -sfT "$(readlink -f "$_dir/$1")" "$srcdir/$1"; break; fi
    echo "NOT FOUND"
  done
  if [ ! -e "$srcdir/$1" ]; then return 1; fi
}
