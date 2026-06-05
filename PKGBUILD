# Maintainer: Patrick Lorio <patrick@playit.gg>

pkgname=playit-bin
pkgver=1.0.8
pkgrel=1
pkgdesc='A tunneling tool to host a game server without port forwarding or sharing public IP (Binary version)'
arch=('x86_64' 'aarch64' 'armv7h' 'i686')
url='https://playit.gg'
license=('BSD-2-Clause')
depends=('logrotate')
provides=('playit')
conflicts=('playit')
install="${pkgname}.install"

_release_base="https://builds.playit.gg/${pkgver}"
_raw_base="https://raw.githubusercontent.com/playit-cloud/playit-agent/v${pkgver}"

source=(
  "playit::${_raw_base}/linux/playit"
  "logrotate.conf::${_raw_base}/linux/logrotate.conf"
  "playit.service::${_raw_base}/linux/playit.service"
  "playit.openrc::${_raw_base}/linux/playit.openrc"
  "LICENSE.txt::${_raw_base}/LICENSE.txt"
)
source_x86_64=(
  "playit-cli-linux-amd64::${_release_base}/playit-cli-linux-amd64"
  "playit-linux-amd64::${_release_base}/playit-linux-amd64"
)
source_aarch64=(
  "playit-cli-linux-aarch64::${_release_base}/playit-cli-linux-aarch64"
  "playit-linux-aarch64::${_release_base}/playit-linux-aarch64"
)
source_armv7h=(
  "playit-cli-linux-armv7::${_release_base}/playit-cli-linux-armv7"
  "playit-linux-armv7::${_release_base}/playit-linux-armv7"
)
source_i686=(
  "playit-cli-linux-i686::${_release_base}/playit-cli-linux-i686"
  "playit-linux-i686::${_release_base}/playit-linux-i686"
)

sha256sums=('daa9b021f23bddaa04c29532088ab3f1967591bba11ed98eb8ced4d53e67858d'
            '22fc22988fd86ecf62cba09847442cfd628a7a6d7e6dcdffd3833f1f3cb8a9d8'
            '8029085b8db14175a1a7a7f4f626bc224be969d6c68283de38a4942575ee2842'
            'fd6b309c4e1008b81675a2ad0ea27e709f02f405a502816c238a73c60b497da9'
            'f9d32c6b4a6055b2bfa48543d68119efc46ea4606f0d9cc973cb273dcd59be9c')
sha256sums_x86_64=('ac812035d416f0d10628023ac1c2dfccc1cf4610a72fde42516ca34ad7ae9755'
                   '544cc9b93384c81d0bbccc7ced5f855594412bd7cc72011d414b73f265fb7ce6')
sha256sums_aarch64=('647924241fbafaa5616cf8630153f181759fe3cd95cca2821eabe659f90e5d3e'
                    '8a1c51e72d00caec1688def8c20c1c67c714b99dff05a4147f3639d3fad61594')
sha256sums_armv7h=('4426464a96e2708f96b0414b74b63132e0edbd682989c87f203b58451c6c4d73'
                   '99a512d42280103133f13b6e5fb236ee07242f2d6d11da38e3a8cafd13593245')
sha256sums_i686=('7f8e16c51bd10157b6df6676c21dd5a43054a53583af3f94a7976fe012c72d8a'
                 'a984232367d411a9a592b9d04a81eb0a0df27994a6464f49b9393e7276b93cbd')

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

  install -Dm0755 "${srcdir}/${cli_bin}" "${pkgdir}/opt/playit/agent"
  install -Dm0755 "${srcdir}/${daemon_bin}" "${pkgdir}/opt/playit/playitd"
  install -Dm0755 "${srcdir}/playit" "${pkgdir}/opt/playit/playit"

  install -Dm0644 "${srcdir}/logrotate.conf" "${pkgdir}/etc/logrotate.d/playit"
  install -Dm0644 "${srcdir}/playit.service" "${pkgdir}/opt/playit/share/init/systemd/playit.service"
  install -Dm0755 "${srcdir}/playit.openrc" "${pkgdir}/opt/playit/share/init/openrc/playit"
  install -Dm0644 "${srcdir}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"

  install -dm0750 "${pkgdir}/etc/playit"
  install -dm0750 "${pkgdir}/var/log/playit"
  install -dm0755 "${pkgdir}/usr/local/bin"

  ln -s /opt/playit/playit "${pkgdir}/usr/local/bin/playit"
  ln -s /opt/playit/playitd "${pkgdir}/usr/local/bin/playitd"
}

