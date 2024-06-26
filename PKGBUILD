# Maintainer: vitaliikuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Jni <jni.viens at protonmail dot com>

pkgname="envman"
pkgver=2.4.3
pkgrel=1
pkgdesc="Manage Environment Variable collections"
arch=('any')
url="https://github.com/bitrise-io/${pkgname}"
license=('MIT')
depends=('glibc')
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('842e54bebfcfc64b01888915365f67d8a3202653048d25d1b52fdb71d168c3cf')

build() {
  cd "${srcdir}/${_pkgsrc}"
  [ -d "build" ] || mkdir "build"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o "build/${pkgname}" .
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -Dm755 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
