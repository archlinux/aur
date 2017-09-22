# Maintainer: Philipp A. <flying-sheep@web.de>

pkgname=desktop-privileges-nogroups
pkgver=1.0
pkgrel=1
pkgdesc="A collection of polkit rules to manage automounting of removable media, suspend and hibernate actions and CPU frequency settings."
arch=(any)
url="https://gist.github.com/3886114"
license=(GPL)
depends=(polkit udisks2 upower)
source=("$pkgname::git+$url.git")
sha256sums=(SKIP)

package() {
	install -dm755 "$pkgdir/etc/polkit-1/"
	install -dm750 "$pkgdir/etc/polkit-1/rules.d/"
	
	for rules in "$srcdir/$pkgname/"*.js; do
		local path="$(head -n1 "$rules" | sed -E 's|/\* Copy this to ([^ ]+) \*/|\1|')"
		if [[ "$path" != /etc* ]]; then
			path="/etc/polkit-1/rules.d/$(basename "$rules" .js).rules"
		fi
		install -Dm644 "$rules" "$pkgdir/$path"
		sed -Ei 's|subject\.user ===? "\w+"|subject.isInGroup("wheel")|' "$pkgdir/$path"
	done
}

