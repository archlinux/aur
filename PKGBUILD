# $Id: PKGBUILD 230411 2015-02-04 01:50:30Z angvp $
# Maintainer: Daniel Isenmann <daniel@archlinux.org>
# Contributor: Rashif "Don Ray" Rahman <rayrashif@gmail.com>

pkgbase='wicd'
pkgname='wicd-patched'
pkgver=1.7.3
pkgrel=1
arch=(any)
url="https://launchpad.net/wicd/"
license=('GPL2')
provides=('wicd')
replaces=('wicd')
conflicts=('wicd' 'wicd-svn')
pkgdesc="Wired and wireless network manager for Linux. Include patches that fix wicd-curses bugs."
depends=('python2' 'python2-dbus' 'dhcpcd' 'wpa_supplicant' 'wireless_tools'
         'inetutils' 'net-tools' 'ethtool' 'shared-mime-info' 'python2-urwid' 'python2-gobject2' 'dbus-glib' 'rfkill')
optdepends=('wicd-gtk: needed if you want the GTK interface')
backup=('etc/wicd/encryption/templates/active')
install=wicd.install  

source=(http://launchpad.net/wicd/1.7/$pkgver/+download/wicd-$pkgver.tar.gz
        wicd-1.7.3-urwid-1.3.0.patch
        wicd-1421918.patch
        curses_bitrate_fix.patch)
md5sums=('162ca2e6f4ab903bb7ab2bc0adb7d1aa'
         'f7e6085e482f37f2b8529326c21cbbbf'
         'd1568f48d63103df962b5b502d0ad0de'
         'a907075f648a0e8d91c0ce6898e973b5')
makedepends=('python2' 'python2-babel' 'python2-setuptools' 'gettext' 'dbus-glib' 'dhcpcd' 
             'ethtool' 'inetutils' 'net-tools' 'python2-dbus' 'python2-gobject2' 
             'python2-urwid' 'rfkill' 'shared-mime-info' 'wireless_tools' 'wpa_supplicant'
             'hicolor-icon-theme')
options=('emptydirs')

prepare() {
  cd $pkgbase-$pkgver

  find . -type f -exec sed -i 's@#!/usr.*python@#!/usr/bin/python2@' {} \;
  sed -i 's/pybabel/pybabel2/g' setup.py 
  export PYTHON=python2
  
  sed -i 's|/usr/sbin/|/usr/bin/|' other/wicd.service
  patch -Np0 -i "$srcdir/wicd-1.7.3-urwid-1.3.0.patch"
  patch -Np0 -i "$srcdir/wicd-1421918.patch"
  patch -Np0 -i "$srcdir/curses_bitrate_fix.patch"
}

build() {
  cd $pkgbase-$pkgver
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

package() {
  cd $pkgbase-$pkgver
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
