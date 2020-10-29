# Maintainer: ddennis <ddennis at mailbox dot org>

_gitname=fritzbox_exporter
_pkgname=prometheus-fritzbox-exporter
pkgname=${_pkgname}-sberk42-git
pkgver=r68.f47a658
pkgrel=1
pkgdesc="Prometheus UPnP exporter for Fritz!Box routers (sberk42 fork)"
arch=('x86_64' 'i686')
url="https://github.com/sberk42/fritzbox_exporter"
license=('Apache')
makedepends=('go' 'git')
source=("git+https://github.com/sberk42/fritzbox_exporter.git"
        "prometheus-fritzbox-exporter.service")
sha256sums=('SKIP'
            '298c952ea69e5231a140a6b7776538a1b24231dcfaa880b51654541382c80f59')

pkgver() {
  cd "$_gitname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$srcdir/$_gitname"

  GOPATH="$srcdir" go get -fix -v -x github.com/sberk42/fritzbox_exporter
}

package() {
  cd "$srcdir"

  install -Dm644 "$_pkgname.service" "$pkgdir/usr/lib/systemd/system/$_pkgname.service"
  install -Dm755 "bin/$_gitname" "$pkgdir/usr/bin/prometheus-fritzbox-exporter"
  install -Dm644 "$_gitname/metrics.json" "$pkgdir/opt/fritzbox_exporter/metrics.json"
  install -Dm644 "$_gitname/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}

