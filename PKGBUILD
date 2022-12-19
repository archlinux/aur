# Maintainer:  <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor alecromski

pkgname=ssb
pkgver=0.1.1
pkgrel=2
pkgdesc="Secure Shell Bruteforcer — A faster & simpler way to bruteforce SSH server."
arch=('any')
url="https://github.com/kitabisa/ssb"
license=('Apache2.0')
makedepends=('go')
source=("https://github.com/pwnesia/ssb/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('afb78be47c305b5d46fe879ce1ad940653f3c00b6d6e4c8244ea0103ecbbcd35')

build() {
	cd ${pkgname}-${pkgver}
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  BUILD_DATE=$(date '+%Y-%m-%d %H:%M:%S')
  go build -o build/${pkgname} -ldflags="-X 'main.buildVersion=${pkgver}' -X 'main.buildDate=${BUILD_DATE}'" .
}

package() {
	cd ${pkgname}-${pkgver}
  install -Dm755 build/ssb ${pkgdir}/usr/bin/ssb
  install -Dm644 README.md "${pkgdir}"/usr/share/doc/"${pkgname}"/README.md
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

