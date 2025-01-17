# Maintainer: Mark Collins < tera_1225 ꜹt hotmail Ƌot com>
# Contributor: Frédéric Tobias Christ <dev+mautrix-signal@ntr.li> <ftchrist:matrix.org>
pkgname='mautrix-signal'
_name='signal'
pkgver=0.7.5
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
  'libsignal-ffi=0.64.1' # AUR
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
sha256sums=('8336c50f75ab1ed39127aaeca879c3e2cdb4dcea629020a4127ccf034b763464'
            'e9a6a88f7b08fa00b354c3d50ded995f5578e6a6b75b96988cc2b27432575ded'
            'b47c0829a9f285e0a4bd7852e601f325e1fa8385ea96eaa92cad204c0e583adf'
            '6bd18a77b692c79ca62d40fb430d780fb5f01c16c9ec4a19e139a733b7cc7a1f')

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
  go build -gcflags="$GO_GCFLAGS" -ldflags="$GO_LDFLAGS" -o "$pkgname" ./cmd/...
  ./mautrix-signal --generate-example-config
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"

  install -Dvm755 "$pkgname" "${pkgdir}/usr/bin/$pkgname"

  install -Dvm 644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dvm 644 "${srcdir}/${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  install -Dvm 644 "${srcdir}/${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"

  install -dm 750 "${pkgdir}/etc/$pkgname"
  install -Dvm 640 "config.yaml" "${pkgdir}/etc/${pkgname}/config.yaml"
  touch 'registration.yaml'
  install -Dvm 640 'registration.yaml' "${pkgdir}/etc/${pkgname}/registration.yaml"
}
