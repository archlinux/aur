# Maintainer: Frederik Schwan <freswa at archlinux dot org>
# Contributor: Sébastien Luttringer

pkgname=unifi-beta
pkgver=8.0.24
_pkgver=450f174e64
pkgrel=1
pkgdesc='Controller for Ubiquiti UniFi accesspoints'
arch=('x86_64' 'armv7h' 'aarch64')
url='https://www.ubnt.com/'
license=('custom')
depends=('mongodb' 'java-runtime-headless>=17' 'fontconfig')
provides=('unifi')
source=("${pkgname}-${pkgver}.zip::https://www.ubnt.com/downloads/unifi/${pkgver}-${_pkgver}/UniFi.unix.zip"
        mongod
        unifi.service
        unifi.sysusers
        unifi.tmpfiles
        LICENSE)
b2sums=('d7b767908027bb6df460ebd8c9779f7816f2b3f14d94e1a5be368fbabe135e062a7401ecd6d5ea7d82044abc6f727d9ef4061dddacd7148d5627326ecff1243c'
        '2c8d535aabe8e738a9ba375fc4ab7aaa1713c9aefffc3e652fd49bc6288d0b7d24cae64d04ded5d5052486a377edca190818874a80bafb33cf2ac94742540106'
        '6652c7bbdc8758c24cb38525bda5f3a27dfd0b58656fd7214d837cdde911f3e2141e7060fef17d9f55b362fdae1111b5b3aef1f32f93dedd4552c79a524b5d38'
        '5474a726a8a222f463f47cdca44988889406e2bee7b3c7875d45b20dc283d1d9737772d8cb63cd35c75517f3606feaadcf02c00b73e5bbab40f459d78d066c3e'
        'bd254ddbd4b52acca50b41dffe7ae1e2e5250f15574fc371d36dc133215f3a268623b0b5b12e73932c856bf90a69a178ba91530ffa8b08c0da51f51911b2ef92'
        '84f2a201143b3e44ba09d1009818db507d8f261d495a86ce239bcbacee059aad5c63af1b43638b126be743ff7c660f0871eb2b4efe2031e2f64bc23f172052e0')

package() {
  # lib
  install -dm755 "${pkgdir}"/usr/lib/unifi
  cp -r UniFi/{bin,dl,lib,webapps} "${pkgdir}"/usr/lib/unifi
  case ${CARCH} in
  x86_64)
      rm -r "${pkgdir}"/usr/lib/unifi/lib/native/Linux/aarch64
      ;;
  aarch64)
      rm -r "${pkgdir}"/usr/lib/unifi/lib/native/Linux/x86_64
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
      install -dm750 "${pkgdir}"/var/lib/unifi/${_d}
      ln -s ../../../var/lib/unifi/${_d} "${pkgdir}"/usr/lib/unifi/${_d}
  done

  # log
  install -dm750 "${pkgdir}"/var/log/unifi
  ln -s ../../../var/log/unifi "${pkgdir}"/usr/lib/unifi/logs

  # readme
  install -Dm644 UniFi/readme.txt "${pkgdir}"/usr/share/doc/${pkgname}/README

  # license
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE

  # systemd
  install -Dm644 unifi.service "${pkgdir}"/usr/lib/systemd/system/unifi.service
  install -Dm644 unifi.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/unifi.conf
  install -Dm644 unifi.sysusers "${pkgdir}"/usr/lib/sysusers.d/unifi.conf
}
