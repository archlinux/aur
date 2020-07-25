# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgname=pgyvpn-bin
_pkgname=PgyVPN
pkgver=2.2.0
pkgrel=1
pkgdesc="Suitable for business personnal long-distance intelligent network access"
arch=('armv7h')
url="https://pgy.oray.com/download/"
license=('custom')
install='.INSTALL'
source=('LICENSE::https://service.oray.com/question/1820.html')
source_armv7h=("http://download.oray.com/pgy/embed/${_pkgname}-${pkgver}-armhf_systemd.deb")
sha256sums=('SKIP')
sha256sums_armv7h=('fe27877ca149907c3e94630c5d30b1e346e6fa26f69c9071ea851135915a39d5')

package() {
  tar -xf data.tar.xz -C ${pkgdir}

  cd ${pkgdir}

  # binary
  for binary in usr/sbin/*;
  do
    install -Dm755 $binary usr/bin/`basename $binary`
  done
  rm -rf usr/sbin

  # systemd service
  install -Dm644 lib/systemd/system/${pkgname%-bin}.service usr/lib/systemd/system/${pkgname%-bin}.service
  rm -rf lib

  sed -i 's|/usr/sbin/|/usr/bin/|g' usr/lib/systemd/system/${pkgname%-bin}.service

  # license
  install -Dm644 ${srcdir}/LICENSE usr/share/licenses/${pkgname}/LICENSE

  # fixed permission
  chown -R root:root usr etc
  chmod 755 usr usr/share etc etc/oray etc/oray/pgyvpn
}
# vim: ts=2 sw=2 et:
