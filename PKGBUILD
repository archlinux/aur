# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: solopasha <daron439 at gmail dot com>

_pkgname="ytarchive"
pkgname="${_pkgname}-git"
pkgver=0.5.0.r0.gfb5b172
pkgrel=1
pkgdesc="Garbage Youtube livestream downloader"
arch=('x86_64')
url="https://github.com/Kethsar/${_pkgname}"
license=('MIT')
makedepends=('git' 'go')
depends=('glibc' 'ffmpeg')
provides=("${_pkgname}=${pkgver%%.r*}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}"
source=("${_pkgsrc}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgsrc}"
  git describe --long --tags --abbrev=7 --exclude="latest" | sed 's/v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  mkdir -p "build"
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -v -o "build/${_pkgname}" -ldflags "\
    -X main.Commit=-$(git rev-parse --short HEAD)" \
    .
}

# check() {
#   cd "${srcdir}/${_pkgsrc}"
#   go test ./...
# }

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -Dm755 "build/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
