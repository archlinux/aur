# Maintainer: chris.imx <chris.imx.aur@online.de>

pkgname=findmydeviceserver
pkgver=0.7.0
pkgrel=1
pkgdesc='Official server for the android app FindMyDevice (FMD) written in Go'
arch=('x86_64' 'armv7h' 'aarch64')
url=https://gitlab.com/Nulide/findmydeviceserver
license=(GPL-3.0-or-later)
provides=("findmydeviceserver=${pkgver}")
depends=(
  libobjectbox
)
makedepends=(
  npm
  git
  go
)
source=(git+https://gitlab.com/Nulide/findmydeviceserver.git#tag=v${pkgver}
	add-web-and-config-dir-option.patch
	findmydeviceserver.service
	findmydeviceserver.sysusers
	findmydeviceserver.tmpfiles)
sha256sums=('e0228c39b7b4517235a4694d188023f50cdccc05b4e38fdb7bbd1a62ad150c84'
            'f2a99e8d8c80152e91de085b4bb6035fa644ff08556d4bf86f38fa94c796ddcb'
            'e25b578bf128c75372669801a5cd7197cc9f3f4ceedc0819dbd30a2053f53e7b'
            'd3f754171a12f8559de28b9c08699dd96f741abeb0f0e44dff9a912e9b381387'
            '73859307a7577701e3c711ce13da4b391179e2b43acff880e23ac01abc4bb8cb')
backup=(etc/fmdserver/config.yml)
prepare() {
  cd findmydeviceserver
  patch -Np1 -i ../add-web-and-config-dir-option.patch
}

build() {
  cd findmydeviceserver
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o fmdserver cmd/fmdserver.go
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
