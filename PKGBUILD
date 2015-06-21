# Maintainer: Yaohan Chen <yaohan.chen@gmail.com>
# Contributor: spider-mario <spidermario@free.fr>
# Contributor: p2k <Patrick.Schneider@uni-ulm.de>
# Contributor: Schtroumpfette <fpeterschmitt@voila.fr>

pkgname=dofus
pkgver=2.27
pkgrel=1
pkgdesc='A manga inspired, Massively Multiplayer Online Role-playing Game (MMORPG) for Adobe AIR .'
arch=('i686' 'x86_64')
url='http://www.dofus.com/'
license=('custom:Dofus License')
install='dofus.install'
backup=('opt/ankama/dofus/transition.conf')
depends=('ankama-transition>=3.10.1-3' 'adobe-air-sdk')
depends_x86_64+=('lib32-gtk2' 'lib32-alsa-lib' 'lib32-alsa-plugins')
depends_i686+=('gtk2' 'alsa-lib' 'alsa-plugins')

source=('http://dl.ak.ankama.com/games/linux/dofus-release-package.tar.gz'
        'air-generic-launcher.sh'
        'transition.conf.patch'
        'dofus.patch'
        'dofus.desktop.patch')
md5sums=('1fbc57d311bd113cd89780a42f9d2ced'
         'f179eaa5e6e6674b1853cf826fc33c3a'
         'ea9fb95c6027be5f0efb64fc7038f369'
         'f361c2d577f249d00581e73d5c4af175'
         '06fe521608a2b4dd7766d7c6b48ae8ee')

prepare() {
  cd "$srcdir"
  msg2 "Modifying transition configuration to use adl-based launchers"
  patch -p0 < transition.conf.patch

  #msg2 "Modifying launcher to avoid crash on start up"
  #patch -p0 < dofus.patch
}

package() {
  cd "$srcdir"
  msg2 'Installing main applications...'
  mv usr opt "$pkgdir/"

  msg2 'Setting up game file permissions...'
  _installdir="$pkgdir/opt/ankama/dofus"
  chgrp -R games $_installdir
  chmod -R g+w $_installdir

  msg2 'Installing adl based launchers...'
  install -Dm755 'air-generic-launcher.sh' "$_installdir/bin/air-generic-launcher.sh"
  install -Dm755 'air-generic-launcher.sh' "$_installdir/share/reg/bin/air-generic-launcher.sh"

  msg2 'Installing transition update file...'
  ln -s '/opt/ankama/transition/' "$_installdir/transition"
}

# vim:set ts=2 sw=2 et:
