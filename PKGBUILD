# Maintainer: ddennis <ddennis at mailbox dot org>

_gitname=fritzbox_exporter
_pkgname=prometheus-fritzbox-exporter
pkgname=${_pkgname}-sberk42-git
pkgver=r75.fd48163
pkgrel=3
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
            '647b011ef843c2a0280789d69f4c0784317f10e655e8ddf3fdcdae90de4b0144')

pkgver() {
  cd "$_gitname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$srcdir/$_gitname"

  GOPATH="$srcdir" go get -v \
    -trimpath \
    -buildmode=pie \
    -ldflags "-extldflags ${LDFLAGS}
      -X github.com/prometheus/common/version.Version=${pkgver} \
      -X github.com/prometheus/common/version.Revision=${pkgver} \
      -X github.com/prometheus/common/version.Branch=tarball \
      -X github.com/prometheus/common/version.BuildUser=someone@builder \
      -X github.com/prometheus/common/version.BuildDate=$(date -d@"${SOURCE_DATE_EPOCH}" +%Y%m%d-%T)" \
    github.com/sberk42/fritzbox_exporter
}

package() {
  cd "$srcdir"

  install -Dm644 "$_pkgname.service" \
        "$pkgdir/usr/lib/systemd/system/$_pkgname.service"

  install -Dm644 "$_pkgname.conf" \
        "${pkgdir}/etc/conf.d/$_pkgname"

  install -Dm755 "bin/$_gitname" \
        "$pkgdir/usr/bin/$_pkgname"

  install -d "$pkgdir/usr/share/$_pkgname/"

  for file in $(find $_gitname -maxdepth 1 -type f -name *.json); do
        install -Dm644 ${file} "$pkgdir/usr/share/$_pkgname/"
  done

  install -Dm644 "$_gitname/LICENSE" \
        "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}

