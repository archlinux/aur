# Maintainer: Viktor Varenik <yavarenikya@gmail.com>

_pkgname=neru
pkgname=${_pkgname}-git
_gitname=neru
pkgver=nightly.r0.g3dfe895c
pkgrel=1
pkgdesc='Navigate your entire screen without touching the mouse.'
url="https://github.com/y3owk1n/${_pkgname}"
license=('MIT')
arch=('x86_64' 'aarch64')
makedepends=('go' 'git' 'just' 'wayland-protocols')
depends=(
  'cairo'
  'glibc'
  'libei'
  'libx11'
  'libxfixes'
  'libxinerama'
  'libxkbcommon'
  'libxrandr'
  'libxtst'
  'wayland'
)
source=("${_gitname}::git+${url}")
b2sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"
  git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' || \
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${_gitname}"
  mkdir -p build
}

build() {
  cd "${srcdir}/${_gitname}"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  export GOPATH="${srcdir}/gopath"

  just build
}

# check() {
#   cd "${srcdir}/${_gitname}"
#   just test-all || go test ./...
# }

package() {
  cd "${srcdir}/${_gitname}"

  install -Dm0755 "bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
