# Maintainer: ddennis <ddennis at mailbox dot org>

_gitname=fritzbox_exporter
_pkgname=prometheus-fritzbox-exporter
pkgname=${_pkgname}-sberk42-git
pkgver=r68.f47a658
pkgrel=2
pkgdesc="Prometheus UPnP exporter for Fritz!Box routers (sberk42 fork)"
arch=('x86_64')
url="https://github.com/sberk42/fritzbox_exporter"
license=('Apache')
depends=('glibc')
makedepends=('go' 'git')
backup=('etc/conf.d/prometheus-fritzbox-exporter')
source=("git+https://github.com/sberk42/fritzbox_exporter.git"
        "prometheus-fritzbox-exporter.service"
        "prometheus-fritzbox-exporter.conf")
sha256sums=('SKIP'
            '862d7a028de9a52ac11d1408d621cc727f59e1ccf85bca23e42032c945509411'
            '1faaf054a2b84a88ca8f3766346bba0dc63456fa62258c8fb5d66048cf052225')

pkgver() {
  cd "$_gitname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$srcdir/$_gitname"

  GOPATH="$srcdir" go get -v github.com/sberk42/fritzbox_exporter
}

package() {
  cd "$srcdir"

  install -Dm644 "$_pkgname.service" \
        "$pkgdir/usr/lib/systemd/system/$_pkgname.service"

  install -Dm644 "$_pkgname.conf" \
        "${pkgdir}/etc/conf.d/$_pkgname"

  install -Dm755 "bin/$_gitname" \
        "$pkgdir/usr/bin/$_pkgname"

  install -Dm644 "$_gitname/metrics.json" \
        "$pkgdir/opt/$_gitname/metrics.json"

  install -Dm644 "$_gitname/LICENSE" \
        "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}

