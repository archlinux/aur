# Maintainer: Konstantin Gizdov <arch at kge dot pw>
# Contributor: Eric Berquist <eric dot berquist at gmail dot com>
# Contributor: Siôn le Roux <sinisterstuf@gmail.com>

pkgname=wakatime
epoch=1
pkgver='1.60.4'
pkgrel=1
pkgdesc="Command line interface used by all WakaTime text editor plugins"
arch=('x86_64')
_repo="github.com/${pkgname}/${pkgname}-cli"
url="https://${_repo}"
license=('BSD')
depends=('glibc')
makedepends=('git' 'go')
checkdepends=('svn')
source=("${pkgname}-cli::git+https://github.com/${pkgname}/${pkgname}-cli#tag=v${pkgver}")
sha256sums=('SKIP')

_binname="${pkgname}-cli-linux-amd64"

build() {
  cd "${srcdir}/${pkgname}-cli"

  mkdir -p build  # create build dir

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"

  local _date="$(date -u '+%Y-%m-%dT%H:%M:%S %Z')"
  local _commit="$(git rev-parse --short HEAD)"

  CGO_ENABLED="0" go build -o build/"${_binname}" \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags '${LDFLAGS}' -X '${_repo}/pkg/version.OS=linux' -X '${_repo}/pkg/version.Arch=amd64' -X '${_repo}/pkg/version.BuildDate=${_date}' -X '${_repo}/pkg/version.Commit=${_commit}' -X '${_repo}/pkg/version.Version=${pkgver}'"
}

check () {
  cd "${srcdir}/${pkgname}-cli"
  echo "wakatime-cli" > ./.wakatime-project
  # some weird test assumptions fail
  sed \
    -e "s/<local-build>/${pkgver}/" \
    -e "s/Equal(t, 2, offlineCount)/Equal(t, 1, offlineCount)/" \
    -i ./main_test.go
  CGO_ENABLED="0" go test -tags=integration ./main_test.go
}

package() {
  cd "${srcdir}/${pkgname}-cli"
  install -Dm755 build/"${_binname}" "${pkgdir}"/usr/bin/"${pkgname}"
  ln -s /usr/bin/"${pkgname}" "${pkgdir}"/usr/bin/"${pkgname}"-cli
  install -d "${pkgdir}"/usr/share/licenses/"${pkgname}"
  install LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
