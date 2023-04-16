# Maintainer: David McInnis <dave@dave3.xyz>
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
                'gnome-doc-utils'
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
  ./configure --prefix="/usr" --disable-update-mime-database --enable-python
  sed -i 's|$(MAKE) $(AM_MAKEFLAGS) install-data-hook||' data/Makefile
  sed -i 's/help devhelp/# help devhelp/g' Makefile*
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
