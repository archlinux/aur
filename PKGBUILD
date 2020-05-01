# Maintainer: minus <aur@mnus.de>

_gitname=fritzbox_exporter
_pkgname=prometheus-fritzbox-exporter
pkgname=${_pkgname}-git
pkgver=r21.834e250
pkgrel=1
pkgdesc="Prometheus UPnP exporter for Fritz!Box routers"
arch=('x86_64' 'i686')
url="https://github.com/ndecker/fritzbox_exporter"
license=('Apache')
makedepends=('go' 'git')
#options=('!strip' '!emptydirs')
source=("git+https://github.com/ndecker/fritzbox_exporter.git"
        "prometheus-fritzbox-exporter.service")
sha256sums=('SKIP'
            '3b65f0e3fc9da83c58838caef5d16e3b5464efc9bd30f1e7716920273674f46f')

pkgver() {
  cd "$_gitname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$srcdir/$_gitname"

  GOPATH="$srcdir" go get -fix -v -x github.com/ndecker/fritzbox_exporter
}

package() {
  cd "$srcdir"

  install -Dm644 "$_pkgname.service" "$pkgdir/usr/lib/systemd/system/$_pkgname.service"
  install -Dm755 "bin/$_gitname" "$pkgdir/usr/bin/prometheus_$_gitname"
  install -Dm644 "$_gitname/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
