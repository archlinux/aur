# Contributor: Johannes Dewender  arch at JonnyJD dot net
# Contributor: iosonofabio Fabio Zanini <fabio.zanini@fastmail.fm>
# Contributor: Javier ‘Phrodo_00‘ Aravena <phrodo.00@gmail.com>
pkgname=bzr-gtk
pkgver=0.104.0
pkgrel=1
pkgdesc="Plugin for Bazaar that aims to provide GTK+ interfaces to most Bazaar operations."
arch=('any')
url="http://bazaar-vcs.org/bzr-gtk"
license=('GPL')
depends=('python2>=2.4' 'python2-gobject2' 'bzr>=2' 'bzr<3')
optdepends=(
    'python2-cairo: Graphs in the visualisation tool'
    'pygtksourceview2: Syntax-highlighted diffs'
    'python2-nautilus: Nautilus integration'
    # 'pywin32: Olive'
)
#makedepends=('bzr-stats')	# currently not; build_credits disabled
source=("https://launchpad.net/bzr-gtk/gtk3/${pkgver}/+download/${pkgname}-${pkgver}.tar.gz"
	no_credits.patch)
md5sums=('5e6694b57662c338d5eb2d85d4cd2357'
         'c85a317ac3129c24bac710ce71afc4e7')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p0 < ../no_credits.patch
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Replace python with python2
  for file in $(find ./ -name '*.py' -print); do
      sed -i 's_^#!.*/usr/bin/python_#!/usr/bin/python2_' $file
      sed -i 's_^#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' $file
  done
  python2 setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 setup.py install --skip-build --root="${pkgdir}"
}
