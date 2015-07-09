# Maintainer: Sam S. <smls75@gmail.com>

pkgname=arx-fatalis-data-gog
pkgver=1.21
pkgrel=1
pkgdesc='Arx Fatalis game data from GOG.com installer'
url='http://www.gog.com/en/gamecard/arx_fatalis'
arch=('i686' 'x86_64')
license=('custom:commercial')
makedepends=('innoextract')
provides=('arx-fatalis-data')
conflicts=('arx-fatalis-data-copy' 'arx-fatalis-data-demo')
source=("install-verify" "install-gog")
md5sums=('e9c245ac1bb48cb8ef667933e0b725d2'
         'fc86639646ba5dba6d737560fb846f4a')
install='arx-fatalis-data.install'
PKGEXT='.pkg.tar'

_gamepkg="setup_arx_fatalis.exe"


package() {
  cd $srcdir
  _get_local_source "$_gamepkg" || {
    error "Unable to find the game archive. Please download it from your GOG.com
           account, and copy or symlink it into one of the above directories."
    exit 1; }

  msg "Starting setup..."
  chmod +x install-gog
  ./install-gog --no-progress "$_gamepkg" "$pkgdir/usr/share/arx"
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
