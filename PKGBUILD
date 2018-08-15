# $Id$
# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=python-matplotlib-git

pkgver=r26679.b9b02f189
pkgrel=1
pkgdesc="A python plotting library for making publication quality plots, master git branch"
arch=('i686' 'x86_64')
url='http://matplotlib.org'
license=('custom')
checkdepends=('python-nose' 'python-mock' 'xorg-server-xvfb'
              'texlive-core' 'texlive-latexextra' 'imagemagick' 'ffmpeg' 'mencoder' 'inkscape'
              'python-pycodestyle' 'python-pandas' )
makedepends=('rsync' 'git' 'python-pytz' 'python-numpy'
             'tk' 'python-cairocffi' 'python-dateutil'
             'python-gobject' 'python-pyparsing'
             'pygtk' 'python-six' 'ghostscript' 'texlive-bin'
             'python-tornado' 'gtk3' 'wxpython' 'python-pyqt5' 
             'libxkbcommon-x11' 'python-pillow'  'python-setuptools'
             'python-cycler')
source=("git+git://github.com/matplotlib/matplotlib.git#branch=master" setup.cfg)
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
             -e "s|^#!.*/usr/bin/env *python|#!/usr/bin/env python3|" ${file}
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
   python3 setup.py build
}

check() {
   cd "$srcdir"/matplotlib-test
   python3 setup.py build

   cd "$srcdir"/matplotlib-test
   (
     export PYTHONPATH="$PWD/build/lib.linux-$CARCH-3.5:$PYTHONPATH"
     python -c "from matplotlib import font_manager"
     rm -rf ../tmp_test_dir && mkdir ../tmp_test_dir && cd ../tmp_test_dir
     xvfb-run -a -s "+extension GLX +extension RANDR +render -screen 0 1280x1024x24" \
       python ../matplotlib/tests.py -sv --processes=8 --process-timeout=300 || warning "Tests failed"
   )
}

package() {
   depends=('python-pytz' 'python-numpy' 'python-pyqt5' 'python-dateutil' 'python-pyparsing' 'python-cycler' 'libxkbcommon-x11')
   optdepends=('python-gobject: for GTK3Agg/GTK3Cairo backend'
               'python-cairocffi: for GTK3Agg/GTK3Cairo backend'
               'python-pyqt4: for Qt4Agg backend'
               'tk: used by the TkAgg backend'
               'ghostscript: usetex dependencies'
               'texlive-bin: usetex dependencies'
               'python-tornado: for webagg backend'
               'python-pillow: for reading/saving .jpg/bmp/tiff files')
   provides=('python-matplotlib')
   conflicts=('python-matplotlib' 'python-matplotlib2')

   cd matplotlib
   python3 setup.py install -O1 --skip-build --root "${pkgdir}" --prefix=/usr

   install -dm755 "${pkgdir}"/usr/share/licenses/python-matplotlib
   install -m 644 doc/users/license.rst "${pkgdir}"/usr/share/licenses/python-matplotlib
}
