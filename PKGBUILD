# Maintainer: Prasanth Baskar (bupdprasanth@gmail.com)
# Contributor: Buildpacks Maintainers <cncf-buildpacks-maintainers at lists dot cncf dot io>

_base=pack
pkgname=pack-cli-git
pkgver=0.38.2
pkgrel=1
pkgdesc="CLI for building apps using Cloud Native Buildpacks"
depends=('glibc')
makedepends=('go' 'git')
arch=('x86_64')
url="https://buildpacks.io/"
license=('Apache-2.0')
conflicts=('pack' 'pack-cli')
options=(!debug !lto)
source=("git+https://github.com/buildpacks/${_base}.git#tag=v${pkgver}")
sha512sums=('SKIP')

prepare() {
  cd ${_base}
  mkdir -p dist/
}

build() {
  cd ${_base}
  local _BUILDINFO="-X 'github.com/buildpacks/pack.Version=v${pkgver}'"
  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\" ${_BUILDINFO}" \
    -o "dist/${_base}" \
    -a ./cmd/pack
}

# Seems like it needs docker
# check() {
#   cd ${_base}
#   local GOTESTFLAGS="-v -count=1 -parallel=1"
#   go test ./...
# }

package() {
  cd ${_base}
  install -vDm 755 "dist/${_base}" "${pkgdir}/usr/bin/${_base}"
  install -vDm 644 LICENSE  "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
