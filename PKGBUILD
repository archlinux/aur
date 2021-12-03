# Maintainer: Daniel Milde <daniel at milde dot cz>
# Co-maintainer: Leonidas Spyropoulos <artafinde at gmail dot com>

pkgname=gdu
pkgver=5.12.0
pkgrel=1
license=('MIT')
pkgdesc="Fast disk usage analyzer"
depends=('glibc')
makedepends=('go' 'git')
arch=('x86_64')
url="https://github.com/dundee/gdu"
_tag=7365b42b9ef0bcf5b4b6866cc9fb62b0dafa8048 # git rev-parse ${pkgver}
source=("git+https://github.com/dundee/gdu.git#tag=${_tag}?signed")
sha256sums=(SKIP)
validpgpkeys=(
  360B658707A1A44CA57FB67EEF0BA1C4F3990103  # Daniel Milde <daniel@milde.cz>, retrieved from https://github.com/dundee.gpg
  )

prepare() {
  cd ${pkgname}
  mkdir -p dist/
}

pkgver() {
  cd ${pkgname}
  git describe --tags | sed 's/^v//'
}

build() {
  cd ${pkgname}
  local _DATE=$(date +'%Y-%m-%d')
  local _BUILDINFO="-X 'github.com/dundee/gdu/v5/build.Version=${pkgver}' \
                    -X 'github.com/dundee/gdu/v5/build.User=${PACKAGER}' \
                    -X 'github.com/dundee/gdu/v5/build.Time=${_DATE}'"
  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\" ${_BUILDINFO}" \
    -o dist/gdu \
    github.com/dundee/gdu/v5/cmd/gdu
}

check() {
  cd ${pkgname}
  go test ./...
}

package() {
  cd ${pkgname}
  install -Dm755 dist/$pkgname "${pkgdir}/usr/bin/$pkgname"
  install -Dm644 gdu.1    "${pkgdir}/usr/share/man/man1/$pkgname.1"
  install -D -m644 LICENSE.md  "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:

