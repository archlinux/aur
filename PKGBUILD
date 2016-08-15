# Maintainer: Andrew Hills <ahills@ednos.net>
pkgname=hosts-gen
pkgver=0.9
# No actual releases provided; find the right commit and download a snapshot from cgit
_pkgcommit=d3015d319d378390139455731b974569fbc2cd40
pkgrel=2
epoch=
pkgdesc="A little framework to generate /etc/hosts from /etc/hosts.d"
arch=('any')
url="http://git.r-36.net/$pkgname/"
license=('GPL3')
groups=()
depends=('coreutils')
backup=()
options=()
install="$pkgname.install"
source=("http://git.r-36.net/$pkgname/snapshot/$pkgname-$_pkgcommit.tar.bz2"
				"$pkgname.path"
				"$pkgname.service")
md5sums=('534edf642f15df0a073a716967724065'
         '470be01a8490fc054fb0a04d3a74eed1'
         '12ed5fdea9f047bb03e61e8f846c641a')
validpgpkeys=()

package() {
	cd "$pkgname-$_pkgcommit"
	make DESTDIR="$pkgdir/" install
	# Generate this from /etc/hosts on install
	rm "$pkgdir/etc/hosts.d/01-hosts.local"
	# Correct executable location
	mkdir -p "$pkgdir/usr"
	mv "$pkgdir/bin" "$pkgdir/usr/bin"
	# Install documentation
	mkdir -p "$pkgdir/usr/share/doc/$pkgname"
	install -m0644 "$srcdir/$pkgname-$_pkgcommit/README" "$pkgdir/usr/share/doc/$pkgname/README"
	install -m0644 "$srcdir/$pkgname-$_pkgcommit/LICENSE" "$pkgdir/usr/share/doc/$pkgname/LICENSE"
	# Install systemd units
	mkdir -p "$pkgdir/usr/lib/systemd/system"
	install -m0644 "$srcdir/$pkgname.path" "$pkgdir/usr/lib/systemd/system/$pkgname.path"
	install -m0644 "$srcdir/$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
}
