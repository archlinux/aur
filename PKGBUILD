# Maintainer: Felix Yan <felixonmars@gmail.com>

pkgname=dnspod-sr-git
_pkgname=dnspod-sr
pkgver=32550ab
pkgrel=1
pkgdesc="A faster recursive dns server from DNSPod"
arch=('i686' 'x86_64')
url="https://github.com/DNSPod/dnspod-sr"
license=('BSD')
makedepends=('git')
depends=('glibc')
source=("git://github.com/DNSPod/dnspod-sr.git"
        dnspod-sr.service)

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --always | sed 's|-|.|g'
}

build() {
  cd "$srcdir/$_pkgname/src"
  sed -e "s|\.\./log/|/var/log/|" -i ../sr.conf
  sed -e "s|\.\./root.z|/usr/share/$pkgname/root.z|" -i io.c
  make
}

package() {
  cd "$srcdir/$_pkgname"

  install -Dm755 src/dnspod-sr "$pkgdir/usr/bin/dnspod-sr"
  install -Dm644 root.z "$pkgdir/usr/share/$pkgname/root.z"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 sr.conf "$pkgdir/etc/${_pkgname}.conf"
  install -Dm644 ../dnspod-sr.service "$pkgdir/usr/lib/systemd/system/dnspod-sr.service"
}

sha512sums=('SKIP'
            '1b5540a23dddb7633e1d76a750146ab457bc2086c7cf77489f5ef6025a00528df6f2a6cf1dd8ec93a8b1b7b03c6006e2b144097a2abdb2af755afd1dde874487')
