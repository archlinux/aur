# Maintainer: Sebastian Neef <aur AT gehaxelt DOT IN>
pkgbase=theharvester-git
pkgname=theharvester-git
pkgver=r44.761d26b
pkgrel=1
pkgdesc="A tool for gathering e-mail accounts, subdomain names, virtual hosts, open ports/ banners, and employee names from different public sources (search engines, pgp key servers)."
arch=('any')
url="https://github.com/laramies/theHarvester"
license=('GPL2')
depends=('bash' 'python2' 'python2-requests')
makedepends=('git' 'bash')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("$pkgname::git+https://github.com/laramies/theHarvester.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  ( set -o pipefail
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
	cd "$srcdir/$pkgname"
	cat <<__EOF__ > run.sh
#!/bin/bash
PYTHONPATH="\$PYTHONPATH:/opt/$pkgname/" /usr/bin/env python2 /opt/$pkgname/theHarvester.py "\$@"
__EOF__
}

package() {
	mkdir -p "$pkgdir/opt/$pkgname/"
	mkdir -p "$pkgdir/usr/bin"
	
	cp -r "$srcdir/$pkgname/discovery" "$pkgdir/opt/$pkgname/"
	cp -r "$srcdir/$pkgname/lib" "$pkgdir/opt/$pkgname/"
	install "$srcdir/$pkgname/myparser.py" "$pkgdir/opt/$pkgname/"
	install "$srcdir/$pkgname/theHarvester.py" "$pkgdir/opt/$pkgname/"
	install "$srcdir/$pkgname/run.sh" "$pkgdir/opt/$pkgname/"
	
	ln -s "/opt/$pkgname/run.sh" "$pkgdir/usr/bin/theharvester"
}
