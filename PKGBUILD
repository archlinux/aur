# Maintainer: Thorben Günther <echo YWRtaW5AeGVucm94Lm5ldAo= | base64 -d>

pkgname=srhtctl
pkgver=0.3.1
pkgrel=1
pkgdesc='CLI for interacting with the sr.ht API'
arch=('x86_64')
url='https://git.xenrox.net/~xenrox/srhtctl'
license=('GPL3')
makedepends=('git' 'go-pie')
provides=('srhtctl')
source=("$pkgname-$pkgver.tar.gz::https://git.xenrox.net/~xenrox/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('b7a1ab59c6f0c8c2efa728ffc70668c277e1bb48f9b6e05f2c323208e84075de')

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
