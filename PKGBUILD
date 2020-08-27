# Maintainer: ppum <ppum.ris[at]gmail.com>

pkgname=prometheus-filestat-exporter
pkgver=0.3.1
pkgrel=1
pkgdesc=" Prometheus exporter gathering metrics about file size, modification time and other stats"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/michael-doubez/filestat_exporter"
license=('Apache License 2.0')
depends=('glibc')
makedepends=('git' 'go')
source=("https://github.com/michael-doubez/filestat_exporter/archive/v${pkgver}.tar.gz" 
        "filestat_exporter.service")
sha256sums=('dfac613ac847f68bd108304c04aed291d9a4867765ea022671d092415eaa2451'
            '98fe9a057165078f200c7e389d6d11f128d1e2a2c2276dda5f240474ce5b4a15')

prepare() {
  cd "${srcdir}/filestat_exporter-${pkgver}"

  export GOPATH="${srcdir}/gopath"
  export GOBIN="${GOPATH}/bin"
  mkdir -p "${GOPATH}/src/github.com/michael-doubez"
  ln -snf "${srcdir}/filestat_exporter-${pkgver}" \
    "${GOPATH}/src/github.com/michael-doubez/filestat_exporter"
}

build() {
  export GOPATH="${srcdir}/gopath"
  cd "${GOPATH}/src/github.com/michael-doubez/filestat_exporter"

  make build
}

# check() {
#   export GOPATH="${srcdir}/gopath"
#   cd "${GOPATH}/src/github.com/michael-doubez/filestat_exporter"

#   make check
# }

package() {
  install -Dm755 "${srcdir}/filestat_exporter-${pkgver}/filestat_exporter" "${pkgdir}/usr/bin/filestat_exporter"
  install -Dm644 "filestat_exporter.service" \
    "${pkgdir}/usr/lib/systemd/system/filestat_exporter.service"
  install -Dm644 "${srcdir}/filestat_exporter-${pkgver}/filestat.yaml" \
	"${pkgdir}/etc/filestat_exporter/filestat.yaml"
}
