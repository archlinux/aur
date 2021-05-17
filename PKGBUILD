# Maintainer: robertfoster

pkgname=openbazaard
pkgver=0.14.6
pkgrel=2
pkgdesc="Server daemon for communication between client and OpenBazaar network"
arch=('i686' 'x86_64')
url="https://github.com/OpenBazaar/openbazaar-go"
license=('MIT')
makedepends=(go)
_org=github.com/OpenBazaar
_repo=openbazaar-go
source=("https://github.com/OpenBazaar/openbazaar-go/archive/v${pkgver}.tar.gz"
  "$pkgname.service"
  "$pkgname.conf"
  "$pkgname.sysuser.conf"
)

prepare() {
  cd "${srcdir}"
  mkdir -p "src/${_org}"
  if [ ! -e "src/${_org}/${_repo}" ]; then
    ln -sf "${srcdir}/${_repo}-${pkgver}" "src/${_org}/${_repo}"
  fi
}

build() {
  cd "${srcdir}/src/${_org}/${_repo}"
  export GOPATH="$srcdir"
  export GO111MODULE=auto
  export GOFLAGS="-buildmode=pie -trimpath -modcacherw"
  go get -v
  go build -ldflags="-s -w"
}

package() {
  install -Dm755 "${srcdir}/bin/${_repo}" \
    "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}.service" \
    "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dm644 "${srcdir}/${pkgname}.conf" \
    "${pkgdir}/etc/conf.d/${pkgname}"
  install -Dm755 "${srcdir}/${pkgname}.sysuser.conf" \
    "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
}

sha256sums=('cb986f7e2f7d8c01f0f09385285cf08dde940d7dbbfb05acafb0c87106700633'
  'eaf7cdce16b0930a53f56208de54cd25a27c830ca2936ac75e51fbdcd2b3956a'
  '8efe5e6b0bdc98b3d4813320a38f862607d716adecc28866e4d0cf2a24463b96'
  '8187df684f82063aa90c5b31cbedcc6da870cb6b2e45d95c98c78e05aec6406b')
