# Maintainer: Frederik Schwan <freswa at archlinux dot org>
# Contributor: Sébastien "Seblu" Luttringer <seblu@archlinux.org>

pkgname=unifi
pkgver=7.4.156
pkgrel=1
pkgdesc='Centralized management system for Ubiquiti UniFi AP'
arch=('x86_64' 'armv7h' 'aarch64')
url='https://unifi-network.ui.com'
# We are allowed to ship the software in our repository
# https://mailman.archlinux.org/mailman/private/arch-dev/2014-August/015690.html
license=('custom')
depends=('mongodb' 'java-runtime-headless=11' 'fontconfig')
conflicts=('tomcat-native')
source=("UniFi-${pkgver}.zip::https://dl.ubnt.com/unifi/${pkgver}/UniFi.unix.zip"
        mongod
        unifi.service
        unifi.sysusers
        unifi.tmpfiles
        LICENSE)
b2sums=('4228911702267e9ebbdcabfbe773f0e2d3597d2e012be72c51d19b352fcd57756ac7e9a9d8b64b46ef1e590bfd36cc768f1afd0a0e09b321fc75bb6a3b8a5baa'
        '2c8d535aabe8e738a9ba375fc4ab7aaa1713c9aefffc3e652fd49bc6288d0b7d24cae64d04ded5d5052486a377edca190818874a80bafb33cf2ac94742540106'
        '6652c7bbdc8758c24cb38525bda5f3a27dfd0b58656fd7214d837cdde911f3e2141e7060fef17d9f55b362fdae1111b5b3aef1f32f93dedd4552c79a524b5d38'
        '5474a726a8a222f463f47cdca44988889406e2bee7b3c7875d45b20dc283d1d9737772d8cb63cd35c75517f3606feaadcf02c00b73e5bbab40f459d78d066c3e'
        'bd254ddbd4b52acca50b41dffe7ae1e2e5250f15574fc371d36dc133215f3a268623b0b5b12e73932c856bf90a69a178ba91530ffa8b08c0da51f51911b2ef92'
        '84f2a201143b3e44ba09d1009818db507d8f261d495a86ce239bcbacee059aad5c63af1b43638b126be743ff7c660f0871eb2b4efe2031e2f64bc23f172052e0')

package() {
  # lib
  install -dm755 "${pkgdir}"/usr/lib/unifi
  cp -r UniFi/{bin,dl,lib,webapps} "${pkgdir}"/usr/lib/unifi
  rm -r "${pkgdir}"/usr/lib/unifi/lib/native/{Mac,Windows}
  case ${CARCH} in
  armv7h)
      rm -r "${pkgdir}"/usr/lib/unifi/lib/native/Linux/{aarch64,x86_64}
      ;;
  x86_64)
      rm -r "${pkgdir}"/usr/lib/unifi/lib/native/Linux/{aarch64,armv7}
      ;;
  aarch64)
      rm -r "${pkgdir}"/usr/lib/unifi/lib/native/Linux/{x86_64,armv7}
      ;;
  *)
      rm -r "${pkgdir}"/usr/lib/unifi/lib/native/Linux
      ;;
  esac

  # fix incompatibility with mongodb >= 3.6
  rm "${pkgdir}"/usr/lib/unifi/bin/mongod
  install -Dm755 "${srcdir}"/mongod "${pkgdir}"/usr/lib/unifi/bin/mongod

  # data
  install -dm750 "${pkgdir}"/var/lib/unifi
  for _d in {data,run,work}; do
      ln -s ../../../var/lib/unifi/${_d} "${pkgdir}"/usr/lib/unifi/${_d}
  done

  # log
  ln -s ../../../var/log/unifi "${pkgdir}"/usr/lib/unifi/logs

  # readme
  install -Dm644 UniFi/readme.txt "${pkgdir}"/usr/share/doc/${pkgname}/README

  # license
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE

  # systemd
  install -Dm644 ${pkgname}.service "${pkgdir}"/usr/lib/systemd/system/${pkgname}.service
  install -Dm644 ${pkgname}.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/${pkgname}.conf
  install -Dm644 ${pkgname}.sysusers "${pkgdir}"/usr/lib/sysusers.d/${pkgname}.conf
}
