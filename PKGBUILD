# Maintainer: taotieren <admin@taotieren.com>

pkgname=linglong-tools-git
pkgver=2.2.1.r6.ge8650d5
pkgrel=1
pkgdesc='A command line helper for linglong.'
arch=($CARCH)
url='https://github.com/myml/linglong-tools'
license=('MIT')
provides=(
  ${pkgname%-git}
)
conflicts=(
  ${pkgname%-git}
)
replaces=()
depends=(
  sh
  glibc
  linyaps
)
makedepends=(
  git
  go
  pkgconf
)
# checkdepends=(
#   apt
# )
optdepends=()
backup=(etc/${pkgname%-git}.conf)
source=(
  "${pkgname}::git+${url}.git"
  "${pkgname%-git}.conf"
  "${pkgname%-git}.sh"
)
sha256sums=('SKIP'
            'ca5310a6046c27fde5d5ef3751bcfd62b13c6ac0fcce929fc852dd0533aa8786'
            'a8c629db431fad5da26cca63fb511d965f153a409b541520352eac8f283dc6de')

pkgver() {
  cd "${srcdir}/${pkgname}"
  (
    set -o pipefail
    git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

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
  install -Dm755 build/${pkgname%-git} -t "${pkgdir}/usr/bin/"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}/"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dm644 "${srcdir}/${pkgname%-git}.conf" -t "${pkgdir}/etc/"
  install -Dm755 "${srcdir}/${pkgname%-git}.sh" -t "${pkgdir}/etc/profile.d/"
}
