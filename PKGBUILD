# Maintainer: Andreas Schild <schuedi56@gmail.com>

pkgname=tegola-headless
_pkgname=tegola
pkgver=0.21.0
pkgrel=1
pkgdesc='Vector tile server for Mapbox Vector Tiles without the built-in web viewer'
arch=('x86_64')
url='https://github.com/go-spatial/tegola'
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
provides=('tegola')
conflicts=('tegola' 'tegola-debug')
backup=('etc/tegola/tegola.toml')
install=tegola.install
source=(
  "${_pkgname}-${pkgver}.tar.gz::https://github.com/go-spatial/tegola/archive/refs/tags/v${pkgver}.tar.gz"
  "tegola.service"
  "tegola.sysusers"
  "tegola.tmpfiles"
  "tegola.toml.example"
)
sha256sums=('f3c24e9d0d95f07a1da7de1312334574f2dac0cd3e0d5c74b7724d54f3d290df'
            '323a58c40a1d3234aed395b56a159ec30136ac4f655e1c89116da668f7c92fa1'
            '886c0e2975ee6ea165873990c6f64b3cf493408c2545a5f7a11735ee1e10c79f'
            '6815cd147af6a14b8cb9faf069a97fafb283d3a795510c83fa61cf4202a10a86'
            '117bfeccd4cb7f423856ba9af75bacbf89c975b50db4bbd35b143b83878ea287')

prepare() {
  cd "${_pkgname}-${pkgver}"

  mkdir -p build
}

build() {
  cd "${_pkgname}-${pkgver}"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

  go build \
    -ldflags "\
      -linkmode external \
      -X github.com/go-spatial/tegola/internal/build.Version=v${pkgver} \
      -X github.com/go-spatial/tegola/internal/build.GitRevision=archive \
      -X github.com/go-spatial/tegola/internal/build.GitBranch=v${pkgver}" \
    -o build/tegola \
    ./cmd/tegola
}

check() {
  cd "${_pkgname}-${pkgver}"

  ./build/tegola version
}

package() {
  cd "${_pkgname}-${pkgver}"

  install -Dm755 build/tegola "${pkgdir}/usr/bin/tegola"

  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"

  install -Dm644 "${srcdir}/tegola.service" \
    "${pkgdir}/usr/lib/systemd/system/tegola.service"

  install -Dm644 "${srcdir}/tegola.sysusers" \
    "${pkgdir}/usr/lib/sysusers.d/tegola.conf"

  install -Dm644 "${srcdir}/tegola.tmpfiles" \
    "${pkgdir}/usr/lib/tmpfiles.d/tegola.conf"

  install -Dm640 "${srcdir}/tegola.toml.example" \
    "${pkgdir}/etc/tegola/tegola.toml"
}
