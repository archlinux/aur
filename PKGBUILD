# Maintainer: Patrick Lorio <patrick@playit.gg>
# Contributor: Gilwiljam <gillbilljam@gmail.com>
# Contributor: Samuel Corsi-House <chouse.samuel@gmail.com>

pkgname=playit-bin
pkgver=2.0.1
pkgrel=1
pkgdesc='Tool to make your locally running game server public (Binary Version)'
arch=('x86_64' 'aarch64' 'armv7h' 'i686')
url='https://playit.gg'
license=('BSD-2-Clause')
depends=('logrotate')
provides=("playit=${pkgver}")
conflicts=('playit' 'playit-debug')
install="${pkgname}.install"

_repo='playit-cloud/playit-agent'
_release_base="https://builds.playit.gg/${pkgver}"
_raw_base="https://raw.githubusercontent.com/${_repo}/v${pkgver}"

source=(
  "playit::${_raw_base}/linux/playit"
  "logrotate.conf::${_raw_base}/linux/logrotate.conf"
  "playit.service::${_raw_base}/linux/playit.service"
  "playit.openrc::${_raw_base}/linux/playit.openrc"
  "playit.sysusers::${_raw_base}/linux/playit.sysusers"
  "LICENSE.txt::${_raw_base}/LICENSE.txt"
)
source_x86_64=(
  "playit-cli-linux-amd64-${pkgver}::${_release_base}/playit-cli-linux-amd64"
  "playit-linux-amd64-${pkgver}::${_release_base}/playit-linux-amd64"
)
source_aarch64=(
  "playit-cli-linux-aarch64-${pkgver}::${_release_base}/playit-cli-linux-aarch64"
  "playit-linux-aarch64-${pkgver}::${_release_base}/playit-linux-aarch64"
)
source_armv7h=(
  "playit-cli-linux-armv7-${pkgver}::${_release_base}/playit-cli-linux-armv7"
  "playit-linux-armv7-${pkgver}::${_release_base}/playit-linux-armv7"
)
source_i686=(
  "playit-cli-linux-i686-${pkgver}::${_release_base}/playit-cli-linux-i686"
  "playit-linux-i686-${pkgver}::${_release_base}/playit-linux-i686"
)

sha256sums=('daa9b021f23bddaa04c29532088ab3f1967591bba11ed98eb8ced4d53e67858d'
            '0e22e81c51c31325dd2acff4ec7399ceede0e83384547457ef64ec52fa72cdd1'
            '2a3c0dd7bd405d1e50be123534c87224e9da66aecbfe8a2ef596600a8624f773'
            'eff35e0735583ab5c1043fc62823d25d217981510fe4e6cb91c99d13e583bfad'
            'a07e7ae69701e99224bfcd8a464b028c7e7eef241017900701b70ac903e42d39'
            'f9d32c6b4a6055b2bfa48543d68119efc46ea4606f0d9cc973cb273dcd59be9c')
sha256sums_x86_64=('2b705984ef2ddd870613cc0aa09ec5f6d81a7bfabe295942e34f2f35a59ce229'
                   '4371752899125a6780c3ba134876e9ecdbea5f871490efdc62f62e8e5e822b2d')
sha256sums_aarch64=('7ed5bb97aaa51cbc86596a2a55e836f7fa0dd1bfdc6a164f9bd2b6decd9ce223'
                    '0b19a86605bcf5f8c5ddb2e74add74927f6f25174bf983deb9ba25abe97b103f')
sha256sums_armv7h=('833fc2a2d0718ab925f1b3ef1d2eb88d92a5d8e32096d059584e5d21050c71c6'
                   '2d60aee3eb24c3eadb73a46c08f815cfb3946ef7d9b7e3d8cb3d2129dd261555')
sha256sums_i686=('41cff2221a958bc71547a408680fdaa204941e54150f2c4d8657d9d4ff03cc45'
                 'f9ae81ac96ced8617ef6412d1cd59bbc89873639b14b54860ddfad7a2f436d8f')

package() {
  local cli_bin
  local daemon_bin

  case "${CARCH}" in
    x86_64)
      cli_bin='playit-cli-linux-amd64'
      daemon_bin='playit-linux-amd64'
      ;;
    aarch64)
      cli_bin='playit-cli-linux-aarch64'
      daemon_bin='playit-linux-aarch64'
      ;;
    armv7h)
      cli_bin='playit-cli-linux-armv7'
      daemon_bin='playit-linux-armv7'
      ;;
    i686)
      cli_bin='playit-cli-linux-i686'
      daemon_bin='playit-linux-i686'
      ;;
    *)
      printf 'Unsupported architecture: %s\n' "${CARCH}" >&2
      return 1
      ;;
  esac

  install -Dm0755 "${srcdir}/${cli_bin}-${pkgver}" "${pkgdir}/opt/playit/agent"
  install -Dm0755 "${srcdir}/${daemon_bin}-${pkgver}" "${pkgdir}/opt/playit/playitd"
  install -Dm0755 "${srcdir}/playit" "${pkgdir}/opt/playit/playit"

  install -Dm0644 "${srcdir}/logrotate.conf" "${pkgdir}/etc/logrotate.d/playit"
  install -Dm0644 "${srcdir}/playit.service" "${pkgdir}/usr/lib/systemd/system/playit.service"
  install -Dm0644 "${srcdir}/playit.service" "${pkgdir}/opt/playit/share/init/systemd/playit.service"
  install -Dm0755 "${srcdir}/playit.openrc" "${pkgdir}/opt/playit/share/init/openrc/playit"
  install -Dm0644 "${srcdir}/playit.sysusers" "${pkgdir}/usr/lib/sysusers.d/playit.conf"
  install -Dm0644 "${srcdir}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"

  install -dm0750 "${pkgdir}/etc/playit"
  install -dm0755 "${pkgdir}/usr/bin"

  ln -s /opt/playit/playit "${pkgdir}/usr/bin/playit"
  ln -s /opt/playit/playitd "${pkgdir}/usr/bin/playitd"
}
