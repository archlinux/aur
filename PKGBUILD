# Maintainer: Kevin MacMartin <prurigro@gmail.com>

_pkgname=deskcon-desktop
pkgname=$_pkgname-git
pkgver=20150501.r93.ca6fcf4
pkgrel=1
pkgdesc='Integrates your Smartphone in your Desktop'
url='https://github.com/MK-42/deskcon-desktop'
license=('GPL3')
arch=('any')
depends=('python2-pyopenssl' 'python2-gobject' 'python2-dbus' 'pygtk' 'libnotify' 'dbus-glib')
optdepends=('gnome-shell: for use of the included Gnome 3 desktop extension')
makedepends=('git')
options=('!strip')
install=$_pkgname.install
source=("git+$url"
        'deskcon.1')
sha512sums=('SKIP'
            '144e9a15a01fc63694fa5d26c819ca2474a6cdad802ec1ab984a049b474c4db2419b25ad52f03eb4c2e702524bb0ef6c746fd0436014d8291a83e1e2f4836d2f')

pkgver() {
  cd $_pkgname
  printf "%s.r%s.%s" "$(git show -s --format=%ci master | sed 's/\ .*//g;s/-//g')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $_pkgname
  sed -i 's|"3.14"$|"3.14", "3.16"|' gnome-shell/deskcon@screenfreeze.net/metadata.json
}

package() {
  # FOLDER TO INSTALL THE PYTHON FILES
  _installdir='/usr/share/deskcon-server'

  # INSTALL THE MANPAGE
  install -Dm644 deskcon.1 "$pkgdir/usr/share/man/man1/deskcon.1"

  # INSTALLY THE PYTHON FILES
  cd $_pkgname
  install -d "$pkgdir/usr/"{bin,share/gnome-shell/extensions}
  cp -r --no-preserve=ownership gnome-shell/deskcon@screenfreeze.net "$pkgdir/usr/share/gnome-shell/extensions/"
  cd server
  for file in *; do
      [[ -f "$file" ]] \
        && install -D "$file" "$pkgdir$_installdir/$file"
  done
  cp -r --no-preserve=ownership share "$pkgdir$_installdir/"

  # CREATE THE LAUNCH SCRIPTS
  printf '%s\n\n%s\n%s\n' \
    '#!/usr/bin/env bash' "cd $_installdir" 'python2 settingswindow.py "$@"' \
      > "$pkgdir/usr/bin/deskcon-server-settings"
  printf '%s\n\n%s\n%s\n' \
    '#!/usr/bin/env bash' "cd $_installdir" 'python2 setupdevice.py' \
      > "$pkgdir/usr/bin/deskcon-setupdevice"
  printf '%s\n\n%s\n%s\n' \
    '#!/usr/bin/env bash' "cd $_installdir" 'python2 deskcon-server &' \
      > "$pkgdir/usr/bin/deskcon-server"

  # MAKE THE LAUNCH SCRIPTS EXECUTABLE
  chmod 755 "$pkgdir/usr/bin/deskcon-"{server,server-settings,setupdevice}
}
