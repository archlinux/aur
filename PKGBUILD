# Maintainer: D. Can Celasun <dcelasun[at]gmail[dot]com>
# Contributor: Alessio Sergi <asergi at archlinux dot us>
# Contributor: Asa Marco <marcoasa90[at]gmail[.]com>
pkgname=kupfer
pkgver=208
pkgrel=9
pkgdesc="Launcher application written in python. Similar to Gnome-Do / Launchy"
arch=('i686' 'x86_64')
url="http://engla.github.com/kupfer/"
license=('GPL3')
depends=('desktop-file-utils' 'hicolor-icon-theme' 'pygtk'
         'python2-dbus' 'python2-gobject2' 'python2-keybinder2' 'python2-xdg' 'python2-gconf')
makedepends=('intltool' 'python2-docutils')
optdepends=('gnome-python-desktop: GNOME integration'
            'python2-gdata: Google services support'
            'python2-gnomekeyring: GNOME keyring support'
            'python2-setproctitle: set process name'
            'python2-wnck: tracks running applications'
            'python-appindicator: Ubuntu-style notification icon'
            'python2-keyring: GNOME keyring support')
install=$pkgname.install
source=("https://github.com/engla/$pkgname/archive/v${pkgver}.tar.gz"
        "settings.patch")
sha1sums=('95c9e2b5da02c426817746c42b3d72d85e9ed0ed'
          '0c64ffe7889a1565e2427d9183cb607764753912')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  
  # LP bug #841867
  patch -Np1 -i "${srcdir}/settings.patch"
  
  # python2 fix
  sed -i -e 's_#![ ]*.*python$_&2_' {waf,{auxdata/,}wscript,$(find . -name "*.py")}

  # fix man page generation
  sed -i 's_rst2man_&2_Ig' wscript

  export PYTHON="/usr/bin/python2"
  ./waf configure --prefix=/usr \
                  --no-update-mime \
                  --no-update-icon-cache
  ./waf

}

package() {
  cd "$srcdir/$pkgname-$pkgver"

 ./waf install -f --destdir="$pkgdir"
}




