# Maintainer: Luca Weiss <aur (at) lucaweiss (dot) eu>
# Contributor: Frederik Schwan <freswa at archlinux dot org>
# Contributor: Christian Rebischke <chris.rebischke@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: Jonathan Wiersma <archaur at jonw dot org>

_pkgbase=virt-manager
pkgbase=$_pkgbase-git
pkgname=(virt-install-git virt-manager-git)
pkgver=4.1.0.r448.gf211e1a56
pkgrel=1
arch=('any')
url='https://virt-manager.org/'
license=('GPL')
makedepends=('git' 'meson' 'ninja' 'gtk-update-icon-cache' 'python-cairo' 'python-docutils')
source=("git+https://github.com/virt-manager/virt-manager.git")
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgbase"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson "$_pkgbase" build -Dtests=disabled
  meson compile -C build
}

package_virt-install-git() {
  pkgdesc='Command line tool for creating new KVM , Xen, or Linux container guests using the libvirt hypervisor'
  depends=('libosinfo' 'libvirt-python' 'python-gobject' 'python-requests' 'cpio' 'libisoburn')
  provides=('virt-install')
  conflicts=('virt-install')

  meson install -C build --destdir "$pkgdir"

  # Split virt-manager
  [[ -d "${srcdir}"/virt-manager ]] && rm -r "${srcdir}"/virt-manager/
  mkdir -p "${srcdir}"/split/usr/{bin,share/{man/man1,virt-manager}}
  mv "${pkgdir}"/usr/bin/virt-manager "${srcdir}"/split/usr/bin/
  mv "${pkgdir}"/usr/share/{applications,glib-2.0,icons,metainfo} "${srcdir}"/split/usr/share/
  mv "${pkgdir}"/usr/share/man/man1/virt-manager.1 "${srcdir}"/split/usr/share/man/man1/
  mv "${pkgdir}"/usr/share/virt-manager/{icons,ui,virtManager} "${srcdir}"/split/usr/share/virt-manager/
}

package_virt-manager-git() {
  pkgdesc="Desktop user interface for managing virtual machines"
  depends=("virt-install-git=${pkgver}" 'gtk-vnc' 'libvirt-glib' 'spice-gtk' 'vte3' 'python-cairo' 'gtksourceview4')
  provides=('virt-manager')
  conflicts=('virt-manager')

  mv -v split/* "${pkgdir}/"
}
