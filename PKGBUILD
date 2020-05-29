# Maintainer: Celogeek <private-4zokpdq6@mrhyde.xyz>
_pkgname=google-safebrowsing-api
pkgname=${_pkgname}-git
pkgver=r53.bbf0d20
pkgrel=1
pkgdesc="Google SafeBrowsing API"
url="https://github.com/google/safebrowsing/"
license=('Apache')
provides=($_pkgname)
conflicts=($_pkgname)
source=(
  "$_pkgname::git+https://github.com/google/safebrowsing.git"
  "service"
  "config"
  "sysusers.conf"
  "tmpfiles.conf"
)
arch=('x86_64')
noextract=()
makedepends=(git go)
depends=(glibc)
backup=(
	"etc/google-safebrowsing-api/config"
)

pkgver() {
  cd $_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $_pkgname
  mkdir -p build
}

build() {
  cd $_pkgname
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build -o build ./cmd/...
}

package() {
echo
  install -Dm755 -t "${pkgdir}/usr/lib/${pkgname}" "$_pkgname/build/"*
  install -dm750 "$pkgdir/etc/$_pkgname"
  install -Dm644 -t "$pkgdir/etc/$_pkgname" config
  install -Dm644 "service" $pkgdir/usr/lib/systemd/system/$_pkgname.service
  install -Dm644 "sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/$_pkgname.conf"
  install -Dm644 "tmpfiles.conf" "${pkgdir}/usr/lib/tmpfiles.d/$_pkgname.conf"
}
sha256sums=('SKIP'
            'ab8a048d0d3898e0e0e3db59a8973d0c63f291af170fbed634102f2d5ef98971'
            '67a1ecce83116dc1c1f5d969afe14c620dd0f421969648ecd26a88fa8b6cfd39'
            'f20894460878cb4095ece82cad222e0bac59f2a7a3f9c47f7622afce20e9f70c'
            'f275f9f9127f5ae7a527a7ef88dcb31711e9e2ec6944d5769286764de440dcbd')
