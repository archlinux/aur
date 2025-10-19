# Maintainer: William Varmus <0@willvar.tw>

pkgname=ossutil
pkgver=1.7.19
pkgrel=1
pkgdesc='A user-friendly command-line tool to access AliCloud OSS'
arch=('x86_64')
url="https://github.com/aliyun/ossutil"
license=('MIT')
makedepends=('go')
conflicts=('ossutil-bin')
provides=('ossutil')
source=(
  "${pkgname}-LICENSE::https://raw.githubusercontent.com/aliyun/${pkgname}/master/LICENSE"
  "${pkgname}-${pkgver}.tar.gz::https://github.com/aliyun/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
  )
sha256sums=(
  '5dee8031676245920361e38dde7cc4d91f2b063f1c5a2b2a66cab1c008845b0b'
  '25fb364cb1d1eb254a2629359c5e0c94a68e352846caeed0b45c971ac9a17dd5'
  )

prepare(){
  mkdir -p "${srcdir}/build"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  env CGO_CPPFLAGS="${CPPFLAGS}" CGO_CFLAGS="${CFLAGS}" CGO_CXXFLAGS="${CXXFLAGS}" CGO_LDFLAGS="${LDFLAGS}" CGO_ENABLED=0 GOOS=linux GOARCH=amd64 GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw" go build -o ${srcdir}/build/${pkgname}
}

package() {
  install -Dm755 "${srcdir}/build/${pkgname}" "${pkgdir}/usr/bin/ossutil" \
  && install -Dm644 "${pkgname}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
