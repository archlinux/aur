# Contributor: Johannes Dewender arch at JonnyJD dot net
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
pkgname=holyspirit-svn
pkgver=2381
pkgrel=1
pkgdesc="Diablo clone"
arch=(i686 x86_64)
url="http://www.holyspirit.fr/"
license=('GPL')
depends=('sfml')
makedepends=('subversion' 'cmake' 'qtwebkit')
optdepends=('qtwebkit: for the launcher')
provides=('holyspirit')
conflicts=('holyspirit')
install=holyspirit.install
source=(holyspirit.sh config_crash.patch)
backup=('opt/share/games/holyspirit/configuration.conf' 'opt/share/games/holyspirit/key_mapping.conf')
md5sums=('c2fa4f8768d35c54a95dec924e50c75f'
         'b997e0c5d714c615509db7850d0290e3')

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

  patch -p1 < ../config_crash.patch

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
