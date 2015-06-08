# $Id$
# Maintainer: Daniel Isenmann <daniel@archlinux.org>
# Contributor: Rashif "Don Ray" Rahman <rayrashif@gmail.com>

pkgbase=wicd-git
pkgname=('wicd-git' 'wicd-gtk-git')
pkgver=0c205a
pkgrel=1
arch=(any)
url="https://launchpad.net/wicd/"
license=('GPL2')
install=wicd.install
source=(git+git://github.com/johnboiles/wicd.git
        wicd.desktop
        wicd-1.7.3-urwid-1.3.0.patch)
md5sums=('SKIP'
         '326df163a5732d38741371baa4fce9e5'
         'f7e6085e482f37f2b8529326c21cbbbf')
makedepends=('python2' 'python2-babel' 'python2-setuptools' 'gettext' 'dbus-glib' 'dhcpcd' 
             'ethtool' 'inetutils' 'net-tools' 'pygtk' 'python2-dbus' 'python2-gobject2' 
             'python2-urwid' 'rfkill' 'shared-mime-info' 'wireless_tools' 'wpa_supplicant'
             'hicolor-icon-theme')
options=('emptydirs')

pkgver() {
	cd wicd
	git describe --always | tr "-" "." | cut -c2-
}
prepare() {
  cd wicd

  find . -type f -exec sed -i 's@#!/usr.*python@#!/usr/bin/python2@' {} \;
  sed -i 's/pybabel/pybabel2/g' setup.py 
  export PYTHON=python2
  
  sed -i 's|/usr/sbin/|/usr/bin/|' other/wicd.service
  patch -Np0 -i "$srcdir/wicd-1.7.3-urwid-1.3.0.patch"
}

build() {
  cd wicd
  python2 setup.py configure \
      --no-install-init \
      --resume=/usr/share/wicd/scripts/ \
      --suspend=/usr/share/wicd/scripts/ \
      --verbose \
      --python=/usr/bin/python2 \
      --lib=/usr/lib \
      --sbin=/usr/bin \
      --no-install-gnome-shell-extensions \
	  --systemd=/usr/lib/systemd/system
  python2 setup.py build
  python2 setup.py compile_translations
  
  #HACK for https://bugs.launchpad.net/wicd/+bug/928589
  mkdir -p translations/ast/LC_MESSAGES
  msgfmt po/ast.po -o translations/ast/LC_MESSAGES/wicd.mo
}

package_wicd-git() {
  pkgdesc="Wired and wireless network manager for Linux"
  depends=('python2' 'python2-dbus' 'dhcpcd' 'wpa_supplicant' 'wireless_tools'
           'inetutils' 'net-tools' 'ethtool' 'shared-mime-info' 'python2-urwid' 'python2-gobject2' 'dbus-glib' 'rfkill')
  optdepends=('wicd-gtk: needed if you want the GTK interface')
  provides=("wicd")
  conflicts=("wicd")
  backup=('etc/wicd/encryption/templates/active')
  install=wicd.install  

  cd wicd
  python2 setup.py install --skip-build --optimize=1 --root="$pkgdir"

  cd build/lib/wicd
  for i in *.py; do
    install -Dm 755 $i "$pkgdir/usr/lib/wicd/$i"
  done
  
  rm -rf "$pkgdir"/usr/share/autostart

  #deleting the GTK stuff
  rm -rf "$pkgdir"/etc/xdg
  rm -f "$pkgdir"/usr/bin/{wicd-client,wicd-gtk}
  rm -rf "$pkgdir"/usr/share/{applications,icons,pixmaps}
  rm -rf "$pkgdir"/usr/share/wicd/{gtk,icons}  
}

package_wicd-gtk-git() {
  provides=("wicd-gtk")
  conflicts=("wicd-gtk")
  pkgdesc="Wired and wireless network manager for Linux - GTK client"
  depends=('wicd' 'pygtk' 'hicolor-icon-theme')
  optdepends=('gksu: needed to access some preferences in gtk interface'
              'notification-daemon: needed if you want notifications'
              'python2-notify:	needed if you want notifications')
  install=wicd-gtk.install 

  cd wicd
  python2 setup.py install --skip-build --optimize=1 --root="$pkgdir"

  install -Dm644 "$srcdir/wicd.desktop" "$pkgdir/usr/share/applications/wicd.desktop"

  cd build/lib/wicd
  for i in *.py; do
    install -Dm 755 $i "$pkgdir"/usr/lib/wicd/$i
  done
  
  #deleting the core dirs which exists in wicd
  rm -rf "$pkgdir"/etc/{wicd,dbus-1,rc.d,logrotate.d}
  rm -rf "$pkgdir"/usr/lib
  rm -rf "$pkgdir"/usr/share/{man,doc,locale,wicd/curses,wicd/daemon,wicd/backends,wicd/scripts,wicd/cli}
  rm -rf "$pkgdir"/var
  rm -f "$pkgdir"/usr/bin/{wicd,wicd-curses,wicd-cli}

  rm -rf "$pkgdir"/usr/share/autostart
  rm -rf "$pkgdir"/usr/share/dbus-1
}
