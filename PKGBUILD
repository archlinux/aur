# Maintainer: Danny Grove <aur@dannygrove.com>
pkgname=zarf
pkgver=0.71.1
pkgrel=1
pkgdesc="Airgap CLI tool for Kubernetes"
url="https://github.com/zarf-dev/zarf"
license=('Apache-2.0')
provides=("${pkgname%}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=()
optdepends=()
arch=(
  "x86_64"
  "aarch64"
)
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a82225b8da1141104193d86bc4e80eb84e04d846c05994b40296a5f9636a6a0c')

build() {
  cd "${pkgname}-${pkgver}"
  export CGO_ENABLED=0
  export CGO_LDFLAGS="$LDFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export GOFLAGS="-trimpath -modcacherw"
  go build -ldflags="-X github.com/zarf-dev/zarf/src/config.CLIVersion=${pkgver}" -o zarf .
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -D -m 0644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
  install -D -m 0755 -t "${pkgdir}/usr/bin/" "${pkgname}"
	mkdir -p completions
	"${pkgdir}/usr/bin/${pkgname}" completion zsh > "completions/_${pkgname}"
	install -D -m 0644 "completions/_${pkgname}" "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
}
