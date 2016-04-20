# Maintainer: K. Hampf <k.hampf@gmail.com>
# Contributor: Félix Piédallu <felix@piedallu.me>
# Contributor: Dan Serban (dserban01 => gmail)
# Contributor: Alexandre Gambini <chs_ale@msn.com>

# This package should be named gitso-git
pkgname=gitso
gitsover=0.6
pkgver=0.6_20151011
pkgrel=1
pkgdesc="GUI frontend to reverse VNC connections"
arch=('i686' 'x86_64')
url="http://code.google.com/p/gitso/"
license=('GPLv3')
depends=('iproute2' 'wxpython' 'x11vnc' 'tigervnc')
source=("git+https://github.com/rastersoft/Gitso")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/Gitso"
  msg "Trying to read git version ..."
  local desc=$(git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g')
  if [ -z "$desc" ]; then
    msg "Git version failed, using date of last commit ..."
    # hardcoded version + _ + date of last commit as YYYYMMDD
    echo -n "${gitsover}_"
    git log -1 --date=format:%Y%m%d --format=%cd
  fi
}

prepare() {
  cd "$srcdir"
  [ -e "$pkgname" ] || ln -s "Gitso" "$pkgname"
  cd "$srcdir/$pkgname"
  msg "Patching python scripts to use python2 ..."
  sed -i "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" $(find $srcdir -name '*.py')
  msg "Applying workarounds for two very annoying x11vnc quirks ..."
  sed -i "s/'-nopw','-ncache','20'/'-nopw','-noxrecord','-xkb'/" src/Gitso/Processes.py
}

#build() {
#  msg "No build necessary"
#  # We should build the translations here
#}

package() {
  cd "$srcdir/$pkgname"

  # Source code
  install -D "src/gitso.py" "$pkgdir/usr/bin/gitso"
  install -d "src/Gitso/" "$pkgdir/usr/lib/python2.7/site-packages"
  cp -R "src/Gitso/" "$pkgdir/usr/lib/python2.7/site-packages"

  # Translations
  cp -R locale "$pkgdir/usr/share/"

  # Shared resources
  install -D "arch/linux/README-stand-alone.txt" "$pkgdir/usr/share/doc/gitso/README"
  ln -s README "$pkgdir/usr/share/doc/gitso/Changelog"
  install -D "arch/linux/gitso.1" "$pkgdir/usr/share/man/man1/gitso.1"
  install -D "COPYING" "$pkgdir/usr/share/licenses/gitso/COPYING"
  install -D "data/gitso.desktop" "$pkgdir/usr/share/applications/gitso.desktop"
  install -D "data/icons/gitso.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/gitso.png"
  install -D "data/icons/gitso.ico" "$pkgdir/usr/share/gitso/gitso.ico"
}

# vim: set ts=2 sw=2 et:

