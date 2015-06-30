# Maintainer: Pierre Neidhardt <ambrevar@gmail.com>
# Contributor: Michal Minar <mr.mini@centrum.cz>
# Contributor: Zsolt Udvari <udvzsolt@gmail.com>

_pkgname=lua-inspect
pkgname=lua-luainspect-git
pkgver=2012.03.30.gca39880
pkgrel=1
pkgdesc="A tool that does Lua code analysis"
arch=(i686 x86_64)
url="http://github.com/davidm/lua-inspect"
license=("MIT")
depends=("lua>=5.1")
conflicts=("lua-luainspect")
provides=("lua-luainspect")
makedepends=("git")
source=("git+http://github.com/davidm/lua-inspect.git")
sha1sums=("SKIP")

pkgver() {
	cd "$srcdir/$_pkgname"
	git log -1 --format="%cd.g%h" --date=short | sed 's/-/./g'
}

package() {
	cd ${srcdir}/${_pkgname}

	install -D -m755 luainspect "$pkgdir/usr/bin/luainspect"
	install -D -m644 README.txt "$pkgdir/usr/share/doc/$_pkgname/README.txt"

	for i in COPYRIGHT COPYRIGHT-extman COPYRIGHT-jquery; do
		install -D -m644 "$i" "$pkgdir/usr/share/licenses/$_pkgname/$i"
	done

	for path in lib metalualib; do
			cd "$path"
			while IFS= read -r i; do
				install -D -m644 "$i" "$pkgdir/usr/share/lua/5.2/$i"
			done <<EOF
$(find * -type f)
EOF
			cd ..
	done
	## Move README.txt and LICENSE for metalua.
	install -D -m644 metalualib/LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE-metalua"
	install -D -m644 metalualib/README.TXT "$pkgdir/usr/share/licenses/$_pkgname/README-metalua.txt"
	rm "$pkgdir/usr/share/lua/5.2/LICENSE" "$pkgdir/usr/share/lua/5.2/README.TXT"

	for path in extman htmllib; do
			while IFS= read -r i; do
				install -D -m644 "$i" "$pkgdir/usr/share/$_pkgname/$i"
			done <<EOF
$(find * -type f)
EOF
	done
}
