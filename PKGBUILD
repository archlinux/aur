# Maintainer: Abdur-Rahman Mansoor <armansoor at missingno dot dev>

_pkgname='linxterminator'
pkgbase="$_pkgname"
pkgname="$_pkgname-git"
pkgver=r2.2d38ab1
pkgrel=3
url="https://git.missingno.dev/$_pkgname"
pkgdesc='Embeddable, lean and efficient URL cleaner compatible with LuaJIT'
arch=('any')
makedepends=('git')
depends=(
	'bash'
	'luajit'
)
license=('GPL-3.0')
source=(
	"$_pkgname::git+$url"
	'linxterminator.sh'
)
conflicts=("$_pkgname")
provides=("$_pkgname")
b2sums=('SKIP'
        'a96c2141d7119bbce952060faf52070f6d854f5a5babeca0b31071e75357267c9c9bcf4072ae778a162cb729c43bb52973e2171ce6d1f52af0b3b672eff73c4e')

pkgver() {
	cd "$_pkgname"
	( 
		set -o pipefail
		git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

prepare() {
	for entry in $_pkgname/lua/*.lua; do
		local filename="$(basename $entry)" 
		filename="${filename%.*}"
		sed -i "s/^require 'lua./require '/" $entry
	done
}

package() {
	cd "$_pkgname"
	install -Dm644 ./LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
	install -Dm644 ./README.md -t "$pkgdir/usr/share/doc/$_pkgname"
	install -Dm644 ./lua/*.lua -t "$pkgdir/usr/share/$_pkgname/lua"
	install -Dm755 ../linxterminator.sh -t "$pkgdir/usr/bin/"
	mv "$pkgdir/usr/bin/$_pkgname.sh" "$pkgdir/usr/bin/$_pkgname"
}

