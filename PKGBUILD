# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=morty
pkgver=0.1.0
pkgrel=2
pkgdesc='Privacy-aware web content sanitizer proxy-as-a-service'
arch=(any)
url='https://github.com/asciimoo/morty'
license=(AGPL3)
conflicts=(morty-git)
makedepends=(go)
optdepends=('searx: A privacy-respecting, hackable metasearch engine'
            'searx-git: A privacy-respecting, hackable metasearch engine (Git)')
source=(https://github.com/asciimoo/morty/archive/v$pkgver.zip
        morty.service)
sha512sums=(ab37ba4c631a9a29dfe8002ddfa1b92e74cd199a066a0c5caea5e304d2bb994e825f2e43e895e74c101349163dcdbb236e3904806250831dc71d8b798455e39f
            b967d4aebbf869d5867c39ef50cc286c01b0c2ec7fdda4d4d92771a99847c85a3218cedd4bd55797d46ffa2f8a23e547a8326fb9a530214b544d1366c0232190)

prepare() {
  cd $srcdir
  sed -i "s/ultrasecretkey/`openssl rand -hex 128`/" morty.service
}

build() {
  cd $srcdir/morty-$pkgver
  GOPATH=$srcdir/morty go get -v -x github.com/asciimoo/morty
}

package() {
  cd $srcdir/morty
  install -D bin/morty $pkgdir/usr/bin/morty
  install -Dm 644 ../morty.service $pkgdir/usr/lib/systemd/system/morty.service
  install -Dm 644 ../morty-$pkgver/LICENSE $pkgdir/usr/share/licenses/morty/LICENSE
}
