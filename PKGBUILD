# $Id$
# Maintainer: Dylan Delgado <dylan1496@live.com>
# Contributor: Grey Christoforo <first name [at] last name [dot] net>

pkgname=python-matplotlib-git

pkgver=r49602.5e34777719
pkgrel=1
pkgdesc="A python plotting library for making publication quality plots, master git branch"
arch=('i686' 'x86_64')
url='http://matplotlib.org'
license=('custom')
checkdepends=('python-mock' 'xorg-server-xvfb'
              'texlive-core' 'texlive-latexextra' 'imagemagick' 'ffmpeg' 'mencoder' 'inkscape'
              'python-pycodestyle' 'python-pandas' )
makedepends=('rsync' 'git' 'python-pytz' 'python-numpy'
             'tk' 'python-cairocffi' 'python-dateutil'
             'python-gobject' 'python-pyparsing'
             'pygtk' 'python-six' 'ghostscript' 'texlive-bin'
             'python-tornado' 'gtk3' 'python-wxpython' 'python-pyqt5' 
             'libxkbcommon-x11' 'python-pillow'  'python-setuptools'
             'python-cycler' "pybind11" 'python-build' 'python-installer' 'python-wheel' 'meson-python')
source=("git+https://github.com/matplotlib/matplotlib.git#branch=main" setup.cfg)
md5sums=('SKIP'
         '5fa7d3c374ec049e3ed592ddff0111be')

pkgver() {
   cd "${srcdir}/matplotlib"
   printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
   cd "$srcdir"/matplotlib
   for file in $(find . -name '*.py' -print); do
      sed -i -e "s|^#!.*/usr/bin/python|#!/usr/bin/python3|" \
             -e "s|^#!.*/usr/bin/env *python|#!/usr/bin/env python|" ${file}
   done

   rsync -a "$srcdir"/matplotlib/  "$srcdir"/matplotlib-test --exclude '.git'

   # Remove tests (FS#48175)
   cp "$srcdir/setup.cfg" "$srcdir"/matplotlib/
}

build() {
   # this seems to need to be present or gtk/gdk dies
   # and hangs the build checking if gtk3cairo is installed
   export XDG_RUNTIME_DIR=/tmp

   cd "$srcdir"/matplotlib
   python -m build --wheel --no-isolation
}

check() {
   cd "$srcdir"/matplotlib

   pytest
}

package() {
   depends=('python-kiwisolver' 'python-pytz' 'python-numpy' 'python-pyqt5' 'python-dateutil' 'python-pyparsing' 'python-cycler' 'libxkbcommon-x11')
   optdepends=('python-gobject: for GTK3Agg/GTK3Cairo backend'
               'python-cairocffi: for GTK3Agg/GTK3Cairo backend'
               'tk: used by the TkAgg backend'
               'ghostscript: usetex dependencies'
               'texlive-bin: usetex dependencies'
               'python-tornado: for webagg backend'
               'python-pillow: for reading/saving .jpg/bmp/tiff files')
   provides=('python-matplotlib')
   conflicts=('python-matplotlib' 'python-matplotlib2')

   cd matplotlib
   python -m installer --destdir="$pkgdir" dist/*.whl

   install -dm755 "${pkgdir}"/usr/share/licenses/python-matplotlib
   install -m 644 doc/project/license.rst "${pkgdir}"/usr/share/licenses/python-matplotlib
}
