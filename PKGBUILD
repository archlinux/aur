# Maintainer: Alexander Rødseth <rodseth@gmail.com>

pkgname=netsurf-git
pkgver=20120924
pkgrel=1
pkgdesc='Lightweight and fast web browser'
arch=('x86_64' 'i686')
url='http://www.netsurf-browser.org/'
license=('GPL2')
depends=('libmng' 'libglade' 'lcms' 'librsvg' 'lemon' 'cairo'
         'desktop-file-utils')
makedepends=('re2c' 'curl' 'libnsbmp' 'libnsgif' 'libcss' 'libhubbub-git'
             'libparserutils' 'libdom-git>=20120924' 'netsurf-buildsystem-git'
             'gendesk' 'nsgenbind')
provides=('netsurf')
conflicts=('netsurf')
replaces=('netsurf-svn')
install=$pkgname.install
source=("$pkgname.png::http://ubuntu.allmyapps.com/data/n/e/netsurf-netsurf-web-browser/icon_48x48_netsurf.png"
        'netsurf::git://git.netsurf-browser.org/netsurf.git')
sha256sums=('f0dbcc5d80bf03d706aa8b28a322aa7f169a40813848c2d1505691f6e2c7ef00'
            'SKIP')

pkgver() {
  cd "${pkgname%-git}"

  git describe --always | sed 's|-|.|g'
}

prepare() {
  cd "${pkgname%-git}"

  # Patching
  sed -i 's:LOG((\"\[://:g' desktop/netsurf.c

  # Creating wrapperscript
  echo "#!/bin/sh" > netsurf.sh
  echo "NETSURFRES=/usr/share/netsurf/res /usr/bin/nsgtk \$*" >> netsurf.sh

  # Desktop shortcut
  gendesk -n --pkgname "$pkgname" --pkgdesc "$pkgdesc" \
    --name 'Netsurf' --exec 'netsurf %U'
}

build() {
  cd "${pkgname%-git}"

  make NSSHARED='/usr/share/netsurf-buildsystem' PREFIX=/usr
}

package() {
  cd "${pkgname%-git}"

  # Executables
  install -d "$pkgdir/usr/bin"
  install nsgtk "$pkgdir/usr/bin"
  install -Dm755 netsurf.sh "$pkgdir/usr/bin/netsurf"
  install -d "$pkgdir/usr/bin" "$pkgdir/usr/share/netsurf"

  # Resources
  rm -rf gtk/res/.svn gtk/res/docs/.svn
  cp -RL gtk/res "$pkgdir/usr/share/netsurf"

  # Application shortcut and icon
  install -Dm644 "$pkgname.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "../$pkgname.png" \
    "$pkgdir/usr/share/pixmaps/$pkgname.png"

  # Cleanup
  find "$pkgdir" -name ".svn" -print0 | xargs -0 rm -rf
}

# vim:set ts=2 sw=2 et:
