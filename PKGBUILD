# Maintainer: Hao Long <imlonghao@archlinuxcn.org>

pkgname=gatus
pkgver=5.4.0
pkgrel=1
pkgdesc="Automated service health dashboard"
arch=("x86_64")
url="https://github.com/TwiN/gatus"
license=("Apache")
backup=('etc/gatus.yaml')
depends=("glibc")
makedepends=("go")
source=('gatus.service'
        'sysusers.d'
        "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('4ec6761e07afe08137d28ba38c208e6a6717c4943cea62fb732ce83cab7fa9455ac39ab2faab83a8f6554fbdc8443d99c4d400291d90dbe778e86a2c022e3f67'
        'fa96208d814d389bf885c9f224b4c7093566fd36901016df915a09e26db6227a65af528674204a73e8bbba5aa5ea24862f0bee2930e2687fbc77166e78395dc6'
        'ca1e99272cc1e7bd81d5c6de4a137ec243f3309a9bb977a1e2963fe712157a50afe0a12422701f81747a535713b5247c97eef745273899706e0fb4129981ebbf')

build() {
  cd "${pkgname}-${pkgver}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build .
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 gatus "${pkgdir}/usr/bin/gatus"
  install -Dm644 config.yaml "${pkgdir}/etc/gatus.yaml"
  install -Dm644 "${srcdir}/gatus.service" "${pkgdir}/usr/lib/systemd/system/gatus.service"
  install -Dm644 "${srcdir}/sysusers.d" "${pkgdir}/usr/lib/sysusers.d/gatus.conf"
}
