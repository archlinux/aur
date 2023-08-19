# Maintainer: Andrew Hills <ahills@ednos.net>
pkgname=hosts-gen
pkgver=0.9.20191123.2
# No actual releases provided; use a specific commit
_pkgcommit=562b4af551efc7249cb68f6d4b8909daf2ce7ce6
pkgrel=2
epoch=
pkgdesc="A little framework to generate /etc/hosts from /etc/hosts.d"
arch=('any')
url="http://r-36.net/scm/$pkgname/"
license=('GPL3')
groups=()
depends=('coreutils')
makedepends=('git')
backup=()
options=()
install="$pkgname.install"
source=("$pkgname::git://r-36.net/$pkgname#commit=$_pkgcommit"
				"$pkgname.path"
				"$pkgname.service")
md5sums=('SKIP'
         '470be01a8490fc054fb0a04d3a74eed1'
         '12ed5fdea9f047bb03e61e8f846c641a')
validpgpkeys=()

pkgver() {
	cd "$pkgname"
	set +x
	local version=$(sed -n -e 's/^VERSION = //p' config.mk)
	# group commits by date, counting the ones on the date chosen for the version
	local commitdate=$(git show -s --date=short --format=%cd)
	local datecommits=$(git rev-list --since="$commitdate 00:00 UTC" HEAD | wc -l)
	git show -s --date=format:%Y%m%d --format=format:$version.%cd.$datecommits
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir/" install
	# Generate this from /etc/hosts on install
	rm "$pkgdir/etc/hosts.d/01-hosts.local"
	# Correct executable location
	mkdir -p "$pkgdir/usr"
	mv "$pkgdir/bin" "$pkgdir/usr/bin"
	# Install documentation
	mkdir -p "$pkgdir/usr/share/doc/$pkgname"
	install -m0644 "$srcdir/$pkgname/README" "$pkgdir/usr/share/doc/$pkgname/README"
	install -m0644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/doc/$pkgname/LICENSE"
	# Install systemd units
	mkdir -p "$pkgdir/usr/lib/systemd/system"
	install -m0644 "$srcdir/$pkgname.path" "$pkgdir/usr/lib/systemd/system/$pkgname.path"
	install -m0644 "$srcdir/$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
}
