# Maintainer: Mubashshir <ahmubashshir@gmail.com>

pkgname=trakt-scrobbler
pkgver=1.0.0b4
pkgrel=3
pkgdesc="Automatically scrobble TV show episodes and movies you are watching to Trakt.tv! It keeps a history of everything you've watched!"

arch=(any)
url=https://github.com/iamkroot/trakt-scrobbler
license=(GPL2)
depends=(
    $(curl -s https://pypi.org/pypi/trakt-scrobbler/$pkgver/json|jq -r '.info|.requires_python, .requires_dist[]'|grep -v win32|sed -E 's/^>=([[:digit:].-]+),<([[:digit:].-]+)$/python>=\1\npython<\2/;s/^([[:alnum:]]+) \(>=([[:alnum:].-]+),<([[:alnum:].-]+)\)$/python-\1>=\2\npython-\1<\3/')
    'systemd'
)
optdepends=('libnotify: Provides Desktop Notifications.')
makedepends=(python-setuptools jq curl grep sed go-md2man gzip)
source=(https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz
    trakts-man.md)
sha256sums=(
    1c450bf8b6f183a7ddf8bad1540e32969cce8518bf84b9fe16a2456f260ef116
    81c3fb93bf01c0e6c0bbc9b2ef853da3f691bc3c50b4a87a68072b11ba72691c
)
build() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py build
    go-md2man -in "$srcdir/trakts-man.md"|gzip -n > trakts.1.gz
}
package()
{
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm644 "trakts.1.gz" "$pkgdir/usr/share/man/man1/trakts.1.gz"
}
