# Maintainer:  jyantis <yantis@yantis.net>

pkgname=vowpal-wabbit-git
pkgver=r4438.10a5624
pkgrel=2
pkgdesc="Vowpal Wabbit is a machine learning system which pushes the frontier of ML with techniques such as online, hashing, allreduce, reductions, learning2search, active, and interactive learning. Includes extra utilities and Python 2 support."
arch=(i686 x86_64)
url='https://github.com/JohnLangford/vowpal_wabbit'
license=('custom')
depends=('boost' 'python2')
source=('git+https://github.com/JohnLangford/vowpal_wabbit.git')
sha256sums=('SKIP')
makedepends=('git')
provides=('vowpal_wabbit' 'vowpal-wabbit')
conflicts=('vowpal_wabbit' 'vowpal-wabbit')

pkgver(){
  cd vowpal_wabbit

  # They usually don't update the version number that often so lets not use it for now.
  # _version=$(grep -F "AC_INIT([vowpal_wabbit]" configure.ac \
  #   | awk 'BEGIN {FS = "["} {print $3}' \
  #   | sed -r 's/(\[|\])//g' \
  #   | sed -r 's/(\(|\))//g' \
  #   | sed -r 's/, //g')
  # printf "%s." "$_version"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd vowpal_wabbit

  # JohnLangford commented on Dec 8, 2014
  # To build the python library, you need to work off the master branch's
  # Makefile rather than the automake in the tagged version.
  make python

  # Now that we built python do the normal build
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd vowpal_wabbit

  # We don't need anything related to git in the package
  rm -rf .git*

  # Install Custom License
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install Documentation
  install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  # Patch any python files from python to python2
  for file in $(find . -name '*.py' -print); do
    sed -r -i 's_^#!.*/usr/bin/python(\s|$)_#!/usr/bin/python2_' $file
  done
 
  # Patch any python files to be able to be imported from pyvw
  for file in $(find . -name '*.py' -print); do
    sed -i 's/import pyvw/from pyvw import pyvw/' $file
  done

  # Setup Python by hand since no setup.py 
  pydir=`python2 -c "from distutils.sysconfig import get_python_lib; \
    print get_python_lib()"`
  mkdir -p "${pkgdir}/${pydir}"
  mkdir -p "${pkgdir}/${pydir}/pyvw"
  touch "${pkgdir}/${pydir}/pyvw/__init__.py"
  cp python/*.py "${pkgdir}/${pydir}/pyvw"
  cp utl/*.py "${pkgdir}/${pydir}/pyvw"
  cp utl/*.py "${pkgdir}/${pydir}/pyvw"
  cp python/*.so "${pkgdir}/${pydir}/pyvw"

  # Install all the utilities
  mkdir -p $pkgdir/usr/bin/
  install -D -m755 utl/logistic "$pkgdir/usr/bin/logistic"
  install -D -m755 utl/vw-convergence "$pkgdir/usr/bin/vw-convergence"
  install -D -m755 utl/vw-csv2bin "$pkgdir/usr/bin/vw-csv2bin"
  install -D -m755 utl/vw-hypersearch "$pkgdir/usr/bin/vw-hypersearch"
  install -D -m755 utl/vw-regr "$pkgdir/usr/bin/vw-regr"
  install -D -m755 utl/vw-top-errors "$pkgdir/usr/bin/vw-top-errors"
  install -D -m755 utl/vw-varinfo "$pkgdir/usr/bin/vw-varinfo"
  install -D -m755 utl/vw2csv "$pkgdir/usr/bin/vw2csv"

  make DESTDIR=${pkgdir} install
}

# vim:set ts=2 sw=2 et:
