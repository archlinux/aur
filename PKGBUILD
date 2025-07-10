# Maintainer: taotieren <admin@taotieren.com>

pkgname=linglong-tools
pkgver=2.2.1
pkgrel=1
pkgdesc='A command line helper for linglong.'
arch=($CARCH)
url='https://github.com/myml/linglong-tools'
license=('MIT')
provides=(
  ${pkgname}
)
conflicts=(
  ${pkgname}
)
replaces=()
depends=(
  sh
  glibc
)
makedepends=(
  git
  go
  pkgconf
)
# checkdepends=(
#   apt
# )
optdepends=("linyaps: Linglong is the container application toolkit ofdeepin.")
backup=(etc/${pkgname}.conf)
source=(
  "${pkgname}::git+${url}.git#tag=v${pkgver}"
  "${pkgname}.conf"
  "${pkgname}.sh"
)
sha256sums=('ba4a9a0b96e8d27668a08b51fae09b8635c37b736d9c125cbb11a4e92c58afa5'
            'ca5310a6046c27fde5d5ef3751bcfd62b13c6ac0fcce929fc852dd0533aa8786'
            'a8c629db431fad5da26cca63fb511d965f153a409b541520352eac8f283dc6de')

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
}

build() {
  cd "${srcdir}"/${pkgname}/
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  export GO111MODULE=on
  export GOPROXY=https://goproxy.cn,direct

  mkdir -pv build/
  go build -o build
}

# check() {
#   cd "${srcdir}"/${pkgname}/
#   make test
# }

package() {
  cd "${srcdir}"/${pkgname}
  install -Dm755 build/${pkgname} -t "${pkgdir}/usr/bin/"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}/"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dm644 "${srcdir}/${pkgname}.conf" -t "${pkgdir}/etc/"
  install -Dm755 "${srcdir}/${pkgname}.sh" -t "${pkgdir}/etc/profile.d/"
}
