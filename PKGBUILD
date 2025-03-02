# Maintainer: chris.imx <chris.imx.aur@online.de>

pkgname=findmydeviceserver
pkgver=0.10.0
pkgrel=1
pkgdesc='Official server for the android app FindMyDevice (FMD) written in Go'
arch=('x86_64' 'armv7h' 'aarch64')
url=https://gitlab.com/Nulide/findmydeviceserver
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
source=(git+https://gitlab.com/Nulide/findmydeviceserver.git#tag=v${pkgver}
        findmydeviceserver.service
        findmydeviceserver.sysusers
        findmydeviceserver.tmpfiles)
sha256sums=('52777ee7364d061ec82f6f9a1002fb3209f86d66d515eeb4695ec06268f09f96'
            '97e417fc2f14e66aad74cfc4b357474e30006c357894bf459b1eca78e5fb6e1b'
            'd3f754171a12f8559de28b9c08699dd96f741abeb0f0e44dff9a912e9b381387'
            '73859307a7577701e3c711ce13da4b391179e2b43acff880e23ac01abc4bb8cb')
backup=(etc/fmdserver/config.yml)

build() {
  cd findmydeviceserver
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o fmdserver
  cd web
  npm install
}

package() {
  # sysusers.d integration
  install -Dm644 findmydeviceserver.sysusers "$pkgdir/usr/lib/sysusers.d/findmydeviceserver.conf"
  # tmpfiles.d integration
  install -Dm644 findmydeviceserver.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/findmydeviceserver.conf"

  install -Dm700 "${srcdir}/findmydeviceserver/config.example.yml" "$pkgdir/etc/fmdserver/config.yml"
  chmod 700 "$pkgdir/etc/fmdserver"
  install -Dm755 "${srcdir}/findmydeviceserver/fmdserver" "${pkgdir}/usr/bin/fmdserver"
  install -Dm644 "${srcdir}/findmydeviceserver.service" "${pkgdir}/usr/lib/systemd/system/findmydeviceserver.service"

  cd findmydeviceserver/web
  find . -type f -exec install -Dm 644 {} "$pkgdir/usr/share/webapps/fmdserver/"{} \;
}
