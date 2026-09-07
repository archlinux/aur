# NOTE: This PKGBUILD writes to ~/.local/share!!! I know this is frowned upon but upstream is archived and even though it says it reads from /usr/share
#		there's a bug and it just doesn't. If you're not okay with this, don't install.

# Maintainer: pokemonpasta
_pkgbase=emoticon_kaomoji_dataset
pkgname=splatmoji-ekohrt
pkgdesc="Splatmoji-formatted version of ekohrt's kaomoji database"
pkgver=r10.7d00fbb
pkgrel=1

arch=(x86_64)
url="https://github.com/ekohrt/emoticon_kaomoji_dataset"
license=("unknown")
depends=(
	splatmoji
)
makedepends=(
	jq
)

options=(!strip !debug)

source=("$_pkgbase::git+$url.git")
sha256sums=('SKIP')

pkgver(){
	cd "$srcdir/$_pkgbase"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package(){
	cd "$srcdir"
	# Converts from JSON format of {kaomoji:{original_tags[],new_tags[]}} to splatmoji TSV: kao<tab>key1,key2
	jq -r 'map_values(.original_tags + .new_tags | join(",")) | to_entries[] | [.key, .value] | @tsv' "$_pkgbase/emoticon_dict.json" > "$pkgname.tsv"
	
	install -dm700 "$pkgdir/$HOME"
	install -Dm644 "$pkgname.tsv"  "$pkgdir/$HOME/.local/share/splatmoji/data/custom/$pkgname.tsv"
}
