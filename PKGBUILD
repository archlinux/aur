# Maintainer: minus <aur@mnus.de>

_gitname=fritzbox_exporter
_pkgname=prometheus-fritzbox-exporter
pkgname=${_pkgname}-git
pkgver=r47.5229b05
pkgrel=1
pkgdesc="Prometheus UPnP exporter for Fritz!Box routers"
arch=('x86_64' 'i686')
url="https://github.com/ndecker/fritzbox_exporter"
license=('Apache')
provides=("prometheus-fritzbox-exporter")
conflicts=("prometheus-fritzbox-exporter")
makedepends=('go' 'git')
#options=('!strip' '!emptydirs')
source=("git+https://github.com/ndecker/fritzbox_exporter.git"
        "prometheus-fritzbox-exporter.service")
sha256sums=('SKIP'
            '4630542c0ff89bf93ea430bde255d4557a09dbf7162dc877d7eb37b85d50715e')

pkgver() {
  cd "$_gitname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare(){
  cd "$srcdir/$_gitname"
  mkdir -p "$srcdir/bin"
}

build() {
  cd "$srcdir/$_gitname"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o "$srcdir/bin" .
}

package() {
  cd "$srcdir"

  install -Dm644 "$_pkgname.service" "$pkgdir/usr/lib/systemd/system/$_pkgname.service"
  install -Dm755 "bin/$_gitname" "$pkgdir/usr/bin/prometheus_$_gitname"
  install -Dm644 "$_gitname/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
