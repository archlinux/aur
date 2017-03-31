# Maintainer: Pierre Neidhardt <ambrevar@gmail.com>

_pkgname=lua-inspect
pkgname=lua-luainspect-git
pkgver=2016.04.22.g9019008
pkgrel=1
pkgdesc="A tool that does Lua code analysis"
arch=("i686" "x86_64")
url="http://github.com/davidm/$_pkgname"
license=("MIT")
depends=("lua>=5.1")
makedepends=("git")
provides=("lua-luainspect")
conflicts=("lua-luainspect")
source=("git+http://github.com/davidm/$_pkgname.git")
sha1sums=("SKIP")
_luaver="5.3"

pkgver() {
	cd "$srcdir/$_pkgname"
	git log -1 --format="%cd.g%h" --date=short | sed 's/-/./g'
}

package() {
	cd "$srcdir/$_pkgname"
	install -Dm755 luainspect "$pkgdir/usr/bin/luainspect"
	install -Dm644 README.txt "$pkgdir/usr/share/doc/$_pkgname/README.txt"

	for i in COPYRIGHT COPYRIGHT-extman COPYRIGHT-jquery; do
		install -Dm644 "$i" "$pkgdir/usr/share/licenses/$_pkgname/$i"
	done

	for path in lib metalualib; do
			cd "$path"
			while IFS= read -r i; do
				install -Dm644 "$i" "$pkgdir/usr/share/lua/$_luaver/$i"
			done <<EOF
$(find * -type f)
EOF
			cd ..
	done

	## Move README.txt and LICENSE for metalua.
	install -Dm644 metalualib/LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE-metalua"
	install -Dm644 metalualib/README.TXT "$pkgdir/usr/share/doc/$_pkgname/README-metalua.txt"
	rm "$pkgdir/usr/share/lua/$_luaver/LICENSE" "$pkgdir/usr/share/lua/$_luaver/README.TXT"

	for path in extman htmllib; do
			while IFS= read -r i; do
				install -Dm644 "$i" "$pkgdir/usr/share/$_pkgname/$i"
			done <<EOF
$(find * -type f)
EOF
	done
}
