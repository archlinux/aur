# Maintainer: Rocket Aaron <rocka@archlinuxcn.org>

_pkgname=goatcounter
pkgname="${_pkgname}-git"
pkgver=2.7.0.r127.gc031008
pkgrel=1
pkgdesc='Open source web analytics platform'
url='https://github.com/arp242/goatcounter'
arch=(x86_64)
license=(0BSD)
conflicts=("${_pkgname}")
provides=("${_pkgname}")
backup=('etc/goatcounter/config.env')
depends=(glibc)
makedepends=(go git)
source=("git+${url}.git"
        'config.env'
        'goatcounter.service')
sha256sums=('SKIP'
            '2a0eafad7ae06e78bc9b5260cc4644a959eec6b59495317c2a3b73e1feb61bd5'
            '2059df91b1f1e57e92e2e07ca374f100ce09f8319388065167129dace7c44c1c')

pkgver() {
  cd "${_pkgname}"
  git describe --tags --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${_pkgname}"
  # create directory for build output
  mkdir build
  # download dependencies
  export GOPATH="${srcdir}"
  go mod download
}

build() {
  cd "${_pkgname}"
  # set Go flags
  export CGO_ENABLED=1
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOPATH="${srcdir}"
  go build -v \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-compressdwarf=false \
    -linkmode external \
    -s -w -buildid='' \
    -extldflags '${LDFLAGS}'" \
    -tags='osusergo,netgo,sqlite_omit_load_extension' \
    -o build/goatcounter \
    ./cmd/goatcounter
}

package() {
  cd "${_pkgname}"
  install -vDm755 -t "${pkgdir}/usr/bin" build/goatcounter
  install -vDm644 -t "${pkgdir}/etc/goatcounter" "${srcdir}/config.env"
  install -vDm644 -t "${pkgdir}/usr/lib/systemd/system" "${srcdir}/goatcounter.service"
  install -vDm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
