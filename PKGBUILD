# Maintainer: Mark Collins < tera_1225 hat hotmail dote com>
# Contributor: Frédéric Tobias Christ <dev+mautrix-signal@ntr.li> <ftchrist:matrix.org>
pkgname='mautrix-signal'
_name='signal'
pkgver=0.5.1
pkgrel=1
pkgdesc="A Matrix-Signal puppeting bridge (go rewrite)"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/mautrix/signal"
license=('AGPL-3.0-or-later')
depends=(
  'glibc'
  'gcc-libs'
  'libolm'
)
makedepends=(
  'go'
  'libsignal-ffi' # AUR
)
backup=(
  "etc/${pkgname}/config.yaml"
  "etc/${pkgname}/registration.yaml"
)
install="${pkgname}.install"
source=(
  "${url}/archive/refs/tags/v${pkgver}.tar.gz"
  "${pkgname}.service"
  "${pkgname}.sysusers"
  "${pkgname}.tmpfiles"
)
sha256sums=('646736a97421b4a3e25afa4410ef3168cba66b4964b3df0d2468d36ca409b193'
            'fcdda5af56e07faa8b0ff127ccb560ae97e60945531b7bcf696100825d824324'
            'b47c0829a9f285e0a4bd7852e601f325e1fa8385ea96eaa92cad204c0e583adf'
            '5badc8727dfbf4531f93e86ae475c64753952ee60090a043be22b9dd9a124ca5')

prepare() {
  cd "${srcdir}/${_name}-${pkgver}"
  go mod tidy
}

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  export LIBRARY_PATH="${LIBRARY_PATH}:/usr/lib/"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  MAUTRIX_VERSION=$(cat go.mod | grep 'maunium.net/go/mautrix ' | awk '{ print $2 }')
  GO_LDFLAGS="-X main.Tag=$pkgver -X 'main.BuildTime=`date '+%b %_d %Y, %H:%M:%S'`' -X 'maunium.net/go/mautrix.GoModVersion=$MAUTRIX_VERSION'"
  go build -gcflags="$GO_GCFLAGS" -ldflags="$GO_LDFLAGS" -o mautrix-signal "$@"
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"

  install -Dm755 "$pkgname" "${pkgdir}/usr/bin/$pkgname"

  install -Dvm 644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dvm 644 "${srcdir}/${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  install -Dvm 644 "${srcdir}/${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"

  install -Dvm 640 "example-config.yaml" "${pkgdir}/etc/${pkgname}/config.yaml"
  touch 'registration.yaml'
  install -Dvm 640 'registration.yaml' "${pkgdir}/etc/${pkgname}/registration.yaml"
}
