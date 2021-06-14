# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=nomad-driver-nspawn
pkgver=0.7.0
pkgrel=1
pkgdesc="A nomad taskdriver for systemd-nspawn"
arch=('x86_64')
url="https://github.com/JanMa/nomad-driver-nspawn"
license=('MIT')
depends=('nomad' 'systemd')
makedepends=('go' 'git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('ea6ef6848ba680450769a9bd8c1dae316dee4d3904a69365ac254f7489a06daefa71f6728ddddae9f5aef6e1f84c3e5bef26f80e28ee9e82cf6e86402dfbffd7')

prepare() {
	cd "$pkgname-$pkgver"
  mkdir build
  go mod vendor
}

build() {
	cd "$pkgname-$pkgver"
  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-extldflags $LDFLAGS -X "main.Version=${pkgver}"" \
    -o build \
    .
}

package() {
	cd "$pkgname-$pkgver"

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
  cp -r example "$pkgdir/usr/share/doc/$pkgname"

  # plugin
  install -vDm755 -t "$pkgdir/var/lib/nomad/plugins" "build/$pkgname"

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
