# Maintainer: Mubashshir <ahmubashshir@gmail.com>
# pkg: github iamkroot/trakt-scrobbler
pkgname=trakt-scrobbler
pkgver=1.2.0
pkgrel=3
pkgdesc="Automatically scrobble TV show episodes and movies you are watching to Trakt.tv! It keeps a history of everything you've watched!"

arch=(any)
url=https://github.com/iamkroot/trakt-scrobbler
license=(GPL2)
depends=(
    "systemd"
    "python-appdirs<2"
    "python-appdirs>=1.4.3"
    "python-cleo<1"
    "python-cleo>=0.7.6"
    "python-confuse<2"
    "python-confuse>=1.3.0"
    "python-guessit<4"
    "python-guessit>=3.1.0"
    "python-pygobject<4"
    "python-pygobject>=3.34.0"
    "python-pysocks<2"
    "python-pysocks>=1.7.1"
    "python-requests<3"
    "python-requests>=2.22.0"
)

makedepends=(
    python-setuptools
    python-dephell
    go-md2man
    gzip
)
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/iamkroot/$pkgname/archive/v$pkgver.tar.gz"
    "trakts-man.md"
    "trakts.zsh"
)
sha256sums=('6ae3fbcf9396672cc1942eace6217d5cd2e8e5b9ebff550ef03bea4dea19fc2e'
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
