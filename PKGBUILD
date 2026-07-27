# Maintainer: brokenpip3 <brokenpip3[at]gmail[dot]com>
# Maintainer: Thomas Labarussias <issif+aur@gadz.org>
# https://github.com/brokenpip3/my-pkgbuilds

pkgname=falcosidekick
pkgver=2.34.1
pkgrel=4
pkgdesc="Connect Falco to your ecosystem"
backup=('etc/falcosidekick/config.yaml')
arch=('x86_64')
url="https://github.com/falcosecurity/falcosidekick"
license=('MIT')
makedepends=('go' 'git' 'make')
source_x86_64=(
    "git+$url#tag=${pkgver}"
    "config.yaml"
    "falcosidekick.service"
    )
sha256sums_x86_64=('bf2f54ab0e8102c3905a787c589661d89a96376c050110d7dc28000d9f81b8b7'
                   'd88456b95bd443c40ee6db866cb0784efb706c865caa4d8dc4f2ea982f9711b4'
                   'ff1b7c4485115b17d90751ddc8d548718dfe7a575bcfd75268493656196746d5')

build() {
  cd "$pkgname"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  make falcosidekick
}

check() {
  cd "$pkgname"
  export TEST_FLAGS="-v"
  make test
}

package() {
  install -Dm755 "${srcdir}/${pkgname}/falcosidekick" "${pkgdir}/usr/bin/falcosidekick"
  install -Dm644 "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/${pkgname}/config_example.yaml" "${pkgdir}/usr/share/${pkgname}/config_example.yaml"
  install -Dm640 "${srcdir}/config.yaml" "${pkgdir}/etc/falcosidekick/config.yaml"
  install -Dm644 "${srcdir}/falcosidekick.service" "${pkgdir}/usr/lib/systemd/system/falcosidekick.service"
}
