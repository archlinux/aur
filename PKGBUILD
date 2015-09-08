pkgname=tboi-wotl
pkgver=1.48
pkgrel=2
pkgdesc='The Binding of Isaac + Wrath of the Lamb expansion - Humble Indie Bundle version'
url='http://store.steampowered.com/app/113200/'
arch=('i686' 'x86_64')
license=('custom:commercial')
depends=('flashplugin')
makedepends=('unzip')
source=("$pkgname.png" "$pkgname.desktop" "$pkgname.sh")
md5sums=('bdde316318e2f5cb54afc1db3558369e'
         'e477182dc27d04fadc85f4cd6396feff'
         'bcdb2db3ac964bed801b6121101db5d1')

_swf="the_binding_of_isaac_wrath_of_the_lamb-linux-$pkgver-1355426233.swf"
_archive_md5='37dac3bdb47c5650395ad34364567ee7'

package() {
	_get_local_source "$_swf.zip" --md5 "$_archive_md5" || {
		error "Unable to find the game archive. Please download it from your Humble Bundle page, and place it into one of the above locations."
		exit 1
	}
	
	cd "$srcdir"
	unzip -u "$_swf".zip || true
	mkdir -p "$pkgdir/usr/share/$pkgname"
	install -Dm644 "$_swf"            "$pkgdir/usr/share/$pkgname/$pkgname.swf"
	install -Dm644 "$pkgname.png"     "$pkgdir/usr/share/$pkgname/$pkgname.png"
	install -Dm755 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -Dm755 "$pkgname.sh"      "$pkgdir/usr/bin/$pkgname"
}

# Locates a file or folder provided by the user, and symlinks it into $srcdir
_get_local_source() {
  msg "Looking for '$1'..."; rm -f "$srcdir/$1"
  declare -A _search=(['build dir']="$startdir"
                      ['$LOCAL_PACKAGE_SOURCES']="$LOCAL_PACKAGE_SOURCES")
  for _key in "${!_search[@]}"; do local _dir="${_search["$_key"]}"
    echo -n "    - in $_key [${_dir:-<undefined>}] ... ";
    if [[ -z "$_dir" || ! -e "$_dir/$1" ]]; then
      echo "NOT FOUND"
    elif [[ -n $2 && "$(${2#--}sum "$_dir/$1"|awk '{print $1}')" != $3 ]]; then
      echo "CHECKSUM FAILED";
    else
      echo "FOUND"; ln -sfT "$(readlink -f "$_dir/$1")" "$srcdir/$1"; break; fi
  done
  if [ ! -e "$srcdir/$1" ]; then return 1; fi
}