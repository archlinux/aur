# Maintainer: arraen
pkgname="synergy3-bin"
pkgver="v3.0.73.7"
pkgrel="9"
pkgdesc="Share a single mouse and keyboard between multiple computers"
url="https://symless.com/synergy"
license=('unknown')
arch=("x86_64")
source_x86_64=("https://rc.symless.com/synergy3/$pkgver-rc2/synergy-linux_x64-libssl3-$pkgver-rc2.deb")
sha256sums_x86_64=("ddd6d2d5836a0b6cb14b45edcf7ee3575c24425a46c08d3bda6a2a759482c40a")

conflicts=('synergy' 'synergy1-bin' 'synergy-git' 'synergy-1.6' 'synergy2-bin' 'synergy3-bin')
depends=('openssl')
optdepends=('libappindicator-gtk3')
options=("!strip")

package() {
  bsdtar -xf ${srcdir}/data.tar.xz -C ${pkgdir}/
  mkdir -p ${pkgdir}/usr/bin
  ln -s /opt/Synergy/synergys ${pkgdir}/usr/bin/synergys
  ln -s /opt/Synergy/synergyc ${pkgdir}/usr/bin/synergyc
  ln -s /opt/Synergy/synergy-core ${pkgdir}/usr/bin/synergy-core
  mkdir -p ${pkgdir}/etc/systemd/user/graphical-session.target.wants
  cp ${pkgdir}/opt/Synergy/resources/services/global/synergy.service ${pkgdir}/etc/systemd/user/
  cp ${pkgdir}/opt/Synergy/resources/services/global/synergy.service ${pkgdir}/etc/systemd/user/graphical-session.target.wants/
  chmod 4755 ${pkgdir}/opt/Synergy/chrome-sandbox || true
}

post_install() {
  update-mime-database /usr/share/mime || true
  update-desktop-database /usr/share/applications || true
}

post_remove() {
  rm -f '/usr/bin/synergys'
  rm -f '/usr/bin/synergyc'
  rm -f '/usr/bin/synergy-core'
  rm -f '/etc/systemd/user/synergy.service'
  rm -f '/etc/systemd/user/graphical-session.target.wants/synergy.service'
}
