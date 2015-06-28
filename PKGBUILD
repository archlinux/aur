# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=evolus-pencil-svn
pkgver=354
pkgrel=1
pkgdesc="Sketching and GUI prototyping tool"
arch=('any')
url="http://code.google.com/p/evoluspencil/"
license=('GPL2')
depends=('firefox')
makedepends=('subversion')
provides=('pencil')
conflicts=('pencil')
source=('pencil::svn+http://evoluspencil.googlecode.com/svn/branches/pencil-2.0')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/pencil"
  svnversion | tr -d [A-z]
}

package() {
  _OUTPUT=$pkgdir/usr/share/pencil

  cd "$srcdir/pencil"

  # the install procedure is based on build/build.sh
  install -d -m755 "$_OUTPUT"
  cp -a app/* "$_OUTPUT"
  find "$_OUTPUT" -name .svn | xargs -i rm -Rf {}

  cd build
  . ./properties.sh
  ./replacer.sh "$_OUTPUT"/content/pencil/mainWindow.xul
  ./replacer.sh "$_OUTPUT"/content/pencil/aboutDialog.xul
  ./replacer.sh "$_OUTPUT"/content/pencil/common/pencil.js
  ./replacer.sh "$_OUTPUT"/content/pencil/common/util.js
  ./replacer.sh "$_OUTPUT"/application.ini
  ./replacer.sh "$_OUTPUT"/content/pencil/aboutDialog.js
  ./replacer.sh "$_OUTPUT"/defaults/preferences/pencil.js

  rm "$_OUTPUT"/defaults/preferences/personal.js.xulrunner
  rm "$_OUTPUT"/defaults/preferences/debug.js
  
  install -D -m755 Fedora-RPM/buildroot/usr/bin/pencil \
    "$pkgdir/usr/bin/pencil"
  install -D -m755 Fedora-RPM/buildroot/usr/share/applications/pencil.desktop \
    "$pkgdir/usr/share/applications/pencil.desktop"

  # use firefox instead of xulrunner
  sed -i -s 's|xulrunner|firefox|' "$pkgdir/usr/bin/pencil"
}
