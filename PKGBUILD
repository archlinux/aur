# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="ytarchive"
pkgver=0.5.3
pkgrel=1
pkgdesc="Garbage Youtube livestream downloader"
arch=(
  'aarch64'
  'armv7h'
  'x86_64'
)
url="https://github.com/dreammu/${pkgname}"
license=(
  'MIT'
)
depends=(
  'ffmpeg'
  'glibc'
  'yt-dlp'
)
makedepends=(
  'git'
  'go'
)
_pkgsrc="${url##*/}"
source=(
  "${_pkgsrc}::git+${url}.git#tag=v${pkgver}"
)
b2sums=('d406374997c706431e50a79aa9e9768f357ddefb58148803759afae442dce2d6e7364836d57b308616b28b78b84254a65da06530b0dbabc4ab520f2c4460ade6')

prepare() {
  export GOMODCACHE="${srcdir}/go-mod-cache"

  cd "${srcdir}/${_pkgsrc}"
  go mod download -modcacherw -x
  # go mod verify
}

build() {
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOCACHE="${srcdir}/go-cache"
  export GOMODCACHE="${srcdir}/go-mod-cache"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  cd "${srcdir}/${_pkgsrc}"
  go build -v -o "build/${pkgname}" -ldflags "\
    -X main.Commit=-$(git rev-parse --short HEAD)" \
    .
}

# check() {
#   cd "${srcdir}/${_pkgsrc}"
#   go test ./...
# }

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -vDm755 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -vDm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -vDm644 "LICENSE"   -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
