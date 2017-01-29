# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=polychromatic-git
pkgver=0.3.6.1.r0.gf324b50
pkgrel=1
pkgdesc='A graphical front end for managing Razer peripherals under GNU/Linux.'
arch=('any')
license=('GPL2')
source=("git+https://github.com/lah7/polychromatic.git")
url='https://github.com/lah7/polychromatic'
makedepends=('git' 'rsync')
depends=('python' 'hicolor-icon-theme' 'python-razer' 'webkit2gtk')
provides=('polychromatic')
conflicts=('polychromatic')
md5sums=('SKIP')

pkgver() {
  cd $srcdir/polychromatic
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {  
  _pythondir=$(python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())")

  cd $srcdir/polychromatic

  mkdir -p $pkgdir/etc/xdg/autostart
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/share/polychromatic
  mkdir -p $pkgdir/usr/share/icons/hicolor/scalable/apps
  mkdir -p $pkgdir/usr/share/locale
  mkdir -p $pkgdir/usr/share/applications
  mkdir -p $pkgdir/$_pythondir/polychromatic
  
  ### Modified parts from script in install/install.sh
  # Copy bin files.
  cp polychromatic-controller $pkgdir/usr/bin
  cp polychromatic-tray-applet $pkgdir/usr/bin
  chmod +x $pkgdir/usr/bin/polychromatic-controller
  chmod +x $pkgdir/usr/bin/polychromatic-tray-applet

  # Copy data files.
  cp -r data/* $pkgdir/usr/share/polychromatic

  # Copy Python modules
  cp -r pylib/* $pkgdir/$_pythondir/polychromatic

  # Copy icons
  cp install/hicolor/scalable/apps/polychromatic.svg $pkgdir/usr/share/icons/hicolor/scalable/apps/polychromatic.svg

  # Copy locales
  rsync -rlpt --exclude="polychromatic-controller.pot" --exclude="polychromatic-tray-applet.pot" --exclude=*.po "locale/" $pkgdir/usr/share/locale

  # Copy desktop launchers
  cp "install/polychromatic-controller.desktop" $pkgdir/usr/share/applications
  cp "install/polychromatic-tray-applet.desktop" $pkgdir/usr/share/applications

  # Create an autostart entry for tray applet.
  cp "install/polychromatic-tray-applet.desktop" $pkgdir/etc/xdg/autostart
}

# vim:set ts=2 sw=2 et:
