# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="wipemychat"
pkgver=1.2.5
pkgrel=1
pkgdesc="Delete all your messages in public and private Telegram chats"
arch=(
  'aarch64'
  'i686'
  'x86_64'
)
url="https://github.com/rusq/${pkgname}"
license=(
  'GPL-3.0-only'
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
  "${_pkgsrc}::git+${url}.git#tag=v${pkgver}?signed"
)
sha256sums=('8c9d10cd2b4d2c1a15f2b316ecf0e460563460cf4e9b58e3ea7da1e598b24c7b')
validpgpkeys=(
  '337530DD887FB454C4FC6E7F23B9DBD7FAE54FCD' # Rustam Gilyazov <16064414+rusq@users.noreply.github.com>
)

prepare() {
  export GOMODCACHE="${srcdir}/go-mod-cache"

  cd "${srcdir}/${_pkgsrc}"
  go mod download -modcacherw -x
  go mod verify
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
    -X main.version=${pkgver}-${pkgrel} \
    -X main.date=$(date --utc --date="@${SOURCE_DATE_EPOCH:-$(date +%s)}" +'%Y-%m-%dT%H:%M:%SZ') \
    -X main.commit=$(git rev-parse HEAD)" \
    .
}

check() {
  cd "${srcdir}/${_pkgsrc}"
  go test ./...
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -vDm755 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENCE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
