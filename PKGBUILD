pkgname=dagu
pkgver=2.26.0
pkgrel=1
pkgdesc='Compact, portable, and language-agnostic workflow engine'
arch=('x86_64' 'aarch64')
url='https://github.com/dagucloud/dagu'
license=('GPL-3.0-or-later')
depends=('glibc')
makedepends=(
  'go'
  'pnpm'
)
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/dagucloud/dagu/archive/refs/tags/v${pkgver}.tar.gz"
  'dagu.service'
  'dagu-user.service'
  'dagu.sysusers'
  'dagu.tmpfiles'
)
b2sums=('77e48c34c3ed19a0c105f2739e425186e2a65f28d8187384144af4fc9bfb81b14d162156b96537869bf9f6e95494e305dbe183d72d2e56ea790bb3f403d7c1ec'
        'bafb8bc533542984b5a55068458c1a20b20526bd0534d824ad8a06d32825c5620a8c87a2777e56ecab89393ff042553f70c398733f19b8b8f93ef9b3469d02fc'
        '4c5d396b268b39131190f196f2037167720deddead5d70f78de2d85f8f00998bcc1524cd84ead6c51e8744a67e96622dad33544116416ae3d6518e5ab32295fa'
        'e61032630cac02510989becc488a684fd9fe4c3a5533a24965df721a0f01faac191951456ee0155420867acd313ef465ffb69b9ded9e17d454e0ed28ff949a09'
        '74d6d99fba58a239137b3d2e838228c397d41cc8d3b1ea53100eb0dc2b568245cd34151c823e4e3e521e1e34908b3ae3c807a19676bf16eb466ee15757d2a5dc')

prepare() {
  sed -i "s|@import 'tailwindcss';|@import 'tailwindcss' source('..');|" "${pkgname}-${pkgver}/ui/src/styles/global.css"
}

build() {
  pushd "${pkgname}-${pkgver}/ui"
  pnpm install --frozen-lockfile
  pnpm build
  rm -f ../internal/service/frontend/assets/*
  cp dist/* ../internal/service/frontend/assets/

  popd
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build -ldflags="-linkmode=external -X main.version=${pkgver}" -o "${pkgname}" ./cmd
}

package() {
  install -Dm 644 dagu.service "${pkgdir}/usr/lib/systemd/system/dagu.service"
  install -Dm 644 dagu-user.service "${pkgdir}/usr/lib/systemd/user/dagu.service"
  install -Dm 644 dagu.sysusers "${pkgdir}/usr/lib/sysusers.d/dagu.conf"
  install -Dm 644 dagu.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/dagu.conf"

  pushd "${pkgname}-${pkgver}"
  install -Dm 755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

# vim: ts=2 sw=2 et:
