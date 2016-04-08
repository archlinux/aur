# Maintainer: Dennis Fink <metalgamer@c3l.lu>
# Contributor: Rémi Audebert <rflah0@gmail.com>

_pkgname=node_exporter
pkgname=prometheus-node-exporter
pkgver=0.11.0
pkgrel=1
pkgdesc="Prometheus exporter for machine metrics "
arch=('x86_64' 'i686')
url="https://github.com/prometheus/node_exporter"
conflicts=($pkgname)
provides=($pkgname)
license=('Apache')
makedepends=('go' 'git' 'mercurial')
options=('!strip' '!emptydirs')
source=("https://github.com/prometheus/node_exporter/archive/${pkgver}.tar.gz"
  "prometheus-node-exporter.service")
sha256sums=('459580fab840432ee520b9341b8361fe6017d271cf2502c07b95225a6fb966b6'
            '360d44488e2c0617e8436e2420e9e1a1e657055b1bb41e1e121524f7dc99ed57')

build() {
  patch -p0 < ../Makefile.COMMON.patch
  mkdir -p "$_pkgname-$pkgver/Godeps"
  cp -fr ../Godeps.json "$_pkgname-$pkgver/Godeps"
  cd "$_pkgname-$pkgver"

  make
}

package() {
  install -Dm755 prometheus-node-exporter.service "$pkgdir/usr/lib/systemd/system/prometheus-node-exporter.service"

  cd "$_pkgname-$pkgver"

  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/prometheus_$_pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
