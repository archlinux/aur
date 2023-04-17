# Maintainer: David McInnis <dave@dave3.xyz>.
# Disabled help/devhelp: Manuel Schneckenreither <manuel.schnecki Google Mail>
# Contributor: Andreas Wagner <Andreas dot Wagner at em dot uni-frankfurt dot de>

pkgname=referencer
pkgver=1.2.2
pkgrel=8
pkgdesc="a Gnome application to organise documents or references, and ultimately generate a BibTeX bibliography file"
arch=('i686' 'x86_64')
url="https://launchpad.net/referencer/"
license=('GPL2')
makedepends=(
                'intltool'
                # 'gnome-doc-utils'
                'gnome-icon-theme'
                'boost' )
depends=(       'libgnome'
                'libgnomeui'
                'libgnome-data'
                'libgnomemm'
                'libgnomeuimm'
                'libbonobo'
                'libbonoboui'
                'orbit2'
                'boost-libs'
                'poppler-glib'
                'python2'
                'yelp' )
source=(https://launchpad.net/$pkgname/1./$pkgver/+download/$pkgname-$pkgver.tar.gz
        referencer-lib_path.patch)

prepare()
{
  cd "$pkgname-$pkgver"

  patch -Np1 -i "${srcdir}/referencer-lib_path.patch"
}

build()
{
  export PYTHON=/usr/bin/python2
  cd "$pkgname-$pkgver"
#  autoreconf
  CXXFLAGS="$CXXFLAGS -std=gnu++11"

  # Disable check for gnome-doc-utils
  sed -i 's/gdu_cv_have_gdu=no/gdu_cv_have_gdu=yes/g' configure

  # Set Automake Version
  AMVERSION=`aclocal --version | head -n1 | sed 's/^[^1]*//g' | sed 's/\.[^\.]*$//g'`
  echo $AMVERSION
  sed -i "s/am__api_version='1.13'/am__api_version='$AMVERSION'/g" configure

  rm -rf devhelp/*
  rm -rf help/Makefile.in
  rm -rf gnome-doc-utils.make

  # Create empty targets for help & devhelp and empty gnome-doc-utils.make
  printf "clean:\n\nall:\n\ninstall:\n\n" > devhelp/Makefile.in
  printf "clean:\n\nall:\n\ninstall:\n\n" > help/Makefile.in
  touch gnome-doc-utils.make

  ./configure --prefix="/usr" --disable-update-mime-database --enable-python
  sed -i 's|$(MAKE) $(AM_MAKEFLAGS) install-data-hook||' data/Makefile
  make clean
  make
  echo "Patching *.py files to use python2..."
  for i in ads.py dblp.py expj.py genkey.py isi-plugin.py lyx.py pubmed.py ; do
    sed -i 's|#!/usr/bin/env python|#!/usr/bin/env python2|' plugins/$i
  done
}

package()
{
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

md5sums=('d7021937a3d481edc3d8d540eec950cd'
         '50b0d7fc0539fd8fb25d837b309e6928')
