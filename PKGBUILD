# Maintainer: Dmitriy Bogdanov <di72nn at gmail dot com>
# Contributor: Andrey Makarov <xdersd@gmail.com>

_gitname='vk4xmpp'
pkgname="$_gitname-git"
pkgver=r416.4636358
pkgrel=1
pkgdesc='A jabber gateway to the VK social network'
arch=('any')
url="https://github.com/mrDoctorWho/vk4xmpp"
license=('MIT')
depends=('python2')
makedepends=('git')
optdepends=('python2-ujson: use faster json library')
backup=('etc/vk4xmpp/conf')
source=('git+https://github.com/mrDoctorWho/vk4xmpp.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$_gitname"

  install -d "$pkgdir/usr/share/$_gitname"
  cp -R * "$pkgdir/usr/share/$_gitname"
  rm -r "$pkgdir/usr/share/$_gitname/DEBIAN/"
  rm -r "$pkgdir/usr/share/$_gitname/init.d/"
  rm -r "$pkgdir/usr/share/$_gitname/systemd/"
  rm "$pkgdir/usr/share/$_gitname/Config_example.txt"

  install -dm750 "${pkgdir}/etc/vk4xmpp/"
  install -Dm640 "Config_example.txt" "$pkgdir/etc/vk4xmpp/conf"
  chown 257:257 -R "$pkgdir/etc/vk4xmpp/"
  sed -i -E "s:(DatabaseFile = \")[^\"]*(\"):\1/var/lib/vk4xmpp/users.db\2:" "$pkgdir/etc/vk4xmpp/conf"
  sed -i -E "s:(pidFile = \")[^\"]*(\"):\1/var/run/vk4xmpp/vk4xmpp.pid\2:" "$pkgdir/etc/vk4xmpp/conf"
  sed -i -E "s:(logFile = \")[^\"]*(\"):\1/var/log/vk4xmpp/vk4xmpp.log\2:" "$pkgdir/etc/vk4xmpp/conf"
  sed -i -E "s:(crashDir = \")[^\"]*(\"):\1/var/log/vk4xmpp\2:" "$pkgdir/etc/vk4xmpp/conf"

  install -Dm644 "systemd/vk4xmpp.service.debian" "$pkgdir/usr/lib/systemd/system/vk4xmpp.service"
  sed -i -E "s: /usr/bin/vk4xmpp : /usr/share/vk4xmpp/gateway.py :" "$pkgdir/usr/lib/systemd/system/vk4xmpp.service"

  install -d "${pkgdir}/usr/lib/sysusers.d/"
  echo -e "g vk4xmpp 257 - -\nu vk4xmpp 257 - /var/lib/vk4xmpp" > "${pkgdir}/usr/lib/sysusers.d/vk4xmpp.conf"

  install -d "${pkgdir}/usr/lib/tmpfiles.d/"
  echo -e "d /var/lib/vk4xmpp 0700 vk4xmpp vk4xmpp -\nd /run/vk4xmpp 0750 vk4xmpp vk4xmpp -\nd /var/log/vk4xmpp 0750 vk4xmpp vk4xmpp -" > "${pkgdir}/usr/lib/tmpfiles.d/vk4xmpp.conf"

  _revision="#$(git rev-list HEAD --count)-$(git describe --always)"
  sed -i -E "s/REVISION = getGatewayRev\(\)/REVISION = '${_revision}\\\n'/" "${pkgdir}/usr/share/${_gitname}/gateway.py"
}

# vim:set ts=2 sw=2 et:
