# Maintainer: fossdd <fossdd@pwned.life>

# ATTENTION:
#
# This package copies the project and all of its dependencies into
# /opt, and compiles the source code on service start due to the bad
# behaviour of Next.js.
#
# You may want to use docker(-compose) instead of this package.

pkgname=proxigram-git
_pkgname=proxigram
pkgver=r91.bf04c4c
pkgrel=5
pkgdesc="A privacy focused and open source front-end for Instagram"
arch=('any')
url="https://codeberg.org/ThePenguinDev/Proxigram"
backup=("etc/$_pkgname.conf")
license=('AGPL-3.0')
depends=('nodejs')
makedepends=('npm')
optdepends=('redis: used for caching purposes')
source=("$_pkgname::git+$url"
	"$_pkgname.service"
	"$_pkgname.sysusers"
	"$_pkgname.tmpfiles"
	"$_pkgname.conf"
	'0001-Use-custom-port.patch')
md5sums=('SKIP'
         '6378320dd779a73b31dc64dba4bb3bc2'
         '95be5fd46a8e5a5e832ea135a2fbfee3'
         '0ad916caa947bf33368d4fba3572ebe6'
         '308016ff3e49dcb48fcff603abc8bb3d'
         'b0d8a9665020bc77fb6a252e9bb3196d')
options=(!strip)

pkgver() {
	cd "$srcdir/$_pkgname"
	# Git, tags available
	# printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
	# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


prepare() {
	patch --directory="$srcdir/$_pkgname" --forward --strip=1 --input="${srcdir}/0001-Use-custom-port.patch"
}

build() {
	cd $srcdir/$_pkgname
	npm install

	# For headless provider
	npm install playwright-chromium@1.34.3
}

package() {
	# source code and dependencies
	install -vd "$pkgdir/opt"
	cp -vr "$srcdir/$_pkgname" "$pkgdir/opt/$_pkgname"
	rm -vfr "$pkgdir/opt/$_pkgname/.git"

	# systemd integration
	install -Dm0644 "$srcdir/$_pkgname.service" -t "$pkgdir/usr/lib/systemd/system/"
	install -Dm6044 "$srcdir/$_pkgname.conf" -t "$pkgdir/etc/"
	install -Dm0644 "$srcdir/$_pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$_pkgname.conf"
	install -Dm0644 "$srcdir/$_pkgname.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/$_pkgname.conf"

	# other
	install -Dm0644 "$srcdir/$_pkgname/LICENSE" -t "$pkgdir/usr/share/licenses/$_pkgname/"
	install -Dm0644 "$srcdir/$_pkgname/README.md" -t "$pkgdir/usr/share/doc/$_pkgname/"
}
