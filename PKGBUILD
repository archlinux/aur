# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=fq-git
pkgver=0.0.2.r11.g12c45683
pkgrel=1
pkgdesc="Tool, language and decoders for inspecting binary data (git)"
arch=('x86_64')
url="https://github.com/wader/fq"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=("git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"
  mkdir -p dist/
}

build() {
  cd "${pkgname%-git}"
  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\" ${_BUILDINFO}" \
    -o dist/fq \
    .
}

check() {
  cd "${pkgname%-git}"
  go test ./...
}

package() {
  cd "${pkgname%-git}"
  install -Dm 755 "dist/${pkgname%-git}" -t "${pkgdir}/usr/bin"
  install -Dm 644 LICENSE  -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
