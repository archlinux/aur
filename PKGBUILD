# Maintainer: OxiRoute maintainers <https://github.com/oxiroute/oxiroute/issues>

pkgname=oxiroute
pkgver=0.4.1
pkgrel=2
pkgdesc='Pingora-based HTTP, TCP, and RTMP proxy runtime'
arch=('x86_64')
url='https://github.com/brauliobo/oxiroute'
license=('Apache-2.0')
depends=('ca-certificates' 'gcc-libs' 'glibc' 'openssl')
makedepends=('rust>=1.97')
optdepends=('certbot: provide certificate lineages consumed by configured Certbot sources')
backup=('etc/oxiroute/oxiroute.env'
        'etc/oxiroute/oxiroute.kdl'
        'etc/oxiroute/oxiroute.lua')
install=oxiroute.install
_target='x86_64-unknown-linux-gnu'
source=("oxiroute-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/oxiroute-${pkgver}.tar.gz"
        'oxiroute.service'
        'oxiroute.sysusers'
        'oxiroute.tmpfiles'
        'oxiroute.env'
        'oxiroute.kdl'
        'oxiroute.lua'
        'README.md::https://raw.githubusercontent.com/brauliobo/oxiroute/2d9c5fe66cd096d7a1d8e3bada8d5784b5f97f6c/packaging/arch/README.md')
sha256sums=('bc2b5a680a7aae181a4f5b8b9e6326043334247ab6355273d589078c5bfb0a54'
             '5d93df51ac5690a336e40f624c3b27ba3a1d4ab8a218dbaac72a05a92819ac54'
            'ece087105e74910e9d4a6c3551082828378ac5c62fc15e97a755a3bc93020e72'
             '502dbc96a4f316ff7375cf90da32457b6003723a744825f04cec8a624974a356'
             'c87c9ef586bbb68f69f5abc1c4616de35783fe5d5d2b07b0b6b4011b2b892f44'
            '57e5cb6cf58a38b6c5efd99e0b5a9a36bac3fafba438059a8396b07e9b6e80a9'
            'f55a08f56ff139b566afac6b0c9cbbc4ed08f69a7e04810128bfb8c98a0f0564'
            '64068182bca24ac7b569e766b16ee83675c5acf2f67e46c709fc31d6caf290d4')

prepare() {
  cd "oxiroute-${pkgver}"
  cargo fetch --locked --target "${_target}"
}

build() {
  cd "oxiroute-${pkgver}"
  export CARGO_NET_OFFLINE=true
  export OPENSSL_NO_VENDOR=1
  export RUSTFLAGS="${RUSTFLAGS:-} --remap-path-prefix=${srcdir}=/usr/src/debug/${pkgname}"
  cargo build --frozen --release \
    --package oxiroute \
    --package oxiroute-supervisor-process \
    --target "${_target}" \
    --jobs 4
}

package() {
  cd "oxiroute-${pkgver}"

  install -Dm755 "target/${_target}/release/oxiroute" \
    "${pkgdir}/usr/bin/oxiroute"
  ln -s oxiroute "${pkgdir}/usr/bin/oxr"
  install -d -m755 "${pkgdir}/usr/lib/oxiroute"
  install -m755 "target/${_target}/release/oxiroute-worker-launcher" \
    "${pkgdir}/usr/lib/oxiroute/oxiroute-worker-launcher"
  # Some Arch glibc crt objects overstate their ISA requirement; all compiled code targets baseline x86-64.
  objcopy --remove-section .note.gnu.property "${pkgdir}/usr/bin/oxiroute"
  objcopy --remove-section .note.gnu.property \
    "${pkgdir}/usr/lib/oxiroute/oxiroute-worker-launcher"
  install -Dm644 LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 "${srcdir}/oxiroute.service" \
    "${pkgdir}/usr/lib/systemd/system/oxiroute.service"
  install -Dm644 "${srcdir}/oxiroute.sysusers" \
    "${pkgdir}/usr/lib/sysusers.d/oxiroute.conf"
  install -Dm644 "${srcdir}/oxiroute.tmpfiles" \
    "${pkgdir}/usr/lib/tmpfiles.d/oxiroute.conf"
  install -Dm644 "${srcdir}/oxiroute.env" \
    "${pkgdir}/etc/oxiroute/oxiroute.env"
  install -Dm644 "${srcdir}/oxiroute.kdl" \
    "${pkgdir}/etc/oxiroute/oxiroute.kdl"
  install -Dm644 "${srcdir}/oxiroute.lua" \
    "${pkgdir}/etc/oxiroute/oxiroute.lua"
  install -Dm644 "${srcdir}/README.md" \
    "${pkgdir}/usr/share/doc/${pkgname}/arch-packaging.md"
  install -Dm644 docs/MANAGEMENT_CLI.md \
    "${pkgdir}/usr/share/doc/${pkgname}/management-cli.md"
}
