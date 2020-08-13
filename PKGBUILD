# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgname=pgyvpn-bin
_pkgname=PgyVPN
pkgver=2.2.1
pkgrel=1
pkgdesc="Suitable for business personnal long-distance intelligent network access"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://pgy.oray.com/download/"
provides=(${pkgname%-bin})
replaces=(${pkgname%-bin})
conflicts=(${pkgname%-bin})
license=('custom')
install='.INSTALL'
source=('LICENSE::https://service.oray.com/question/1820.html'
        "${pkgname%-bin}.service")
source_x86_64=("http://dl-cdn.oray.com/pgy/linux/${_pkgname}_Ubuntu_${pkgver}_X86_64.deb")
source_i686=("http://dl-cdn.oray.com/pgy/linux/${_pkgname}_Ubuntu_${pkgver}_i386.deb")
source_aarch64=("http://dl-cdn.oray.com/pgy/linux/${_pkgname}_Raspbian_${pkgver}_arm64_systemd.deb")
source_armv7h=("http://dl-cdn.oray.com/pgy/linux/${_pkgname}_Raspbian_${pkgver}_armhf_systemd.deb")
sha256sums=('SKIP'
            '25995cc8f865139147ced000fea52a8f4dda072addbf9e4a3b18b5c599a8be7f')
sha256sums_x86_64=('6a274cc1066dedd1559ef0716b7f6fe7aae503d9e82471ebca42234072e41814')
sha256sums_i686=('c1d695592944d2b5465f9567b89aeaeba3903c7458c97a7074fc938e106b3721')
sha256sums_aarch64=('13461c523035f112f92ef3e5ceca5f9adf0bff3a1fa1c04408b98a7ac0978d95')
sha256sums_armv7h=('3fa1f8d0e5d66cfcba8b18620311b2e6a5566daf2dd127f0346ce5fadf1096bb')

package() {
  tar -xf data.tar.*z -C ${pkgdir}

  cd ${pkgdir}

  # binary
  for binary in usr/sbin/*;
  do
    install -Dm755 $binary usr/bin/`basename $binary`
  done
  rm -rf usr/sbin

  # systemd service
  install -Dm644 ${srcdir}/${pkgname%-bin}.service usr/lib/systemd/system/${pkgname%-bin}.service
  if [ $CARCH == 'x86_64' ] || [ $CARCH == 'i686' ];then
    rm -rf etc/init.d
  else
    rm -rf lib
  fi

  # license
  install -Dm644 ${srcdir}/LICENSE usr/share/licenses/${pkgname}/LICENSE

  # fixed permission
  chown -R root:root usr etc
  chmod 755 usr usr/share etc etc/oray etc/oray/pgyvpn
}

# vim: ts=2 sw=2 et:
