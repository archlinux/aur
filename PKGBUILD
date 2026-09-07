# WARNING: This PKGBUILD writes to ~/.local/share!!!
#		   I know this is frowned upon but upstream is archived and even though it says it reads from /usr/share
#		   there's a bug and it just doesn't. If you're not okay with this, don't install.

# Maintainer: pokemonpasta
_pkgbase=kaomoji-collection
pkgname=splatmoji-kaomojiya
pkgdesc="Splatmoji-formatted version of the Kaomojiya kaomoji collection"
pkgver=r1.2ca1b39
pkgrel=2

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
	
	install -dm700 "$pkgdir/$HOME"
	install -Dm644 "$_tsv"  "$pkgdir/$HOME/.local/share/splatmoji/data/aur/$_tsv"
}
