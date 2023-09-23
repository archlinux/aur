# Maintainer: travisghansen <travisghansen@yahoo.com>

pkgname=flintlock
pkgver=0.6.0
pkgrel=1
pkgdesc="Service for creating and managing the lifecycle of microVMs on a host machine"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://weaveworks-liquidmetal.github.io/flintlock/docs/intro/"
license=('MPL2')
depends=(
  'containerd'
)
optdepends=(
  'firecracker: use firecracker provider'
  'cloud-hypervisor: use cloud-hypervisor provider'
)

makedepends=('git' 'go>=1.17')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/weaveworks-liquidmetal/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz" "config.yaml" "flintlockd.service")
sha256sums=('1b687a1ecbc98cb50e74387a9e2c1156c431439bd7743e498d52baad388f8107'
            '13c4ed05ae1564c8c6a2fb7272d9f908d8b093c00160c471567127ea9337c804'
            'e6237646734ea3ad36c84709cc1733e5287d4d046a5fec10c1f0a5d30e0e0e25')

build() {
  export GOPATH="$srcdir"/gopath
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_ENABLED=1
  # flintlockd, version=v0.5.0, built_on=2023-01-13T16:08:07Z, commit=b1354ef
  #export GOFLAGS="-ldflags -X ${pkgname}.Version=${pkgver} -X ${pkgname}.BuildDate=$(date -u +'%Y-%m-%dT%H:%M:%SZ')"

  cd "$srcdir/$pkgname-$pkgver"
  sed -i 's:/etc/opt/flintlockd:/etc/flintlockd:g' pkg/defaults/defaults.go
  sed -i 's:cloud-hypervisor-static:cloud-hypervisor:g' pkg/defaults/defaults.go
  make VERSION=$pkgver DESTDIR="$pkgdir" PREFIX="/usr" build
}

package() {
  cd "${srcdir}"
  install -dm 750 "${pkgdir}/var/lib/${pkgname}"
  install -dm 750 "${pkgdir}/etc/${pkgname}d"
  install -Dm 640 config.yaml "${pkgdir}/etc/${pkgname}d/"

  install -dm 755 ${pkgdir}/usr/lib/systemd/system
  install -m 644 flintlockd.service ${pkgdir}/usr/lib/systemd/system

  cd "$srcdir/$pkgname-$pkgver/bin"
  install -d "${pkgdir}/usr/bin"
  find . -type f -exec install -Dm 755 "{}" "${pkgdir}/usr/bin/{}" \;
}
