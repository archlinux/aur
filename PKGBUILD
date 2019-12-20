# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>
# Contributor: Sébastien Luttringer

pkgname=unifi-beta
pkgver=5.12.46
_pkgver=d9f4b84b08
pkgrel=1
pkgdesc='Controller for Ubiquiti UniFi accesspoints'
arch=('any')
url='http://www.ubnt.com/'
license=('custom')
depends=('mongodb' 'java-runtime' 'fontconfig')
provides=('unifi')
conflicts=('unifi' 'unifi-controller-beta')
replaces=('unifi-controller-beta')
source=("${pkgname}-${pkgver}.zip::https://www.ubnt.com/downloads/unifi/${pkgver}-${_pkgver}/UniFi.unix.zip"
        mongod
        unifi.service
        unifi.sysusers
        unifi.tmpfiles
        LICENSE)
sha512sums=('05135f75bf6484810ff66b58452ea8bca1c4e47d5fa7a955bdf9653777f80a7fa355bdaa6586e3a0d98bdcf69cce4e28cf3d14cf8204b82591ba6a08307deef3'
            'ea729c0053bf82e5561ce5f4fb7dba90cbe1b84631f5c257371883090ae5ccc58bd212cb93c9df51e687cdb2b5cdfa8c9e5bfc22bc7d58dc23c9c4dce3a686b8'
            '4b77e480dac9acef58e2d8f088491aa056a55edc9ca613c1b707d53ca802579513082e7c16f5a59689813609b97c2391253c99d77709be4a536abb683e5106ed'
            '29472fa25c24ef2197eda673b8661f14705bb472f6a52c06fb7915357446443016d35f2257d30aa9f9fce97293e7b7629d331ff1c17fd62cf3398f5c58e2c32b'
            'd8d08d50dc0a2cd4c23cf32f716bad94a35a1e995361471e4b4c583845411e42b1896e65fe42e9d05389c4e5611b45ae1b3037655067e7e9735ead4393cfeeb1'
            '22e0a4d5be7645e7f1dd760a1b93fa5a49a7e92ce6f23f2a7d0f72043cd0be057bd3faecabd1d3048ecf93480b47d278926b99b5abc17ecbe91a5b15763f0a9c')

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
