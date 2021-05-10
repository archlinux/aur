# Maintainer:
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Adrien Sohier <adrien.sohier@art-software.fr

pkgbase=wicd-git
pkgname=('wicd-git' 'wicd-gtk-git')
pkgver=r1472.c6f801a
pkgrel=1
arch=('x86_64')
url="http://wicd.sourceforge.net/"
license=('GPL2')
depends=('python2' 'python2-dbus' 'dhcpcd' 'wpa_supplicant' 'wireless_tools' 'pm-utils'
         'inetutils' 'net-tools' 'ethtool' 'shared-mime-info' 'python2-urwid' 'python2-gobject2' 'dbus-glib' 'rfkill')
makedepends=('git' 'python2-babel' 'python2-setuptools' 'gettext' 'pygtk')
optdepends=('wicd-client-kde: needed if you want to use kde ui')
source=(git+https://github.com/johnboiles/wicd.git
        wicd.desktop
        wicd-1.7.3-urwid-1.3.0.patch)
options=('emptydirs')
backup=('etc/wicd/encryption/templates/active')
sha512sums=('SKIP'
            '48ea8e732eb661888288fd7bd9aacddea71cb8bdeea5dbc9a4c31cdddb38e7e1e5bc64ce98b9b6f248f6b416582fc64d173da64d79d0a109ca610e08635013fa'
            '48183d805b096c4a1857990d1d9a709544406ee93607f96d4eaf46e4f7729a73e0178251f1168aa516c38bba727821c70a9104de84ca5b4288f91219dfeed2e9')

pkgver() {
  cd $srcdir/wicd
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $srcdir/wicd

  find . -type f -exec sed -i 's@#!/usr.*python@#!/usr/bin/python2@' {} \;
  export PYTHON=python2
  
  sed -i 's|/usr/sbin/|/usr/bin/|' other/wicd.service
  sed -i 's|pybabel|pybabel2|' setup.py

  patch -Np0 -i "$srcdir/wicd-1.7.3-urwid-1.3.0.patch"
}

build() {
  cd $srcdir/wicd

  python2 setup.py configure --no-install-init \
			     --no-install-gnome-shell-extensions \
			     --distro=arch \
                             --resume=/usr/share/wicd/scripts/ \
                             --suspend=/usr/share/wicd/scripts/ \
                             --verbose \
                             --python=/usr/bin/python2 \
                             --lib=/usr/lib \
                             --sbin=/usr/bin \
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

  cd $srcdir/wicd
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
  rm -rf "$pkgdir"/opt/kde/share/autostart/wicd-tray.desktop
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

  cd $srcdir/wicd
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
