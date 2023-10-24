# Maintainer: Fabien LEFEBVRE <contact@d1ceward.com>

pkgname=herokuish
pkgver=0.7.2
pkgrel=2
pkgdesc='Utility for emulating Heroku build and runtime tasks in containers'
arch=('x86_64')
url='https://github.com/gliderlabs/herokuish'
license=('MIT')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('08e6a8f27f61f3768697de2088cd97af2ca8420fbf4581acca2d6df4f39cd2c6')
makedepends=('go'
             'go-bindata')

build() {
  cd "${pkgname}-${pkgver}"

  # Generate buildpacks info
  export BUILDPACK_ORDER=$(grep "BUILDPACK_ORDER :=" Makefile | sed 's/BUILDPACK_ORDER := //g')
  count=0
  for buildpack in $BUILDPACK_ORDER; do
    buildpack_count=$(printf '%02d' $count)
    buildpack_info=$(cat buildpacks/*-${buildpack}/buildpack* | sed 'N;s/\n/ /')

    echo "${buildpack_count}_buildpack-${buildpack} ${buildpack_info}"

    count=$((count + 1))
  done > include/buildpacks.txt
  go-bindata include

  # Build executable
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build -ldflags "-X main.Version=${pkgver}" -o "${pkgname}-build" .
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm755 herokuish-build "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
