# Contributor: Johannes Dewender  arch at JonnyJD dot net
# Contributor: iosonofabio Fabio Zanini <fabio.zanini@fastmail.fm>
# Contributor: Javier ‘Phrodo_00‘ Aravena <phrodo.00@gmail.com>
pkgname=bzr-gtk-gtk2
_pkgname=bzr-gtk
pkgver=0.100.0
pkgrel=1
pkgdesc="Plugin for Bazaar that aims to provide GTK+ interfaces to most Bazaar operations."
arch=('any')
url="http://bazaar-vcs.org/bzr-gtk"
license=('GPL')
conflicts=('bzr-gtk<=0.100.0')	# due to credits.pickle, newer doesn't have it
depends=('pygtk' 'bzr' 'pycairo' 'libglade')
source=("https://launchpad.net/bzr-gtk/gtk2/${pkgver}/+download/${_pkgname}-${pkgver}.tar.gz"
	bzr_handle_patch_open_display.patch bzr_notify_open_display.patch
	gtk2-package.patch
)
md5sums=('a7c2f27072bcacdcf8983ca6a2426dbd'
         '384f7ad2131b581342566fa78d041c85'
         '3aaf3786033d97f488425aa718d7d314'
         '30c96c3c17513a196a3d6a197db3e1ba')

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  # Correct open_display bug
  patch <"${startdir}/bzr_notify_open_display.patch"
  patch <"${startdir}/bzr_handle_patch_open_display.patch"

  # package as bzrlib.plugins.gtk2 (and don't conflict with bzr-gtk
  patch -p0 < ../gtk2-package.patch

  # Replace python with python2
  for file in $(find ./ -name '*.py' -print); do
      sed -i 's_^#!.*/usr/bin/python_#!/usr/bin/python2_' $file
      sed -i 's_^#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' $file
  done

}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python2 setup.py install --skip-build --root="${pkgdir}"
}
