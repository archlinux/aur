# Maintainer: Sam S. <smls75@gmail.com>

pkgname=arx-fatalis-data-copy
pkgver=1.21
pkgrel=1
pkgdesc='Arx Fatalis game data from existing win32 installation'
url='http://www.arkane-studios.com/uk/arx.php'
arch=('i686' 'x86_64')
license=('custom:commercial')
provides=('arx-fatalis-data')
conflicts=('arx-fatalis-data-gog' 'arx-fatalis-data-demo')
source=("install-verify" "install-copy")
md5sums=('e9c245ac1bb48cb8ef667933e0b725d2'
         '9bbb1a2ae298343aafe40a5e7117c24c')
install='arx-fatalis-data.install'
PKGEXT='.pkg.tar'

_gamefolder="arx fatalis"


package() {
  cd $srcdir
  _get_local_source "$_gamefolder" || {
    error "Unable to find existing Arx Fatalis installation.
           Please install the game using Windows or Wine, apply the official
           1.21 patch (already applied in the Steam version), and then place a
           symlink to the game folder (which should contain 'data.pak' etc.)
           into one of the above directories."
    exit 1; }

  msg "Starting setup..."
  chmod +x install-copy
  ./install-copy "$_gamefolder" "$pkgdir/usr/share/arx"
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
