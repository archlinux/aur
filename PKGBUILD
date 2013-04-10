# Contributor: Johannes Dewender arch at JonnyJD dot net
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
pkgname=holyspirit-svn
pkgver=2420
pkgrel=2
pkgdesc="Action role-playing game (ARPG, like diablo)"
arch=(i686 x86_64)
url="http://www.holyspirit.fr/"
license=('GPL')
depends=('sfml')
makedepends=('subversion' 'cmake' 'qtwebkit')
optdepends=('qtwebkit: for the launcher')
provides=('holyspirit')
conflicts=('holyspirit')
install=holyspirit.install
source=('holyspirit::svn+https://lechemindeladam.svn.sourceforge.net/svnroot/lechemindeladam/trunk'
holyspirit.sh config_crash.patch backspace.patch qt-includes.patch)
backup=('opt/share/games/holyspirit/configuration.conf' 'opt/share/games/holyspirit/key_mapping.conf')
md5sums=('SKIP'
         'c2fa4f8768d35c54a95dec924e50c75f'
         'c0fd6d1ede2cb6afbcf082aaae0cc60b'
         '4967f1cd4216d1ec2ff3cfd1941b18df'
         '97fde790c28fd547be56a8c0d9e2029a')

pkgver(){
  cd "$SRCDEST/holyspirit"
  svnversion
}
build() {
  cd "$srcdir/holyspirit"

  # patches
  patch -p1 < ../config_crash.patch
  patch -p1 < ../backspace.patch
  patch -p2 < ../qt-includes.patch

  cmake -DSFML_STATIC_LIBRARIES=FALSE \
    -DCMAKE_INSTALL_PREFIX:STRING="$pkgdir/opt"

  msg "Building holyspirit..."
  make

  msg "Building the launcher..."
  cd Launcher
  make
}

package() {
  cd "$srcdir/holyspirit"

  # fix currently broken upstream installation
  sed -i -e "s|$pkgdir/opt/share/games/holyspirit/||g" holyspirit.ini
  cp ../LauncherHolyspirit .
  make install

  # fix currently broken upstream installation
  mv "$pkgdir/opt/games/"* "$pkgdir/opt/share/games/holyspirit/"
  rm -r "$pkgdir/opt/games"

  # desktop icon can be installed in /usr
  mkdir -p "$pkgdir/usr/share"
  mv "$pkgdir/opt/share/applications" "$pkgdir/usr/share/applications"
  mv "$pkgdir/opt/share/icons" "$pkgdir/usr/share/icons"
  sed -i -e "s|$pkgdir/opt|/opt/share|g" \
    "$pkgdir/usr/share/applications/Holyspirit.desktop"

  # make savegames, config and temp dirs writable
  chgrp -R games "$pkgdir/opt/share/games/holyspirit/"{Data/User,{configuration,key_mapping}.conf}
  chmod -R g+w "$pkgdir/opt/share/games/holyspirit/"{Data/User,{configuration,key_mapping}.conf}

  install -D "$srcdir/holyspirit.sh" "$pkgdir/usr/bin/holyspirit"
}

# vim:set ts=2 sw=2 et:
