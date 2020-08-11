# Maintainer: Sebastian Neef <aur AT gehaxelt DOT IN>
pkgbase=theharvester-git
pkgname=theharvester-git
pkgver=V3.1.r343.g3c4d66d
pkgrel=1
pkgdesc="A tool for gathering e-mail accounts, subdomain names, virtual hosts, open ports/ banners, and employee names from different public sources (search engines, pgp key servers)."
arch=('any')
url="https://github.com/laramies/theHarvester"
license=('GPL2')
depends=(
	'bash'
	'python'
	'python-requests'
	'python-plotly'
	'python-pytest'
	'python-texttable'
	'python-shodan'
	'python-beautifulsoup4'
	'python-decorator'
	'python-censys'
	'python-gevent'
	'python-grequests'
	'python-aiodns'
	'python-aiohttp'
	'python-multiprocess'
	'python-aiosqlite'
	'python-certifi'
	'python-netaddr'
	'python-pyppeteer'
	'python-pyaml'
	'python-pycares'
	'python-retrying'
	'python-lxml'
	'python-dnspython'
	'python-uvloop'
)
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
	reponame=theHarvester
	mkdir -p "$pkgdir/opt/$pkgname/"
	mkdir -p "$pkgdir/usr/bin"
	
	cp -r "$srcdir/$pkgname/$reponame" "$pkgdir/opt/$pkgname"
	cp -r "$srcdir/$pkgname/tests" "$pkgdir/opt/$pkgname/"
	cp -r "$srcdir/$pkgname/wordlists" "$pkgdir/opt/$pkgname/"
	install "$srcdir/$pkgname/api-keys.yaml" "$pkgdir/opt/$pkgname/"
	install "$srcdir/$pkgname/theHarvester.py" "$pkgdir/opt/$pkgname/"
	install "$srcdir/$pkgname/run.sh" "$pkgdir/opt/$pkgname/"

	ln -s "/opt/$pkgname/run.sh" "$pkgdir/usr/bin/theharvester"	
}

check(){
	cd "${srcdir}"
	pytest
}
