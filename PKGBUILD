# Maintainer: Michael Schubert <mschu.dev at gmail>

pkgname=mgltools
pkgver=1.5.6
pkgrel=1
pkgdesc="Visualization and analysis of molecular structures; includes AutoDockTools, Vision and PythonMoleculeViewer"
arch=('i686' 'x86_64')
url="http://mgltools.scripps.edu/"
license=('custom')
depends=('swig' 'tk' 'python2-numpy' 'python2-imaging' 'python2-pmw' 'glut' 'zsi' 'python2-simpy' 'libxmu')
optdepends=('autodocksuite')
source=("http://mgltools.scripps.edu/downloads/tars/releases/REL${pkgver}/${pkgname}_source_${pkgver}.tar.gz"
        opengltk.patch)
options=('!emptydirs')
md5sums=('e37ceac50fd46bd89abb2ba44a812a65'
         '357fe047c8edcd89d9cf1b8f7f70d258')

build() {
  cd "$srcdir/${pkgname}_source_$pkgver"
  sed -i "1s:python2.5:python2:" InstTools/install

  # replace path by os.path where needed
  sed -i "s:path.exists:os.path.exists:; \
    s:os.os.path.exists:os.path.exists:; \
    s:path.join:os.path.join:; \
    s:os.os.path.join:os.path.join:" InstTools/install

  # do not install pmw since it is dependecy already
  sed -i 's:getYesNo(msg, "Do you wish to install Pmw:False #:' InstTools/install
  # fix include for strcmp in geomutils
  sed -i "239i\    if (pkgname == \"geomutils\"): os.popen(\"sed -i '3i#include\
    <string.h>' src/geomAlgorithms/objfile.cpp\")" InstTools/install
  # fix opengltk to work with tcl/tk 8.5
  sed -i "240i\    if (pkgname == \"opengltk\"): \
    os.popen(\"sed -i 's/stub8.4/stub8.5/g' setup.py\")" InstTools/install
  
  # disable license popup - we'll print it to the user later
  cd "$srcdir/${pkgname}_source_$pkgver/MGLPACKS"
  tar -xzf mglutil-$pkgver.tar.gz
  rm -f mglutil-$pkgver.tar.gz
  echo > mglutil-$pkgver/mglutil/splashregister/license.py
  tar -czf mglutil-$pkgver.tar.gz mglutil-$pkgver

  # fix opengltk error
  cd "$srcdir/${pkgname}_source_$pkgver/MGLPACKS"
  tar -xzf opengltk-$pkgver.tar.gz
  rm -f opengltk-$pkgver.tar.gz
  patch -p0 < "$srcdir"/opengltk.patch
  tar -czf opengltk-$pkgver.tar.gz opengltk-$pkgver
}

package() {
  cd "$srcdir/${pkgname}_source_$pkgver"

  # let python know about the new modules
  pydir=`python2 -c "from distutils.sysconfig import get_python_lib; \
    print get_python_lib()"`
  mkdir -p "$pkgdir/$pydir"
  ./startInstallation --quiet --instDir="$pkgdir/$pydir"

  # link to bin directory
  install -Dm755 "$pkgdir/$pydir/runAdt" "$pkgdir/usr/bin/adt"
  install -Dm755 "$pkgdir/$pydir/runPmv" "$pkgdir/usr/bin/pmv"
  install -Dm755 "$pkgdir/$pydir/runCADD" "$pkgdir/usr/bin/CADD"
  install -Dm755 "$pkgdir/$pydir/runVision" "$pkgdir/usr/bin/vision"

  echo "MGLToolsPckgs" > "$pkgdir/$pydir/mgltools.pth"

  # fix some python 2.7 issues in the package
  sed -i "/self.__debug__ = 0/d" \
    "$pkgdir/$pydir/MGLToolsPckgs/ViewerFramework/VF.py"

  # remove VCS entries
  rm -rf `find "$pkgdir" -type d -name "CVS"`

  # some other fixes..
  cd "$pkgdir/$pydir/MGLToolsPckgs"
  rm -f "mglutil/TestUtil/publishPack.csh"

  # change interpreter from python/2.5 to python2
  find . -name "*.py" | xargs sed -i "1s/python$/python2/;1s/python2.5$/python2/"

  # install licenses
  for LICENSE in `find . -name LICENSE`; do
    install -Dm755 "./$LICENSE" "$pkgdir/usr/share/licenses/mgltools/$LICENSE"
    rm "$LICENSE"
  done
  mv *.egg-info "$pkgdir/usr/share/licenses/mgltools/"

  msg "LICENSE WARNING:"
  msg "This software is free only for non-commercial usage"
  msg "see /usr/share/licenses/mgltools/ for more information"
}

