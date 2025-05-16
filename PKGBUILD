# Maintainer: envolution
# Contributor: fuero <fuerob@gmail.com>
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=kwok
pkgver=0.7.0
pkgrel=1
pkgdesc='Kubernetes WithOut Kubelet - set up a cluster of thousands of (fake) nodes in seconds'
arch=('x86_64' 'i686')
url="https://github.com/kubernetes-sigs/${pkgname}"
license=('Apache')
makedepends=('go')
depends=('glibc')
source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('bf7c686c3ada070104f32fd3263686368cc981206770e81d39d8a27ae04368c0')

build() {
  cd "${pkgname}-${pkgver}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  make \
    EXTRA_LDFLAGS="-linkmode=external -w -s -v" \
    EXT_LDFLAGS="${LDFLAGS}" \
    VERSION="${pkgver}" \
    build
}

check() {
  cd "${pkgname}-${pkgver}"
  make unit-test
}

package() {
  declare -A arch_map=(
    [x86_64]=amd64
    [i686]=386
  )
  export GOARCH=${arch_map[$CARCH]:-}

  cd "${pkgname}-${pkgver}"
  for i in kwok kwokctl; do
    install -Dm755 "bin/linux/${GOARCH}/${i}" "$pkgdir/usr/bin/${i}"
  done

  install -dm755 "$pkgdir/usr/share/doc/$pkgname"
  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"

  install -m644 README.md CONTRIBUTING.md RELEASE.md SECURITY.md \
    "$pkgdir/usr/share/doc/$pkgname/"

  install -m644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/"

  if [ -f "code-of-conduct.md" ]; then
    install -m644 code-of-conduct.md "$pkgdir/usr/share/doc/$pkgname/"
  fi
}

# vim:set ts=2 sw=2 et:
