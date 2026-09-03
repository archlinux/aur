# SPDX-License-Identifier: 0BSD
# Maintainer: Margot <mopigames at proton dot me>

pkgname=soloistd
pkgver=0.2.0
pkgrel=1
pkgdesc='Manage Spotify Soloist as a user service with automatic updates'
arch=('x86_64' 'aarch64' 'armv7h')
url='https://github.com/MopigamesYT/soloistd'
license=('MPL-2.0')
depends=('glibc' 'systemd')
makedepends=('go')
options=('!debug')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('5e9ed72b4cffa21bdb81ae7de2b5606a9e8d8494222d4b1fb4fb0fdf77b21e5b')

prepare() {
  cd "${pkgname}-${pkgver}"
  mkdir -p build
}

build() {
  cd "${pkgname}-${pkgver}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS='-buildmode=pie -trimpath -mod=vendor -modcacherw'
  go build -ldflags='-linkmode=external' -o build/soloistd .
}

check() {
  cd "${pkgname}-${pkgver}"
  go test -mod=vendor ./...
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 build/soloistd "${pkgdir}/usr/bin/soloistd"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/soloistd/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/soloistd/LICENSE"
}
