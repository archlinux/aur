# Maintainer: chris.imx <chris.imx.aur@online.de>

pkgname=findmydeviceserver
pkgver=0.14.1
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
  nodejs
  pnpm
)
source=(git+https://gitlab.com/fmd-foss/fmd-server.git#tag=v${pkgver}
        findmydeviceserver.service
        findmydeviceserver.sysusers
        findmydeviceserver.tmpfiles
	modify-defaults-db-and-unix-socket-path.patch
)
sha256sums=('683f66c7507c7bbaa71cffb5c5f1dd0f9b51f9d55c561b71ea7ec6b08fbd9688'
            'f3d973cee143e7ba182ad3f228f2d5f15f5847dd6eeb48ea0122aa7c298a3cd6'
            'd3f754171a12f8559de28b9c08699dd96f741abeb0f0e44dff9a912e9b381387'
            'cb1daf2913c9c76125b79a037bb0d1a7bd8f0224cf98abfd0af0886ff729073d'
            'da443f6b578c67729922a282123422d0c9d75e9f9aa49cc057f6f3b212de1ff4')
backup=(etc/fmdserver/config.yml)


prepare() {
  cd fmd-server
  patch -p1 -i ../modify-defaults-db-and-unix-socket-path.patch
}

build() {
  # Build frontend
  cd fmd-server/web
  pnpm install
  pnpm build
  # Build backend
  cd ..
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

