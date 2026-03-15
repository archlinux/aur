# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="repo-security-scanner"
pkgver=0.4.1
pkgrel=1
pkgdesc="CLI tool that finds secrets accidentally committed to a git repo, eg passwords, private keys"
arch=(
  'aarch64'
  'i686'
  'x86_64'
)
url="https://github.com/techjacker/${pkgname}"
license=(
  'MIT'
)
depends=(
  'glibc'
)
makedepends=(
  'git'
  'go'
)
_pkgsrc="${url##*/}"
source=(
  "${_pkgsrc}::git+${url}.git#tag=${pkgver}"
)
sha256sums=('91f40a43ea1361c255a9d0de861ff911f2281b9acf9293eb1203f1818cab5e49')

prepare() {
  export GOMODCACHE="${srcdir}/go-mod-cache"

  cd "${srcdir}/${_pkgsrc}"
  go mod download -modcacherw -x
  go mod verify

  # find . -type f -exec \
  #   sed -e 's/UKHomeOffice-attic/techjacker/g' \
  #       -i "{}" +
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
  go build -v -o "build/${pkgname}" ./"cmd/scanrepo"
}

# check() {
#   cd "${srcdir}/${_pkgsrc}"
#   go test ./...
# }

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -vDm755 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
