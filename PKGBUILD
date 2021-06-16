# Maintainer: Mubashshir <ahmubashshir@gmail.com>
# pkg: pypi trakt-scrobbler poetry
pkgname=trakt-scrobbler
pkgver=1.2.1
pkgrel=10
pkgdesc="Automatically scrobble TV show episodes and movies you are watching to Trakt.tv! It keeps a history of everything you've watched!"

arch=(any)
url=https://github.com/iamkroot/trakt-scrobbler
license=(GPL2)
depends=(
    "systemd"
	'python-requests<3.0.0' #auto-deps
	'python-requests>=2.22.0' #auto-deps
	'python-guessit<4.0.0' #auto-deps
	'python-guessit>=3.1.0' #auto-deps
	'python-appdirs<2.0.0' #auto-deps
	'python-appdirs>=1.4.3' #auto-deps
	'python-cleo<0.8.0' #auto-deps
	'python-cleo>=0.7.6' #auto-deps
	'python-confuse<2.0.0' #auto-deps
	'python-confuse>=1.3.0' #auto-deps
	'python-jeepney<0.7' #auto-deps
	'python-jeepney>=0.6' #auto-deps
	'python-filelock<4.0.0' #auto-deps
	'python-filelock>=3.0.12' #auto-deps
	'python>=3.7' #auto-deps
	'python<4.0' #auto-deps
)

makedepends=(
    python-setuptools
    python-dephell
    go-md2man
    gzip
)
source=(
    "$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz"
    "trakts-man.md"
    "trakts.zsh"
)
sha256sums=('9f508a257d1def35f275a01ac2de995c3820dfe70cd55fb408accca5f9705655'
            '81c3fb93bf01c0e6c0bbc9b2ef853da3f691bc3c50b4a87a68072b11ba72691c'
            '6b6c3f55ab153a9dc749e67acd6e091b5d1e9e35c3b51af4d2f1c687e8c8fab8')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    dephell deps convert --from pyproject.toml --to setup.py
}
build() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py build
    go-md2man -in "$srcdir/trakts-man.md" 2>/dev/null|gzip -n > trakts.1.gz
}

package()
{
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm644 "trakts.1.gz" "$pkgdir/usr/share/man/man1/trakts.1.gz"
    install -Dm755 "$srcdir/trakts.zsh" "$pkgdir/usr/share/zsh/site-functions/_trakts"
}
