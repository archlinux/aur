# Maintainer: childofunix at gmail dot com

pkgname="rmm-git"
pkgver=1.1.0.r1.g989a821
pkgrel=1
pkgdesc="RimWorld Mod Manager"
arch=("any")
url="https://github.com/Spoons/rmm.git"
license=("GPL")
depends=("steamcmd" "python" "python-beautifulsoup4" "python-tabulate" "python-networkx" "python-poetry" "python-installer") 
makedepends=("git" "python-setuptools" "python-pip")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
changelog=ChangeLog
source=("$pkgname::git+$url")
md5sums=("SKIP")

pkgver() {
	cd "${srcdir}/${pkgname}" || exit
    git describe --tags --always --long | sed "s/^v//;s/\([^-]*-g\)/r\1/;s/-/./g"
}

build() {
	cd "${srcdir}/${pkgname}" || exit
  poetry build
}

package() {
	cd "${srcdir}/${pkgname}" || exit
  python -m installer --destdir="$pkgdir" dist/*.whl 
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
	install -Dm 644 CHANGELOG.md -t "$pkgdir/usr/share/doc/$pkgname/"
	install -Dm 755 extras/_rmm -t "$pkgdir/usr/share/zsh/functions/Completion/"
	install -Dm 755 extras/rmm.sh -t "$pkgdir/etc/bash_completion.d/rmm.sh"
}
