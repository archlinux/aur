# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=wireguard-ui
pkgver=0.5.2
pkgrel=4
pkgdesc="A web user interface to manage your WireGuard setup."
arch=(i686 x86_64 armv7h aarch64)
url="https://github.com/ngoduykhanh/${pkgname}"
license=(MIT)
makedepends=(yarn npm go)
depends=(wireguard-tools bash glibc)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz
        001.patch::${url}/commit/7488f283c462d7dcc26dcd9dd6cb0bc9b1610e4a.patch # 404 issue
        002.patch::${url}/commit/364a43e3dcc5a9598827a166036346be8ce08094.patch # 401 issue
        003.patch::${url}/commit/b55543f424b4ebffe0080446816fff7b5aa191d1.patch # 417 issue
        ${pkgname}.service
        99-wg.conf
        wgiptables.sh
        wg-reload.path
        wg-reload.service)
sha256sums=('50a9491b5d83331b306f8cf8b6a3856f27fa00c0040ddb84ea1f6a23436bca1c'
            '91ee0f25e3544065e9df106bcd7eacb9ad9ee05a0944d5a91c595098b7372a34'
            '26ca58278f0dd9ba45793aaa20d259bf927dbb3157d1515c01eb2f0796414a00'
            '0991fc935ce8d7596585e8bbf1bd2d25e2a6b70c76b2b1fa192044776d6aad35'
            'c60cbe2d47c616a2f9984c6c57ef60e810c7e57ca5054a318b3da8770bf03b76'
            'cf5bdce2ce87b5054042a70d8630f40a0f991c64c42786824f660245b943d2be'
            '87983b041d8beb7303bb57dd7f724163a157390cdf3cd74900aff6904e9402e0'
            '4b63dee5d287bb16a8e1a588ba24ccaeb91a4e0d2993bfeb9a1fb423bf08432d'
            '44d74ce9057193a34e2c6afc4996188bc9b26594cdb691f96076d1986b615e4f')
conflicts=(${pkgname}-bin)
install=${pkgname}.install

prepare() {
  cd ${pkgname}-${pkgver}
  # apply patch from the source array
  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src = *.patch ]] || continue
    echo "Applying patch $src..."
    patch -Np1 < "../$src"
  done
  export NPM_CONFIG_USERCONFIG=${srcdir}/.npmrc
  export NPM_CONFIG_CACHE=${srcdir}/npm_cache
  export YARN_CACHE_FOLDER=${srcdir}/yarn_cache
  ./prepare_assets.sh
}

build() {
  cd ${pkgname}-${pkgver}
  export GOPATH=${srcdir}
  export CGO_CPPFLAGS=${CPPFLAGS}
  export CGO_CFLAGS=${CFLAGS}
  export CGO_CXXFLAGS=${CXXFLAGS}
  export CGO_LDFLAGS=${LDFLAGS}
  export CGO_ENABLED=1
  export GOCACHE=${srcdir}/go-build
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o ${pkgname}
}

package() {
  install -Dm644 ${pkgname}-${pkgver}/LICENSE       -t ${pkgdir}/usr/share/licenses/${pkgname}/
  install -Dm755 ${pkgname}-${pkgver}/${pkgname}    -t ${pkgdir}/opt/${pkgname}/
  install -Dm644 ${srcdir}/${pkgname}.service       -t ${pkgdir}/usr/lib/systemd/system/
  install -Dm644 ${srcdir}/wg-reload.{path,service} -t ${pkgdir}/usr/lib/systemd/system/
  install -Dm644 ${srcdir}/99-wg.conf               -t ${pkgdir}/etc/sysctl.d/
  install -Dm755 ${srcdir}/wgiptables.sh               ${pkgdir}/opt/${pkgname}/wgiptables
}
