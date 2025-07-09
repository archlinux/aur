# Maintainer: chris.imx <chris.imx.aur@online.de>

pkgname=findmydeviceserver
pkgver=0.11.0
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
sha256sums=('26c3c8debb42ffc9ec9a6dfe51bd5290ba7544742f09f3b468a7b66bd1230313'
            '97e417fc2f14e66aad74cfc4b357474e30006c357894bf459b1eca78e5fb6e1b'
            'd3f754171a12f8559de28b9c08699dd96f741abeb0f0e44dff9a912e9b381387'
            '73859307a7577701e3c711ce13da4b391179e2b43acff880e23ac01abc4bb8cb')
backup=(etc/fmdserver/config.yml)

build() {
  cd fmd-server
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o fmd-server
  cd web
  npm install
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

  cd fmd-server/web
  find . -type f -exec install -Dm 644 {} "$pkgdir/usr/share/webapps/fmdserver/"{} \;
}
