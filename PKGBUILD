# Maintainer: Simon Lemay <contact+archlinux@simonlemay.net>
# Contributor: Jim Pryor <profjim@jimpryor.net>

pkgname=chicken-numbers
_pkgname=numbers
pkgver=4.6.1
pkgrel=1
pkgdesc='Full numeric tower support'
arch=('i686' 'x86_64')
url='http://wiki.call-cc.org/eggref/4/numbers'
license=('BSD')
depends=('chicken')

build() {
    cd "$srcdir"
    if [[ ! -e "$_pkgname" ]]; then
        chicken-install -r "$_pkgname:$pkgver"
    fi
}

package() {
    cd "$srcdir/$_pkgname"
    chicken-install -p "$pkgdir/usr"

    # Modify setup-info file to use the typical install path.
    find "$pkgdir/usr" -name "$_pkgname.setup-info" -exec sed -e "s|$pkgdir||g" -i {} \;

    # Extract the license from the source and install it.
    sed -n '3,27p' numbers.scm | sed 's/..\?//' > LICENSE
    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
