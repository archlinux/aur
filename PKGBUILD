# Contributor: Javier ‘Phrodo_00‘ Aravena <phrodo.00@gmail.com>
# Mantainer: iosonofabio Fabio Zanini <fabio.zanini@fastmail.fm>
pkgname=bzr-gtk
pkgver=0.100.0
pkgrel=2
pkgdesc="Plugin for Bazaar that aims to provide GTK+ interfaces to most Bazaar operations."
arch=('i686' 'x86_64')
url="http://bazaar-vcs.org/bzr-gtk"
license=('GPL')
depends=('pygtk' 'bzr' 'pycairo' 'libglade')
source=("https://launchpad.net/bzr-gtk/gtk2/${pkgver}/+download/${pkgname}-${pkgver}.tar.gz")
md5sums=('a7c2f27072bcacdcf8983ca6a2426dbd')

source+=(bzr_handle_patch_open_display.patch bzr_notify_open_display.patch)
md5sums+=(
  '384f7ad2131b581342566fa78d041c85'
  '3aaf3786033d97f488425aa718d7d314'
)

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Replace python with python2
  for file in $(find ./ -name '*.py' -print); do
      sed -i 's_^#!.*/usr/bin/python_#!/usr/bin/python2_' $file
      sed -i 's_^#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' $file
  done

  # Correct open_display bug
  patch <"${startdir}/bzr_notify_open_display.patch"
  patch <"${startdir}/bzr_handle_patch_open_display.patch"
  

  cd "${startdir}/src/${pkgname}-${pkgver}/"
  python2 setup.py install --prefix'=/usr' --root="${startdir}/pkg" || return 1
}
