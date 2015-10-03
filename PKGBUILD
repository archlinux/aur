# Maintainer: Sebastian Neef <aur AT gehaxelt DOT IN>
pkgbase=heartbleedscanner
pkgname=heartbleedscanner-git
pkgver=r15.7ecb1e3
pkgrel=1
pkgdesc="OpenSSL Heartbleed (CVE-2014-0160) vulnerability scanner, data miner and RSA key-restore tools."
arch=('any')
url="https://github.com/internetwache/heartbleed-tools"
license=('unknown')
depends=('python3' 'python-gmpy' 'python-pyasn1')
makedepends=('git' 'bash')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=('heartbleedscanner-git::git+https://github.com/internetwache/heartbleed-tools.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
	mkdir -p "$pkgdir/opt"
	mkdir -p "$pkgdir/usr/bin"
	
	mv "$srcdir/$pkgname/" "$pkgdir/opt/$pkgname"
	rm -rf "$pkgdir/opt/$pkgname/.git"
	rm "$pkgdir/opt/$pkgname/.gitignore"
	ln -s "/opt/$pkgname/hb.py" "$pkgdir/usr/bin/heartbleedscanner"
	ln -s "/opt/$pkgname/keydump.py" "$pkgdir/usr/bin/heartbleedscanner-keydump"
	ln -s "/opt/$pkgname/keyscan.py" "$pkgdir/usr/bin/heartbleedscanner-keyscan"
}
