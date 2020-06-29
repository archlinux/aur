# Maintainer: minus <aur@mnus.de>

_gitname=fritzbox_exporter
_pkgname=prometheus-fritzbox-exporter
pkgname=${_pkgname}-git
pkgver=r21.834e250
pkgrel=2
pkgdesc="Prometheus UPnP exporter for Fritz!Box routers"
arch=('x86_64' 'i686')
url="https://github.com/ndecker/fritzbox_exporter"
license=('Apache')
makedepends=('go' 'git')
#options=('!strip' '!emptydirs')
source=("git+https://github.com/ndecker/fritzbox_exporter.git"
        "prometheus-fritzbox-exporter.service")
sha256sums=('SKIP'
            '39c76549474c9e1aa12d4800431b03024cfe1d9e258cb04db9e4377a7db9e00b')

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
