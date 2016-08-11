# $Id$
# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgbase=python-matplotlib-git
pkgname=('python2-matplotlib-git' 'python-matplotlib-git')

pkgver=1
pkgrel=1
pkgdesc="A python plotting library for making publication quality plots, master git branch"
arch=('i686' 'x86_64')
url='http://matplotlib.org'
license=('custom')
checkdepends=('python-nose' 'python2-nose' 'python-mock' 'python2-mock' 'xorg-server-xvfb'
              'texlive-core' 'texlive-latexextra' 'imagemagick' 'ffmpeg' 'mencoder' 'inkscape'
              'python-pycodestyle' 'python2-pycodestyle' 'python-pandas' 'python2-pandas')
makedepends=('rsync' 'git' 'python2-pytz' 'python2-numpy' 'python2-pyqt4' 'python-pytz' 'python-numpy'
             'python-pyqt4' 'tk' 'python-cairocffi' 'python2-cairocffi' 'python-dateutil'
             'python2-dateutil' 'python-gobject' 'python2-gobject' 'python-pyparsing'
             'python2-pyparsing' 'pygtk' 'python-six' 'ghostscript' 'texlive-bin'
             'python-tornado' 'python2-tornado' 'gtk3' 'wxpython' 'python-pyqt5' 'python2-pyqt5'
             'libxkbcommon-x11' 'python-pillow' 'python2-pillow' 'python-setuptools'
             'python2-setuptools' 'python-cycler' 'python2-cycler' 'python2-functools32')
source=("git+git://github.com/matplotlib/matplotlib.git#branch=master" setup.cfg)
md5sums=('SKIP'
         '5fa7d3c374ec049e3ed592ddff0111be')

pkgver() {
   cd "${srcdir}/matplotlib"
   printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
   rsync -a "$srcdir"/matplotlib/ "$srcdir"/matplotlib-py2 --exclude '.git'

   cd "$srcdir"/matplotlib
   for file in $(find . -name '*.py' -print); do
      sed -i -e "s|^#!.*/usr/bin/python|#!/usr/bin/python3|" \
             -e "s|^#!.*/usr/bin/env *python|#!/usr/bin/env python3|" ${file}
   done

   cd "$srcdir"/matplotlib-py2
   for file in $(find . -name '*.py' -print); do
      sed -i -e "s|^#!.*/usr/bin/python|#!/usr/bin/python2|" \
             -e "s|^#!.*/usr/bin/env *python|#!/usr/bin/env python2|" ${file}
   done

   rsync -a "$srcdir"/matplotlib/  "$srcdir"/matplotlib-test --exclude '.git'
   cp -a "$srcdir"/matplotlib-py2{,-test}

   # Remove tests (FS#48175)
   cp "$srcdir/setup.cfg" "$srcdir"/matplotlib/
   cp "$srcdir/setup.cfg" "$srcdir"/matplotlib-py2/
}

build() {
   # this seems to need to be present or gtk/gdk dies
   # and hangs the build checking if gtk3cairo is installed
   export XDG_RUNTIME_DIR=/tmp

   cd "$srcdir"/matplotlib
   python3 setup.py build

   cd "$srcdir"/matplotlib-py2
   python2 setup.py build
}

check() {
   cd "$srcdir"/matplotlib-test
   python3 setup.py build

   cd "$srcdir"/matplotlib-py2-test
   python2 setup.py build

   cd "$srcdir"/matplotlib-test
   (
     export PYTHONPATH="$PWD/build/lib.linux-$CARCH-3.5:$PYTHONPATH"
     python -c "from matplotlib import font_manager"
     rm -rf ../tmp_test_dir && mkdir ../tmp_test_dir && cd ../tmp_test_dir
     xvfb-run -a -s "+extension GLX +extension RANDR +render -screen 0 1280x1024x24" \
       python ../matplotlib/tests.py -sv --processes=8 --process-timeout=300 || warning "Tests failed"
   )

   cd "$srcdir"/matplotlib-py2-test
   (
     export PYTHONPATH="$PWD/build/lib.linux-$CARCH-2.7:$PYTHONPATH"
     python2 -c "from matplotlib import font_manager"
     rm -rf ../tmp_test_dir && mkdir ../tmp_test_dir && cd ../tmp_test_dir
     xvfb-run -a -s "+extension GLX +extension RANDR +render -screen 0 1280x1024x24" \
       python2 ../matplotlib-py2/tests.py -sv --processes=8 --process-timeout=300 || warning "Tests failed"
   )
}

package_python2-matplotlib-git() {
   depends=('python2-pytz' 'python2-numpy' 'python2-pyqt5' 'python2-dateutil' 'python2-pyparsing' 'python2-cycler' 'libxkbcommon-x11')
   optdepends=('pygtk: for GTK/GTKAgg/GTKCairo backend'
               'python2-cairo: for GTKCairo/GTK3Cairo backend'
               'python2-cairocffi: for GTKCairo/GTK3Cairo backend (alternative to python2-cairo)'
               'python2-pyqt4: for Qt4Agg backend'
               'tk: used by the TkAgg backend'
               'ghostscript: usetex dependencies'
               'texlive-bin: usetex dependencies'
               'python2-tornado: for webagg backend'
               'python2-gobject: for GTK3Agg/GTK3Cairo backend'
               'wxpython: for WX/WXAgg backend'
               'python2-pillow: for reading/saving .jpg/bmp/tiff files')
   provides=('python2-matplotlib')
   conflicts=('python2-matplotlib' 'python2-matplotlib2')

   cd matplotlib-py2
   python2 setup.py install -O1 --skip-build --root "${pkgdir}" --prefix=/usr

   install -dm755 "${pkgdir}"/usr/share/licenses/python2-matplotlib
   install -m 644 doc/users/license.rst "${pkgdir}"/usr/share/licenses/python2-matplotlib
}

package_python-matplotlib-git() {
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
