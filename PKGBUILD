# WARNING: This PKGBUILD writes to ~/.local/share!!!
#		   I know this is frowned upon but upstream is archived and even though it says it reads from /usr/share
#		   there's a bug and it just doesn't. If you're not okay with this, don't install.
#
# We basically create the real .local/share/splatmoji/data, chown it to $SUDO_USER so you can write to it, then symlink
# to the actual TSV which is installed to /usr/share
# 
# If you write to splatmoji/ or data/, the directory path will be preserved, otherwise it'll be cleaned up on uninstall
# 
# ~/.local/share/splatmoji 				- writeable, user-owned
# ~/.local/share/splatmoji/data			- writeable, user-owned
# ~/.local/share/splatmoji/data/aur/	- unwriteable, package-maintained

# Maintainer: pokemonpasta
_pkgbase=kaomoji-collection
pkgname=splatmoji-kaomojiya
pkgdesc="Splatmoji-formatted version of the Kaomojiya kaomoji collection"
pkgver=r1.2ca1b39
pkgrel=3

arch=(x86_64)
url="https://github.com/kaomojiya-collection/kaomoji-collection"
license=("MIT")
depends=(
	splatmoji
)
makedepends=(
	jq
)

options=(!strip !debug)

source=("$_pkgbase::git+$url.git")
sha256sums=('SKIP')

_tsv=$pkgname.tsv

pkgver(){
	cd "$srcdir/$_pkgbase"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package(){
	cd "$srcdir"
	# Converts from JSON format of {keyword: [kao1,kao2,...]} to splatmoji TSV: kao<tab>key1,key2
	jq -r 'to_entries[] | .value[] as $kao | [$kao, .key] | @tsv' "$_pkgbase/kaomoji.json" > "$_tsv"
	
	install -Dm644 "$_tsv" "$pkgdir/usr/share/splatmoji/data/aur/$_tsv"
	
	# Create the REAL directory (not under $pkgdir). This is so we can chown it immediately.
	# We only chown up to data so aur/ is still root-managed.
	mkdir -p "$HOME/.local/share/splatmoji/data/"
	chown "$SUDO_USER:$SUDO_USER" "$HOME/.local/share/splatmoji/data"
	
	install -dm755 "$pkgdir/$HOME/.local/share/splatmoji/data/aur/"
	ln -s "/usr/share/splatmoji/data/aur/$_tsv" "$pkgdir/$HOME/.local/share/splatmoji/data/aur/$_tsv"
}
