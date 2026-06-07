# Maintainer: Patrick Lorio <patrick@playit.gg>
# Contributor: Gilwiljam <gillbilljam@gmail.com>
# Contributor: Samuel Corsi-House <chouse.samuel@gmail.com>

pkgname=playit-bin
pkgver=1.0.9
pkgrel=1
pkgdesc='Making it easy to play games with friends. Makes your server public'
arch=('x86_64' 'aarch64' 'armv7h' 'i686')
url='https://playit.gg'
license=('BSD-2-Clause')
depends=('logrotate' 'systemd')
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
  "playit.sysusers::${_raw_base}/linux/playit.sysusers"
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
            '0e22e81c51c31325dd2acff4ec7399ceede0e83384547457ef64ec52fa72cdd1'
            '066b84e12162c344eb602cc4550447bf7ee05c8b6d2975ea94e356fc9977050d'
            'a07e7ae69701e99224bfcd8a464b028c7e7eef241017900701b70ac903e42d39'
            'f9d32c6b4a6055b2bfa48543d68119efc46ea4606f0d9cc973cb273dcd59be9c')
sha256sums_x86_64=('4d1e9584c7c771f0f4727fca435376c2c07b1bf84149eba2ac00bd8c3100ba25'
                   '01f8790c239ba44e89ac5c569a3dfb653e9ac3242d00d8ada8ae6fd610a380b5')
sha256sums_aarch64=('df196e0d6f8cd0c39d4954c298306d86b0090aca6575a03c6d2566aa04fbed98'
                    '83d11379f1f7ad7e0d3c373eb3c8c7813aaf6bf0dbad47d00e477b4d91c882cd')
sha256sums_armv7h=('6ad02a6de002d103399bbd54b73aef6cc2d09c153da6aeb7b9457a052d3391ee'
                   '0c69d4f86f28e2e7202da06242730f23ff4586fd992d3bbf873fc6388db02b5b')
sha256sums_i686=('adf808ba74581752104bd040d162fba1d4ceb64def43828e116154338347dd2e'
                 'f65de81eca52d5d8ecf0c4943dda92f9ee616fdc238877f775e9245f485009ac')

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
  install -Dm0644 "${srcdir}/playit.service" "${pkgdir}/usr/lib/systemd/system/playit.service"
  install -Dm0644 "${srcdir}/playit.sysusers" "${pkgdir}/usr/lib/sysusers.d/playit.conf"
  install -Dm0644 "${srcdir}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"

  install -dm0750 "${pkgdir}/etc/playit"
  install -dm0755 "${pkgdir}/usr/bin"

  ln -s /opt/playit/playit "${pkgdir}/usr/bin/playit"
  ln -s /opt/playit/playitd "${pkgdir}/usr/bin/playitd"
}
