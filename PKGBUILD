# Maintainer: chris.imx <chris.imx.aur@online.de>

pkgname=findmydeviceserver
pkgver=0.12.0
pkgrel=1
pkgdesc='Official server for the android app FindMyDevice (FMD) written in Go'
arch=('x86_64' 'armv7h' 'aarch64')
url=https://gitlab.com/fmd-foss/fmd-server
license=(GPL-3.0-or-later)
provides=("findmydeviceserver=${pkgver}")
depends=(
  glibc
)
makedepends=(
  npm
  git
  go
)
source=(git+https://gitlab.com/fmd-foss/fmd-server.git#tag=v${pkgver}
        findmydeviceserver.service
        findmydeviceserver.sysusers
        findmydeviceserver.tmpfiles)
sha256sums=('bfc56e3819723f9861bc5d1498c13de9891cbc6863b6c7f738a18a2db644410a'
            'fff7ce0ed640e91e2dc38649727bac59bc79382316f534da89603d2dac857db4'
            'd3f754171a12f8559de28b9c08699dd96f741abeb0f0e44dff9a912e9b381387'
            '73859307a7577701e3c711ce13da4b391179e2b43acff880e23ac01abc4bb8cb')
backup=(etc/fmdserver/config.yml)

build() {
  cd fmd-server
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  # Although FMD Server does not need CGO or glibc to compile, it is currently
  # the only option to make the binary full RELRO
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o fmd-server
}

package() {
  # sysusers.d integration
  install -Dm644 findmydeviceserver.sysusers "$pkgdir/usr/lib/sysusers.d/findmydeviceserver.conf"
  # tmpfiles.d integration
  install -Dm644 findmydeviceserver.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/findmydeviceserver.conf"

  install -Dm700 "${srcdir}/fmd-server/config.example.yml" "$pkgdir/etc/fmdserver/config.yml"
  chmod 700 "$pkgdir/etc/fmdserver"
  install -Dm755 "${srcdir}/fmd-server/fmd-server" "${pkgdir}/usr/bin/fmdserver"
  install -Dm644 "${srcdir}/findmydeviceserver.service" "${pkgdir}/usr/lib/systemd/system/findmydeviceserver.service"
}
