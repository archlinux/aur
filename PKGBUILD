# Maintainer: Mubashshir <ahmubashshir@gmail.com>
# from: pypi
# what: trakt-scrobbler


pkgname=trakt-scrobbler
pkgver=1.5.0
pkgrel=1
pkgdesc="Automatically scrobble TV show episodes and movies you are watching to Trakt.tv! It keeps a history of everything you've watched!"

arch=(any)
url=https://github.com/iamkroot/trakt-scrobbler
license=(GPL2)
depends=(
	"systemd"
	'python-urlmatch<2.0.0' #auto-deps
	'python-urlmatch>=1.0.1' #auto-deps
	'python-jeepney<0.9' #auto-deps
	'python-jeepney>=0.8' #auto-deps
	'python-confuse<3.0' #auto-deps
	'python-confuse>=2.0' #auto-deps
	'python-cleo<0.9.0' #auto-deps
	'python-cleo>=0.8.1' #auto-deps
	'python-appdirs<2.0.0' #auto-deps
	'python-appdirs>=1.4.4' #auto-deps
	'python-guessit<4.0.0' #auto-deps
	'python-guessit>=3.3.1' #auto-deps
	'python-urllib3<2.0.0' #auto-deps
	'python-urllib3>=1.26.0' #auto-deps
	'python-requests<3.0.0' #auto-deps
	'python-requests>=2.25.1' #auto-deps
)

makedepends=(
    python-setuptools
    go-md2man
    gzip
)
source=(
    "$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz"
    "trakts-man.md"
)
sha256sums=('012427205e400bc24c38a9dc24ca600c779574b8837492ccdb229aaca1ce7bc3'
            '81c3fb93bf01c0e6c0bbc9b2ef853da3f691bc3c50b4a87a68072b11ba72691c')

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
    install -Dm755 "completions/trakts.zsh" "$pkgdir/usr/share/zsh/site-functions/_trakts"
}
