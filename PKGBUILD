# Maintainer: OxiRoute maintainers <https://github.com/oxiroute/oxiroute/issues>

pkgname=oxiroute-bin
pkgver=6.4.0
pkgrel=1
pkgdesc='Pingora-based HTTP, TCP, and RTMP proxy runtime (prebuilt, profile-guided release binaries)'
arch=('x86_64')
url='https://github.com/brauliobo/oxiroute'
license=('Apache-2.0')
# The release binaries link OpenSSL statically; only glibc and libgcc_s are dynamic.
depends=('ca-certificates' 'gcc-libs' 'glibc' 'systemd>=257')
optdepends=('certbot: provide certificate lineages consumed by configured Certbot sources')
provides=("oxiroute=${pkgver}")
conflicts=('oxiroute')
options=('!debug')
backup=('etc/oxiroute/oxiroute.env'
        'etc/oxiroute/oxiroute.kdl'
        'etc/oxiroute/oxiroute.lua')
install=oxiroute.install
_target='x86_64-unknown-linux-gnu'
_release="${url}/releases/download/v${pkgver}"
# The tarball checksum is the content of the release asset oxiroute-${pkgver}-${_target}.tar.gz.sha256.
source=("oxiroute-${pkgver}-${_target}.tar.gz::${_release}/oxiroute-${pkgver}-${_target}.tar.gz"
        "management-cli-${pkgver}.md::https://raw.githubusercontent.com/brauliobo/oxiroute/v${pkgver}/docs/MANAGEMENT_CLI.md"
        'oxiroute.service'
        'oxiroute.sysusers'
        'oxiroute.tmpfiles'
        'oxiroute.modules'
        'oxiroute.env'
        'oxiroute.kdl'
        'oxiroute.lua'
        'README.md')
sha256sums=('0223a13bdbafa0db0e18b872798d19efc03abe239983d30410e7e6efbea54b84'
            'ffb543ff6043239bd1ceb86395a5de51a6571438485ab3f3b027893baee5884b'
            '574eab59174656b0813499ed1c9bca8be5a6e2cf69a98e8327f376e1c0b83b1b'
            'ece087105e74910e9d4a6c3551082828378ac5c62fc15e97a755a3bc93020e72'
            '502dbc96a4f316ff7375cf90da32457b6003723a744825f04cec8a624974a356'
            'c23385c6ee614b2b91e8fcd1c535038fc2dd9a115b77db368fa2fda4d9d698a1'
            'd56db017915b82ad6204bb4de1aa268cc41586eafcbbf35194366b32ed02f19a'
            '57e5cb6cf58a38b6c5efd99e0b5a9a36bac3fafba438059a8396b07e9b6e80a9'
            'f55a08f56ff139b566afac6b0c9cbbc4ed08f69a7e04810128bfb8c98a0f0564'
            'b9a65afc6e14091ee3a25ff72c0a523f90a17e22e7695edc0a9009e5c2719456')

package() {
  cd "oxiroute-${pkgver}-${_target}"

  install -Dm755 bin/oxiroute "${pkgdir}/usr/bin/oxiroute"
  ln -s oxiroute "${pkgdir}/usr/bin/oxr"
  install -Dm755 lib/oxiroute/oxiroute-worker-launcher \
    "${pkgdir}/usr/lib/oxiroute/oxiroute-worker-launcher"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/oxiroute/LICENSE"

  install -Dm644 "${srcdir}/oxiroute.service" \
    "${pkgdir}/usr/lib/systemd/system/oxiroute.service"
  install -Dm644 "${srcdir}/oxiroute.sysusers" \
    "${pkgdir}/usr/lib/sysusers.d/oxiroute.conf"
  install -Dm644 "${srcdir}/oxiroute.tmpfiles" \
    "${pkgdir}/usr/lib/tmpfiles.d/oxiroute.conf"
  install -Dm644 "${srcdir}/oxiroute.modules" \
    "${pkgdir}/usr/lib/modules-load.d/oxiroute.conf"
  install -Dm644 "${srcdir}/oxiroute.env" \
    "${pkgdir}/etc/oxiroute/oxiroute.env"
  install -Dm644 "${srcdir}/oxiroute.kdl" \
    "${pkgdir}/etc/oxiroute/oxiroute.kdl"
  install -Dm644 "${srcdir}/oxiroute.lua" \
    "${pkgdir}/etc/oxiroute/oxiroute.lua"
  install -Dm644 "${srcdir}/README.md" \
    "${pkgdir}/usr/share/doc/oxiroute/arch-packaging.md"
  install -Dm644 "${srcdir}/management-cli-${pkgver}.md" \
    "${pkgdir}/usr/share/doc/oxiroute/management-cli.md"
}
