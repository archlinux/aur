# Maintainer: somini <dev@somini.xyz>

pkgname=go-hnrss
pkgver=1.1
_pkgver="v$pkgver"
pkgrel=3
pkgdesc='Hacker News RSS'
arch=('x86_64' 'aarch64')
url='https://edavis.github.io/hnrss/'
license=('unknown')
makedepends=('go' 'git')
backup=("etc/${pkgname}.conf")
# Use my fork for the extra features
source=(
  "https://gitlab.com/somini/go-hnrss/-/archive/v${pkgver}/${pkgname}-${_pkgver}.tar.gz"
  "${pkgname}.conf"
  "${pkgname}.service"
  "${pkgname}.sysusers"
)
sha512sums=('60e377ff63bb582d1ae2315c2c87bf62b013577804489ea00191d5372131acb23883eb1aa3c4addab2dd17b3ccc9f44bb694b7cfd8d10b4a751efab830390f75'
            'b8213906c34ccb0b88d8ed19948342d2fffc04992b07b6e0c2654f7a215b624552a9a9cbf5b4093ac11edce59e23faef719fc3d7d023d974d8c3180522b6580c'
            'b310f686f78109129ebc4e6ae35cd197d1e3a571514124bf2308f1efa65502628a6c2e92d3645bedc1a5fcb4501ecf3ecb79b6bdba28db7b34cac9124d668fd2'
            '4e938dda326ab2549d4f3076f72198f5d23ced3a46f1994a5c215fc5848b64a1737e9061bb75888f5acf81cede68949fc03a144a5fdf8da6e51800ebc7223d6b')

case "$CARCH" in
  x86_64) _target=amd64 ;;
  aarch64) _target=arm64 ;;
  *) return 1 ;;
esac

build() {
  cd "$pkgname-$_pkgver"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  GOARCH="$_target" go build -v -o "${pkgname}.${_target}"
}

package() {
  cd "$srcdir"
  install -Dm644 "${pkgname}.conf" "${pkgdir}/etc/${pkgname}.conf"
  install -Dm644 "${pkgname}.service" "${pkgdir}$(pkg-config systemd --variable=systemd_system_unit_dir)/${pkgname}.service"
  install -Dm644 "${pkgname}.sysusers" "${pkgdir}/$(pkg-config systemd --variable=sysusers_dir)/${pkgname}.conf"

  cd "$srcdir/$pkgname-$_pkgver"
  install -Dm755 "${pkgname}.${_target}" "${pkgdir}/usr/bin/${pkgname}"
}
