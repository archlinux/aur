# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=wireguard-ui
pkgver=0.6.0
pkgrel=1
pkgdesc="A web user interface to manage your WireGuard setup."
arch=(i686 x86_64 armv7h aarch64)
url="https://github.com/ngoduykhanh/${pkgname}"
license=(MIT)
makedepends=(yarn npm go)
depends=(wireguard-tools bash glibc)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz
        ${pkgname}.service
        99-wg.conf
        wgiptables.sh
        wgui.path
        wgui.service)
sha256sums=('cec2ea55f0ab0a9469821b6516f28123c67dbb616ea62ab92b331efc089183cc'
            '99df93fd8e6916ddad872e9a1bee496de5173bc544dc2c09f5c2a688b8deac76'
            'cf5bdce2ce87b5054042a70d8630f40a0f991c64c42786824f660245b943d2be'
            '87983b041d8beb7303bb57dd7f724163a157390cdf3cd74900aff6904e9402e0'
            '4b63dee5d287bb16a8e1a588ba24ccaeb91a4e0d2993bfeb9a1fb423bf08432d'
            'fe98a7f947bc26d67a7714186e79343917e40e05546e23ee9acf1d04484c6809')
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
  install -Dm644 ${pkgname}-${pkgver}/LICENSE    -t ${pkgdir}/usr/share/licenses/${pkgname}/
  install -Dm755 ${pkgname}-${pkgver}/${pkgname} -t ${pkgdir}/usr/bin/
  install -Dm755 ${srcdir}/wgiptables.sh            ${pkgdir}/usr/bin/wgiptables
  install -Dm644 ${srcdir}/${pkgname}.service    -t ${pkgdir}/usr/lib/systemd/system/
  install -Dm644 ${srcdir}/wgui.{path,service}   -t ${pkgdir}/usr/lib/systemd/system/
  install -Dm644 ${srcdir}/99-wg.conf            -t ${pkgdir}/etc/sysctl.d/
}
