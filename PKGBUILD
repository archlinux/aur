# Maintainer: Rufus Deponian <rufus at deponian dot com>
pkgname=logalize
pkgver=0.9.0
pkgrel=1
pkgdesc="Fast and extensible log colorizer. Alternative to ccze."
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64' 'riscv64')
url="https://github.com/deponian/logalize"
license=('MIT')
depends=('glibc')
makedepends=('go>=1.22')
backup=('etc/logalize/logalize.yaml')
source=("git+https://github.com/deponian/logalize.git#tag=v${pkgver}")
sha256sums=('94cb65151f49b32d129cfac5c452406c3a8b85dd94ce7894a1a2b33e7834be23')

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
