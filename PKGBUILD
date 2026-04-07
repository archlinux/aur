pkgname=bili-danmaku-tui
pkgver=0.1.5
pkgrel=1
pkgdesc='Terminal UI client for displaying Bilibili live chat messages in real time'
arch=('x86_64' 'aarch64')
url='https://github.com/Youthdreamer/bili-danmaku-tui'
license=('MIT')
options=('!debug')
makedepends=('git' 'go')
source=("${pkgname}-${pkgver}::git+${url}.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  local _build_time
  _build_time="$(date -u -d "@${SOURCE_DATE_EPOCH:-$(date +%s)}" +%Y-%m-%dT%H:%M:%SZ)"

  export CGO_ENABLED=0
  export GOCACHE="${srcdir}/go-build"
  export GOMODCACHE="${srcdir}/go-mod"
  export GOFLAGS="${GOFLAGS} -buildmode=pie -trimpath -mod=readonly -modcacherw"

  make build \
    GOOS=linux \
    DATE="${_build_time}"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
