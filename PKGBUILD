# Maintainer: Rufus Deponian <rufus at deponian dot com>
pkgname=logalize
pkgver=0.7.0
pkgrel=1
pkgdesc="Fast and extensible log colorizer. Alternative to ccze."
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64' 'riscv64')
url="https://github.com/deponian/logalize"
license=('MIT')
depends=('glibc')
makedepends=('go>=1.22')
backup=('etc/logalize/logalize.yaml')
source=("git+https://github.com/deponian/logalize.git#tag=v${pkgver}")
sha256sums=('fa179ee7c9bd698b80469e7915fd0a2910bfc9ddcf5fd4d68abd35a4e2184c59')

build() {
  cd "${pkgname}"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  export EXTRA_LDFLAGS="-linkmode=external"

  make VERSION="${pkgver}" build
}

package() {
  cd "${pkgname}"

  make VERSION="${pkgver}" DESTDIR="${pkgdir}" PREFIX="/usr" install

  install -Dm644 ".logalize.yaml" "${pkgdir}/etc/${pkgname}/logalize.yaml"

  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "readme.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "CHANGELOG.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
}
