# Maintainer: Andrew Antle <andrew dot antle at gmail dot com>
# Contributor: Calvin McAnarney <csm@gmx.us>
# Contributor: Julien Pecqueur <jpec@julienpecqueur.com>
# Contributor: Sergiusz Urbaniak <sergiusz.urbaniak@gmail.com>

## Based on official package by Alexander F. Rødseth <xyproto@archlinux.org>
pkgname=plan9port-git
pkgver=r3972.a39606e3
pkgrel=1
pkgdesc='Ports of applications from Plan 9'
arch=(x86_64)
url='https://9fans.github.io/plan9port/'
license=(custom)
depends=(fontconfig fuse2 libxt xorg-server)
makedepends=(gendesk git)
conflicts=("${pkgname%-*}" 9base)
provides=(plan9)
backup=(usr/lib/plan9/ndb/local)
install=plan9.install
options=(staticlibs !zipman)
source=("$pkgname::git+https://github.com/9fans/plan9port"
        acme.png acme.sh plan9.sh)
b2sums=('SKIP'
        '983106b7a91afadae0f3aff5ff69338aa80d7eb6f9b65a95a31c963f162f6fb2dea748e5da698e0bd14d4343fe17281f55b9a1966fcba1c497fbd4bd855caf6c'
        '6bd5abac872d578523fee4d7287aa9df7faecccefab92377a871596f1526f3a26d3e89098aef3bb3e3773b2de6f5f63be6cb13134b1cbc66be9763403c344598'
        '743d3b663f8cad370fe4e6f0fe24efd444172327b9e0bd2ac5fd3c4f9595edd4e513c6ba978719a163e0507121cab622de8453289bde19b37365a2a78df4ccf9')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	# Generate a desktop shortcut for the Acme editor
	gendesk -f \
	        --name Acme \
	        --pkgname acme \
	        --genericname Editor \
	        --comment 'Editor from Plan 9' \
	        --categories 'Application;Development;TextEditor'

	cd $pkgname

	# Use _DEFAULT_SOURCE instead of _BSD_SOURCE
	grep -rl _BSD_SOURCE | xargs sed -i s':_BSD_SOURCE:_DEFAULT_SOURCE:g'

	# Use the Gentoo way for fixing hardcoded paths
	grep --null -l -r /usr/local/plan9 | xargs --null sed -i "s!/usr/local/plan9!/usr/lib/plan9!g"

	# Stop 9l from giving an 'undefined reference error' given no arguments, ref #55640
	sed -i '1i[ "$1" == "" ] && exit 1' bin/9l
}

build() {
	cd $pkgname
	export CFLAGS+=' -ffat-lto-objects -w'
	./INSTALL -b
}

package() {
	cd $pkgname
	install -D -m755 ../plan9.sh "$pkgdir/etc/profile.d/plan9.sh"
	d=usr/lib
	install -d "$pkgdir/$d"
	install -d "$pkgdir/usr/share/doc/$pkgname"
	cp -r "$srcdir/$pkgname" "$pkgdir/$d/plan9"
	cd "$pkgdir/$d/plan9"
	./INSTALL -c -r "$pkgdir/$d/plan9"
	install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	# Clean up
	rm -rf .hg/
	rm -f .hgignore .hgtags INSTALL LICENSE Makefile config configure install.log install.sum install.txt
	find . -name '.cvsignore' -delete

	# Package text files
	for i in CHANGES CONTRIBUTING.md CONTRIBUTORS README.md; do
		install -m644 $i "$pkgdir/usr/share/doc/$pkgname"
		rm -f $i
	done

	# Decompress the plan9 man pages
	for i in "$(find "$pkgdir/$d/plan9/man" -type f)"; do
		if [ "${i##*.}" = "gz" ]; then
			gunzip "$i"
		fi
	done

	# Once more
	PLAN9=/usr/lib/plan9
	grep --null -l -r "$pkgdir$PLAN9" | xargs --null sed -i "s!$pkgdir$PLAN9!${PLAN9}!g" || true
	grep --null -l -r "/build/plan9port/pkg/plan9port/$PLAN9" | xargs --null sed -i "s!/build/plan9port/pkg/plan9port/$PLAN9!${PLAN9}!g" || true

	# Acme
	cd "$srcdir"
	install -D -m755 acme.sh "$pkgdir/usr/bin/acme"
	install -D -m644 acme.desktop "$pkgdir/usr/share/applications/acme.desktop"
	install -D -m644 acme.png "$pkgdir/usr/share/pixmaps/acme.png"

	# Remove git repository and CI workflow configuration
	rm -rf "$pkgdir/usr/lib/plan9/.git"{,hub}
}
