# Maintainer: Justin Kromlinger <hashworks@archlinux.org>

pkgname='imaginary-git'
_pkgname="${pkgname%-git}"
pkgver=1.2.4.r23.gb632dae
pkgrel=1
pkgdesc="Fast, simple, scalable HTTP microservice for high-level image processing"
url='https://github.com/h2non/imaginary'
arch=('x86_64')
license=('MIT')
depends=('glibc' 'libvips' 'lcms2' 'openjpeg2' 'poppler-glib' 'openslide' 'libjxl')
makedepends=('go' 'git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=(
  "${_pkgname}::git+${url}.git"
  "imaginary.service")
sha512sums=('SKIP'
            'a561c34735bed4eca5bcd20e99e8294d7eaef85a0293ce742981eb4152b3caf7c26a1b07d6680028f82585437d2c35bfae52d4e6a161591864d0ccff78d65c39')

pkgver() {
  cd ${_pkgname}
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd ${_pkgname}
  go mod vendor
}

build() {
  cd ${_pkgname}
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build -v -o ${_pkgname} \
    -ldflags "-linkmode=external -X main.Version=${pkgver}" \
    .
}

package() {
  install -Dm644 imaginary.service "${pkgdir}/usr/lib/systemd/system/imaginary.service"
  cd ${_pkgname}
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 ${_pkgname} -t "${pkgdir}"/usr/bin/
}

# vim: ts=2 sw=2 et:
