# Maintainer: Yaohan Chen <yaohan.chen@gmail.com>
# Contributor: spider-mario <spidermario@free.fr>
# Contributor: p2k <Patrick.Schneider@uni-ulm.de>
# Contributor: Schtroumpfette <fpeterschmitt@voila.fr>

pkgname=dofus-beta
pkgver=2.21
pkgrel=2
pkgdesc='A manga inspired, Massively Multiplayer Online Role-playing Game (MMORPG) for Adobe AIR  (Beta version).'
arch=('i686' 'x86_64')
url='http://www.dofus.com/'
license=('custom:Dofus License')
install='dofus-beta.install'
backup=('opt/ankama/dofus-beta/transition.conf')
depends=('ankama-transition>=3.8.1-3' 'adobe-air-sdk')
if [ "$CARCH" == 'x86_64' ]; then
  depends+=('lib32-gtk2' 'lib32-alsa-lib')
else
  depends+=('gtk2' 'alsa-lib')
fi

source=('http://dl.ak.ankama.com/games/dofus2-beta/setup/setup-beta-transition-amd64.tar.gz'
        'http://dl.ak.ankama.com/games/dofus2-beta/setup/setup-beta-transition-x86.tar.gz'
        'dofus-beta.sh'
        'dofus-beta.desktop'
        'air-generic-launcher.sh'
        'transition.conf.append')
md5sums=('d63b778424826a783ca3d5e28d5b3649'
         'a94dee7dd29de51525e47dee04ca5182'
         '91023d67a519421912b3d101ded7ca12'
         '0e797e4fcf39e1d06f68b51bfd215040'
         'f179eaa5e6e6674b1853cf826fc33c3a'
         '0241708575069715d56b88b96dcbf7e8')
# Skip this block if PKGBUILD is sourced by updpkgsums (pstree is used for this check,
# and if not available, this check is skipped)
if ! ( command -v pstree >/dev/null 2>&1 && \
    pstree --show-parents $$ | grep -q updpkgsums ) ; then
  # Remove source and md5sum for the wrong arch
  if [ "$CARCH" == "x86_64" ];then
    unset source[1] md5sums[1]
  elif [ "$CARCH" == 'i686' ]; then
    unset source[0] md5sums[0]
  fi
fi

prepare() {
  msg2 "Modifying transition configuration to use adl-based launchers"
  cat 'transition.conf.append' >> 'DofusBeta/transition.conf'
}

package() {
  _installdir="$pkgdir/opt/ankama/dofus-beta"
  install -d "$_installdir"

  cd "$srcdir"
  msg2 'Installing menu entry...'
  install -Dm755 'dofus-beta.sh' "$pkgdir/usr/bin/dofus-beta"
  install -Dm644 'dofus-beta.desktop' "$pkgdir/usr/share/applications/dofus-beta.desktop"
  install -Dm644 'DofusBeta/share/icon/dofus-icon-128.png' "$pkgdir/usr/share/pixmaps/dofus-beta.png"

  msg2 'Installing main applications...'
  mv "DofusBeta/"{bin,share,transition.conf} "$_installdir"

  msg2 'Setting up game file permissions...'
  chgrp -R games $_installdir
  chmod -R g+w $_installdir
  chmod 666 "$_installdir/share/META-INF/AIR/application.xml"

  msg2 'Installing adl based launchers...'
  install -Dm755 'air-generic-launcher.sh' "$_installdir/bin"
  install -Dm755 'air-generic-launcher.sh' "$_installdir/share/reg/bin"

  msg2 'Installing transition update file...'
  ln -s '/opt/ankama/transition/' "$_installdir/transition"
}

# vim:set ts=2 sw=2 et:
