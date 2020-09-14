# $Id$
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: Jonathan Wiersma <archaur at jonw dot org>

_pkgbase=virt-manager
pkgbase=$_pkgbase-git
pkgname=(virt-install-git virt-manager-git)
pkgver=2.2.1.r702.ga8aec2da
pkgrel=1
pkgdesc="Console user interface for managing virtual machines"
arch=('any')
url="http://virt-manager.org/"
license=('GPL')
depends=('python-gobject' 'libvirt-glib' 'libvirt-python'
	 'python-requests' 'libosinfo')
makedepends=('git' 'intltool' 'python-cairo' 'python-docutils')
source=("git+https://github.com/virt-manager/virt-manager.git")
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgbase"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgbase"
  python setup.py build
}

package_virt-install-git() {
  provides=('virt-install')
  conflicts=('virt-install')
  cd "$srcdir/$_pkgbase"
  python setup.py --no-update-icon-cache --no-compile-schemas install --root "$pkgdir"
  python -m compileall "${pkgdir}/usr/share/virt-manager"
  python -O -m compileall "${pkgdir}/usr/share/virt-manager"
  rm "${pkgdir}/usr/bin/virt-manager"
}

package_virt-manager-git() {
  pkgdesc="Desktop user interface for managing virtual machines"
  depends=("virt-install-git=$pkgver" 'vte3' 'gtk-vnc' 'spice-gtk3' 'python-cairo')
  provides=('virt-manager')
  conflicts=('virt-manager')
  cd "$srcdir/$_pkgbase"
  install -Dm 755 build/virt-manager -t "${pkgdir}/usr/bin"
}
