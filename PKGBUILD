# Maintainer: Davide Depau <davide@depau.eu>

_pkgname=sway-accel-rotate
pkgname="${_pkgname}-git"
pkgver=r4.db52ad3
pkgrel=2
pkgdesc="Rotate Sway outputs based on current accelerometer orientation using iio-sensor-proxy"
arch=('i686' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64' 'pentium4')
url="https://github.com/Depau/sway-accel-rotate"
license=('MIT')
depends=(
  'iio-sensor-proxy'
)
makedepends=(
  'go'
)
source=(
  "${_pkgname}::git+${url}.git"
)
sha1sums=(
  SKIP
)

pkgver() {
  cd "$srcdir/$_pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  export GOPATH="$srcdir/gopath"
  cd "$srcdir/$_pkgname"
  
  EXTRA_GOFLAGS="-modcacherw -gcflags all=-trimpath=${PWD} -asmflags all=-trimpath=${PWD}"
  LDFLAGS="-linkmode external -extldflags \"${LDFLAGS}\""
  go build ${GOFLAGS} -ldflags "-s -w ${LDFLAGS}" ${EXTRA_GOFLAGS} -o "${_pkgname}"
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  install -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
