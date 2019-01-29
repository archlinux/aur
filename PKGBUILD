# Maintainer: Sebastian Neef <aur AT gehaxelt DOT IN>
pkgbase=theharvester-git
pkgname=theharvester-git
pkgver=3.0.6.r250.g19eb2a4
pkgrel=1
pkgdesc="A tool for gathering e-mail accounts, subdomain names, virtual hosts, open ports/ banners, and employee names from different public sources (search engines, pgp key servers)."
arch=('any')
url="https://github.com/laramies/theHarvester"
license=('GPL2')
depends=(
		'bash'
		'python'
		'python-yaml'
		'python-requests'
		'python-plotly'
		'python-pytest'
		'python-texttable'
		'python-shodan'
		'python-beautifulsoup4'
		'python-decorator')
makedepends=('git' 'bash')
provides=("${pkgname}")
conflicts=("${pkgname}")
install="theHarvester.install"
source=("$pkgname::git+https://github.com/laramies/theHarvester.git")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'	
}

prepare() {
	cd "$srcdir/$pkgname"
	cat <<__EOF__ > run.sh
#!/bin/bash
PYTHONPATH="\$PYTHONPATH:/opt/$pkgname/" /usr/bin/env python /opt/$pkgname/theHarvester.py "\$@"
__EOF__
}

package() {
	mkdir -p "$pkgdir/opt/$pkgname/"
	mkdir -p "$pkgdir/usr/bin"
	
	cp -r "$srcdir/$pkgname/discovery" "$pkgdir/opt/$pkgname/"
	cp -r "$srcdir/$pkgname/lib" "$pkgdir/opt/$pkgname/"
	cp -r "$srcdir/$pkgname/parsers" "$pkgdir/opt/$pkgname/"
	cp -r "$srcdir/$pkgname/tests" "$pkgdir/opt/$pkgname/"
	cp -r "$srcdir/$pkgname/wordlists" "$pkgdir/opt/$pkgname/"
	install "$srcdir/$pkgname/api-keys.yaml" "$pkgdir/opt/$pkgname/"
	install "$srcdir/$pkgname/theHarvester.py" "$pkgdir/opt/$pkgname/"
	install "$srcdir/$pkgname/run.sh" "$pkgdir/opt/$pkgname/"

	ln -s "/opt/$pkgname/run.sh" "$pkgdir/usr/bin/theharvester"	
}
