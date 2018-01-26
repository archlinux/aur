# Maintainer: Jean Lucas <jean@4ray.co>
# Contributor: Arthur Țițeică / arthur dot titeica with gmail

pkgname=morty-git
pkgver=0+73+5dca044
pkgrel=2
pkgdesc='Privacy-aware web content sanitizer proxy-as-a-service'
arch=(any)
url='https://github.com/asciimoo/morty'
license=(AGPL3)
provides=(morty)
makedepends=(git go)
optdepends=('searx-git: A privacy-respecting, hackable metasearch engine')
source=(git+https://github.com/asciimoo/morty.git
        morty.service)
sha512sums=(SKIP
            b967d4aebbf869d5867c39ef50cc286c01b0c2ec7fdda4d4d92771a99847c85a3218cedd4bd55797d46ffa2f8a23e547a8326fb9a530214b544d1366c0232190)

pkgver() {
  cd $srcdir/morty

  printf 0+%s+%s $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

prepare() {
  cd $srcdir

  sed -i "s/ultrasecretkey/`openssl rand -hex 128`/" morty.service
}

build() {
  cd $srcdir/morty

  GOPATH=$srcdir/morty go get -v -x github.com/asciimoo/morty
}

package() {
  cd $srcdir/morty

  install -D bin/morty $pkgdir/usr/bin/morty
  install -Dm 644 ../morty.service $pkgdir/usr/lib/systemd/system/morty.service
}
