# Contributor: Johannes Dewender arch at JonnyJD dot net
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
pkgname=holyspirit-svn
pkgver=2419
pkgrel=1
pkgdesc="Diablo clone"
arch=(i686 x86_64)
url="http://www.holyspirit.fr/"
license=('GPL')
# there is no sfml 2.0rc with the BackSpace key change
depends=('sfml')
makedepends=('subversion' 'cmake' 'qtwebkit')
optdepends=('qtwebkit: for the launcher')
provides=('holyspirit')
conflicts=('holyspirit')
install=holyspirit.install
source=(holyspirit.sh config_crash.patch backspace.patch qt-includes.patch)
backup=('opt/share/games/holyspirit/configuration.conf' 'opt/share/games/holyspirit/key_mapping.conf')
md5sums=('c2fa4f8768d35c54a95dec924e50c75f'
         'c0fd6d1ede2cb6afbcf082aaae0cc60b'
         '4967f1cd4216d1ec2ff3cfd1941b18df'
         '97fde790c28fd547be56a8c0d9e2029a')

_svntrunk=https://lechemindeladam.svn.sourceforge.net/svnroot/lechemindeladam/trunk
_svnmod=holyspirit

build() {
  cd "$srcdir"
  msg "Connecting to SVN server...."

  if [[ -d "$_svnmod/.svn" ]]; then
    (cd "$_svnmod" && svn up -r "$pkgver")
  else
    svn co "$_svntrunk" --config-dir ./ -r "$pkgver" "$_svnmod"
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

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
  sed -i -e 's|/usr/share/qt4|/usr/share/qt|g' Makefile
  sed -i -e 's|/usr/bin/moc-qt4|/usr/bin/moc|g' Makefile
  make INCPATH="-I/usr/share/qt/mkspecs/linux-g++ -I. -I/usr/include/QtCore -I/usr/include/QtNetwork -I/usr/include/QtGui -I/usr/include/QtWebKit -I/usr/include/Qt -I. -I."
}

package() {
  cd "$srcdir/$_svnmod-build"

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
