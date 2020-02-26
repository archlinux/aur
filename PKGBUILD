# Maintainer: Thorben Günther <echo YWRtaW5AeGVucm94Lm5ldAo= | base64 -d>

pkgname=srhtctl
pkgver=0.3.1
pkgrel=2
pkgdesc='CLI for interacting with the sr.ht API'
arch=('x86_64')
url='https://git.xenrox.net/~xenrox/srhtctl'
license=('GPL3')
makedepends=('git' 'go-pie')
provides=('srhtctl')
source=("$pkgname-$pkgver.tar.gz::https://git.xenrox.net/~xenrox/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('764e0c605714d4dce16c62f10c03cbdc9d978d1c65d8852804b05c9720065bf5')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make PREFIX=/usr
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make PREFIX=/usr DESTDIR="$pkgdir" install

    "$pkgdir/usr/bin/srhtctl" completionBASH | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/srhtctl"
    "$pkgdir/usr/bin/srhtctl" completionZSH | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_srhtctl"
    patch --forward --strip=1 --input="$srcdir/$pkgname-$pkgver/assets/srhtctl.patch" --directory="$pkgdir"
}
