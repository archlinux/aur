# Maintainer: Wuxxin <wuxxin@gmail.com>

pkgname=signal-cli-rest-api-git
pkgver=0.99.r8.gdb63fd1
pkgrel=1
pkgdesc="A small REST API around signal-cli (Go implementation)"
arch=('x86_64' 'aarch64')
url="https://github.com/bbernhard/signal-cli-rest-api"
license=('MIT')
depends=('signal-cli')
makedepends=('go' 'git')
provides=('signal-cli-rest-api')
conflicts=('signal-cli-rest-api')
source=(
  "${pkgname}::git+https://github.com/bbernhard/signal-cli-rest-api.git"
  "signal-api.service"
  "signal-api.env"
  "polling-support.patch"
)

sha256sums=('SKIP'
            'bf7360e70cfa83e47408fdadcb5b19177fcf4c8d9bf5c67bda97b3e356edb7fe'
            '047a2ab37457609eea76d47c8db2df0f0148990b9ea50946f7168d13ef8da15f'
            'bf9645023b0f23df716ddd5ae3dab241de8a8d9ddea0951f84a917e3cafdbdaa')

pkgver() {
  cd "${srcdir}/${pkgname}"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "0.0.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "${srcdir}/${pkgname}"
  patch -p1 -i "${srcdir}/polling-support.patch"
}

build() {
  cd "${srcdir}/${pkgname}/src"
  export CGO_ENABLED=0
  go build -trimpath -ldflags "-s -w" -o ../signal-cli-rest-api .
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm755 signal-cli-rest-api "${pkgdir}/usr/bin/signal-cli-rest-api"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  
  install -Dm644 "${srcdir}/signal-api.service" "${pkgdir}/usr/lib/systemd/user/signal-api.service"
  install -Dm644 "${srcdir}/signal-api.env" "${pkgdir}/usr/share/doc/${pkgname}/signal-api.env.example"
}
