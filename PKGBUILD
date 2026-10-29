# Maintainer: Patrick Lorio <patrick@playit.gg>
# Contributor: Gilwiljam <gillbilljam@gmail.com>
# Contributor: Samuel Corsi-House <chouse.samuel@gmail.com>

pkgname=playit-bin
pkgver=1.2.0
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
            'fd6b309c4e1008b81675a2ad0ea27e709f02f405a502816c238a73c60b497da9'
            'a07e7ae69701e99224bfcd8a464b028c7e7eef241017900701b70ac903e42d39'
            'f9d32c6b4a6055b2bfa48543d68119efc46ea4606f0d9cc973cb273dcd59be9c')
sha256sums_x86_64=('a10cd77866bdd81837848ad08b6629012637f2662e7c0b7d9310bcdb619feebd'
                   '602dea3288d5bad4c3addba70ecf6535b9ae085b8d4f2fc2fe9cde913bda78d0')
sha256sums_aarch64=('d4cc2cd2e6f4bc9614a2b764eba60a5e0656d71ff8a2720a061e2333daef8940'
                    '3a6d69c348803c7041c49312345c18b1e9cb7dd7fc2adfbf2217e50d0d7c9a34')
sha256sums_armv7h=('f5e8bb223d707e51b94a2a35dea038d02d6235295ef19f7bdabfedd39424c58d'
                   'd6314b5e83318bf0b8731aae95e81f499ed4338d30e5e8a8bf866cdebcf6e8e0')
sha256sums_i686=('34bf2c4ff47f70d5ae225c8e94866b53a88151f7c0c8ba0e0a57dc89d39696b0'
                 '14e8d468565a0fdba14af436280af960b6fe189b5bfade132d68134a196a6dbb')

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
  install -Dm0644 "${srcdir}/playit.service" "${pkgdir}/opt/playit/share/init/systemd/playit.service"
  install -Dm0755 "${srcdir}/playit.openrc" "${pkgdir}/opt/playit/share/init/openrc/playit"
  install -Dm0644 "${srcdir}/playit.sysusers" "${pkgdir}/usr/lib/sysusers.d/playit.conf"
  install -Dm0644 "${srcdir}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"

  install -dm0750 "${pkgdir}/etc/playit"
  install -dm0755 "${pkgdir}/usr/bin"

  ln -s /opt/playit/playit "${pkgdir}/usr/bin/playit"
  ln -s /opt/playit/playitd "${pkgdir}/usr/bin/playitd"
}
