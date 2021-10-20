# Maintainer: Leon Schumacher <leonsch@protonmail.com>
# vim: ft=sh:
pkgname=runit-services
pkgver=feb30bc458_1
pkgrel=2
pkgdesc="A collection of services for runit - stolen from Artix Linux"
arch=('any')
url="https://gitea.artixlinux.org/artix/runit-services"
license=('unknown')
depends=('runit')
makedepends=('git')
source=("git+$url#commit=${pkgver%_*}" "polkit-run" "rtkit-run")
sha256sums=('SKIP'
            '71a58c2d519f84ec50b9fc8112d3b58ac5cb38fedeabc553c1611df1bdbdb404'
            'afd2d947b9011a7d7679d8f20d688e9f4719a93ea27f1e1e07128f81a5fc5865')

package() {
	local SVDIR="$pkgdir/etc/sv"
	chmod 755 "${pkgdir%/*}"
	mkdir -p "$SVDIR"

	# install extra services
	find . -mindepth 1 -maxdepth 1 -not -name "$pkgname" \
	| while read -r line; do
		line="${line#./}"
		service="${line%-*}"
		file="${line#*-}"
		mkdir -p "$SVDIR/$service"
		cp "$line" "$SVDIR/$service/$file"
	done

	# install artix services
	cd "$pkgname"
	for i in *; do
		[ ! -d "$i" ] && continue
		case "$i" in lvm2|cryptsetup|apparmor|hdparm) continue ;; esac
		cp -r "$i/"* "$SVDIR"
	done

	# make everything executable
	find "$SVDIR" -type f -exec chmod 755 {} \;

	# rename check files
	find "$SVDIR" -name '*.check' \
	| while read -r file; do
		mv "$file" "$(dirname "$file")/check"
	done
}
