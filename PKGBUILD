# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="wipemychat"
pkgname="${_pkgname}-git"
pkgver=1.2.3.r0.g597103d
pkgrel=1
pkgdesc="Delete all your messages in public and private Telegram chats"
arch=(
  'aarch64'
  'i686'
  'x86_64'
)
url="https://github.com/rusq/${_pkgname}"
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
provides=(
  "${_pkgname}=${pkgver%%.r0.g*}"
)
conflicts=(
  "${_pkgname}"
)
_pkgsrc="${url##*/}"
source=(
  "${_pkgsrc}::git+${url}.git"
)
sha256sums=('SKIP')

prepare() {
  export GOMODCACHE="${srcdir}/go-mod-cache"

  cd "${srcdir}/${_pkgsrc}"
  go mod download -modcacherw -x

  mkdir -p "build"
}

pkgver() {
  cd "${srcdir}/${_pkgsrc}"
  git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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
  go build -v -o "build/${_pkgname}" -ldflags "\
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
  install -vDm755 "build/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENCE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
