# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="html2markdown"
pkgver=2.5.0
pkgrel=1
pkgdesc="Convert HTML to Markdown. Even works with entire websites and can be extended through rules."
arch=(
  'aarch64'
  'i686'
  'x86_64'
)
url="https://html-to-markdown.com"
_url="https://github.com/JohannesKaufmann/html-to-markdown"
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
_pkgsrc="${_url##*/}"
source=(
  "${_pkgsrc}::git+${_url}.git#tag=v${pkgver}"
)
b2sums=('d703e024b9064302ad37e5beb6cfaf062302d091b03071637356482d6e82fa236e2aa554c0d6cd6ef774a118adc0e1ea97d1514571f9fcfa5531b753ca78e698')

prepare() {
  export GOMODCACHE="${srcdir}/go-mod-cache"

  cd "${srcdir}/${_pkgsrc}"
  go mod download -modcacherw -x
  go mod verify

  mkdir -p "build"
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
  local build_commit="$(git rev-parse HEAD)"
  local build_date="$(date --utc --date="@${SOURCE_DATE_EPOCH:-$(date +%s)}" +"%Y-%m-%dT%H:%M:%SZ")"

  go build -v -o "build/${pkgname}" -ldflags "\
    -X main.version=${pkgver}-${pkgrel} \
    -X main.commit=${build_commit} \
    -X main.date=${build_date}" \
    ./"cli/${pkgname}"
}

check() {
  cd "${srcdir}/${_pkgsrc}"
  go test ./...
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -vDm755 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -vDm644 "ESCAPING.md" "${pkgdir}/usr/share/doc/${pkgname}/ESCAPING.md"
  install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE"     "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
