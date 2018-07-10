# Maintainer: Jean Lucas <jean@4ray.co>
# Contributor: Arthur Țițeică / arthur dot titeica with gmail

pkgname=morty-git
pkgver=0.2.0+1+g21d656b
pkgrel=1
pkgdesc='Privacy-aware web content sanitizer proxy-as-a-service (Git)'
arch=(any)
url=https://github.com/asciimoo/morty
license=(AGPL3)
provides=(morty)
conflicts=(morty)
makedepends=(git go)
optdepends=('searx: A privacy-respecting, hackable metasearch engine'
            'searx-git: A privacy-respecting, hackable metasearch engine (Git)')
install=morty.install
source=(git+$url
        morty.service
        morty.install)
sha512sums=(SKIP
            b967d4aebbf869d5867c39ef50cc286c01b0c2ec7fdda4d4d92771a99847c85a3218cedd4bd55797d46ffa2f8a23e547a8326fb9a530214b544d1366c0232190
            008c5adb2d049e13233852eb51b237a6411c57e662572b1ec79a1b5aae620dbfc97084494477d2ff6330d2bb298ba18fa4c5823eee8b9c40e19581a751506e1a)

pkgver() {
  cd morty
  git describe --tags | sed 's/v//;s/-/+/g'
}

prepare() {
  sed -i "s/ultrasecretkey/`openssl rand -hex 64`/" morty.service
}

build() {
  cd morty
  GOPATH=$srcdir/morty go get -v -x github.com/asciimoo/morty
}

package() {
  install -D morty/bin/morty $pkgdir/usr/bin/morty
  install -Dm 644 morty.service $pkgdir/usr/lib/systemd/system/morty.service
  install -Dm 644 morty/LICENSE $pkgdir/usr/share/licenses/morty/LICENSE
}
