# Maintainer: nVjhNFGQWoBQEthk

_pkgname=epy-ereader
_pkgname_fork=$_pkgname-mcepl
pkgname=$_pkgname_fork-git
pkgver=2025.5.27.r4.gf437f59
pkgrel=1
pkgdesc="fork of wustho/epy with continued development"
url="https://git.sr.ht/~mcepl/epy"
license=(GPL-3.0-only)
arch=(x86_64)
depends=(python python-imghdr)
makedepends=(git python-build python-installer python-poetry python-wheel python-setuptools)
provides=(epy)
conflicts=($_pkgname $_pkgname-git $_pkgname_fork)
source=(git+"$url")
sha256sums=(SKIP)
_pkgname_short=epy

pkgver() {
    cd "$_pkgname_short"
    # tag commit is duplicated in src; the tag is not on master, fix
    git tag v2025.5.27 705a75018d8e7f264c9f03db15fdcf129acabbf0 -f
    git describe --long --tags --abbrev=7 | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    cd "$_pkgname_short"
    python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
    cd "$_pkgname_short"
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/$pkgname/"

    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
