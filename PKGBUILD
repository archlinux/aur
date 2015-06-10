# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Chris Giles <Chris.G.27 (at) Gmail.com>
# Contributor: fernando < arch at liquuid dot net>
# Contributor: Juan Pablo GonzÃ¡lez Tognarelli <lord_jotape@yahoo.com.ar>

pkgname=startupmanager
pkgver=1.9.13
pkgrel=6
pkgdesc='GUI app for changing the settings of GRUB, GRUB2, Usplash and Splashy'
arch=('any')
url='http://sourceforge.net/projects/startup-manager/'
license=('MIT')
depends=('gnome-python' 'imagemagick' 'yelp' 'python2' 'xorg-xrandr')
makedepends=('intltool' 'setconf')
source=("http://downloads.sourceforge.net/sourceforge/startup-manager/${pkgname}_${pkgver}.tar.gz")
sha256sums=('f51f8a64080759e3d3af58cfbae1769b8e3db8c65a2d9bd2ba80a7e6e7489a2d')

#
# TIP: bug-workaround: If you have problems with resolution-detection when starting
# startupmanager, try changing line 159 in /usr/lib/python2.7/site-packages/bootconfig/utils.py to:
#
# try:
#     return matches.group(1) + 'x' + matches.group(2)
# except:
#     return "640x480"
# 
# Where "640x480" is just an example (but should make it work)
#

prepare() {
  cd "$pkgname-$pkgver"

  # Help the startup script find python2
  sed -i 's:env python:env python2:' startupmanager

  # /usr/bin instead of /usr/sbin
  sed -i 's:sbin:bin:' setup.py

  # Set the GRUB2 related paths correctly
  setconf bootconfig/grub.py self.update_grub_command \'/usr/bin/grub-mkconfig\'
  setconf bootconfig/grub.py self.grub_install_command \'/usr/bin/grub-install\'
}

package() {
  cd "$pkgname-$pkgver"

  python2 setup.py install --prefix="$pkgdir/usr/"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
