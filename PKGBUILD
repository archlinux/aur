# Maintainer: Patrick Lorio <patrick@playit.gg>
# Contributor: Gilwiljam <gillbilljam@gmail.com>
# Contributor: Samuel Corsi-House <chouse.samuel@gmail.com>

pkgname=playit-bin
pkgver=1.1.0
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
sha256sums_x86_64=('d0d61355cadae033595e5671e7b5cf9200f434b4796ce5ccaf55ec77139e18ba'
                   '1ccd3fe491d4f54e71504da001c16fa4718832a5cb7ee2461dce2816c3fbbc07')
sha256sums_aarch64=('4695f3cc2b48545d1781888c8549cde8f12344e9152fc1bd62b65012432e2a39'
                    'd072bd00a076b99fddc81204523d452d1e25f90545c35b224e4009b41ff0cbb2')
sha256sums_armv7h=('8c492c67d7287adf381ab2602aaa8775646fd0030862c00a0308813fead35ca1'
                   '75ffc9bfd2e44a05334be5495c1df636384ffe976ef16a2d3a05dac196e091b1')
sha256sums_i686=('11614ad90fb9135272b694f6ac2050ecd8646b09a266f3196ce726db2a7b3d44'
                 'b3275412e8a2e4ca2b3294fb7598e6a8595840b8ce3e5bc36fde4619b47703ad')

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
