# $Id$
# Original Community Repo
# =======================
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: Jonathan Wiersma <archaur at jonw dot org>

# Modificationt to use Git Master Source
# Maintainer: James Harvey <jamespharvey20@gmail.com>
#    * This PKGBUILD as closely as possible matches community's virt-manager 1.2.1-1
#    * All namcap warnings are identical, as of 1.2.1.r4564.466bf92

pkgbase=virt-manager-git
_pkgbase=virt-manager
pkgname=(virt-install-git virt-manager-git)
pkgver=1.4.0.r5022.7962672
pkgrel=1
pkgdesc="Console user interface for managing virtual machines"
arch=('any')
url="http://virt-manager.org/"
license=('GPL')
depends=('python2' 'libvirt-python' 'libxml2' 'libvirt'
	 'libosinfo' 'python2-ipaddr' 'python2-gobject' 'python2-requests')
makedepends=('intltool>=0.35.0'
	     'dbus-python' 'gtk-vnc' 'rarian'
	     'yajl' 'librsvg' 'libuser' 'python2-cairo'
	     'python2-ipy' 'newt-syrup' 'openbsd-netcat' 'x11-ssh-askpass'
	     'graphite' 'spice-gtk3'
	     'libvirt-glib' 'vte3' 'git')
source=("git+https://github.com/${_pkgbase}/${_pkgbase}")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgbase}"
  echo $(cat virtcli/cliconfig.py | grep '^__version__' | sed 's|^__version__ = "||' | sed 's|"$||').r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$srcdir/$_pkgbase"
  python2 setup.py build
}

package_virt-install-git() {
  conflicts=('virt-install')
  provides=('virt-install')

  cd "$srcdir/$_pkgbase"
  python2 setup.py --no-update-icon-cache --no-compile-schemas install --root "$pkgdir"
  python2 -m compileall "${pkgdir}/usr/share/virt-manager"
  python2 -O -m compileall "${pkgdir}/usr/share/virt-manager"
  rm "${pkgdir}/usr/bin/virt-manager"
}

package_virt-manager-git() {
  conflicts=('virt-manager')
  provides=('virt-manager')
  depends=('virt-install-git'
	    'python2' 'libvirt-python' 'libxml2' 'libvirt' 'python2-requests'
	    'dbus-python' 'gtk-vnc' 'rarian'
	    'yajl' 'librsvg' 'libuser' 'python2-cairo'
	    'python2-ipy' 'newt-syrup' 'openbsd-netcat' 'x11-ssh-askpass'
	    'graphite' 'spice-gtk3'
	    'libvirt-glib' 'vte3')
  cd "$srcdir/$_pkgbase"
  install -Dm 755 build/virt-manager -t "${pkgdir}/usr/bin"
}
