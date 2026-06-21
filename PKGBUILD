# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="cadvisor"
pkgver=0.60.0
pkgrel=1
pkgdesc="Analyzes resource usage and performance characteristics of running containers"
arch=(
  'aarch64'
  'x86_64'
)
url="https://github.com/google/${pkgname}"
license=(
  'Apache-2.0'
)
depends=(
  'glibc'
)
makedepends=(
  'git'
  'go'
)
backup=(
  "etc/conf.d/${pkgname}"
)
_pkgsrc="${url##*/}"
source=(
  "${_pkgsrc}::git+${url}.git#tag=v${pkgver}"
  "${pkgname}.conf"
  "${pkgname}.service"
)
sha256sums=('a5531e6857c6f9832c6a5ace1ba58507689467ea3e9312114623a10d85e8ba5c'
            '785c5ad59f9cf5215afaba911a622dd09cc61749d17d8e46b449ccdece2a9787'
            'e6d6e399d0909a7aeb86b4beab52b8895760b740cf26d55f8b87003cb06b5f9b')

prepare() {
  export GOMODCACHE="${srcdir}/go-mod-cache"

  cd "${srcdir}/${_pkgsrc}/cmd"
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

  cd "${srcdir}/${_pkgsrc}/cmd"
  go build -v -o "build/${pkgname}" -ldflags "\
    -X ${url#https://}/version.Version=v${pkgver} \
    -X ${url#https://}/version.Revision=$(git rev-parse --short HEAD) \
    -X ${url#https://}/version.Branch=master \
    -X ${url#https://}/version.BuildUser=makepkg \
    -X ${url#https://}/version.BuildDate=$(date --utc --date="@${SOURCE_DATE_EPOCH:-$(date +%s)}" '+%Y%m%d-%H:%M:%S') \
    -X ${url#https://}/version.GoVersion=$(go version | sed -e 's/^[^0-9.]*\([0-9.]*\).*/\1/')" \
    .
}

check() {
  cd "${srcdir}/${_pkgsrc}/cmd"
  go test ./...
}

package() {
  cd "${srcdir}"
  install -vDm644 "${pkgname}.conf" "${pkgdir}/etc/conf.d/${pkgname}"
  install -vDm644 "${pkgname}.service" -t "${pkgdir}/usr/lib/systemd/system"

  cd "${_pkgsrc}"
  install -vDm755 "cmd/build/${pkgname}" -t "${pkgdir}/usr/bin"
  install -vDm644 "CHANGELOG.md" "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -vDm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
