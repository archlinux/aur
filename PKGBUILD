# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Fabien Devaux <fdev31@gmail.com>
pkgname=insight3d
pkgver=0.3.2
pkgrel=3
epoch=
pkgdesc="insight3d lets you create 3D models from photographs"
arch=('i686' 'x86_64')
url="http://insight3d.sourceforge.net/"
license=('AGPL3')
groups=()
depends=(opencv libxml2 sdl gtk2 lapack blas glu libcl)
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(http://sourceforge.net/projects/${pkgname}/files/${pkgname}_linux.tar.gz/download)
noextract=()
md5sums=(31c7d629e5c6f37982cb3e8676cc7e38) #generate with 'makepkg -g'

build() {
  cd "$srcdir/$pkgname"
  echo "patching basename & opencv api"
  wget -qO- 'http://sourceforge.net/tracker/download.php?group_id=270681&atid=1151178&file_id=394433&aid=3118915' | patch -p0 || exit 1
  echo "patching assertions"
  wget -qO- 'http://sourceforge.net/tracker/download.php?group_id=270681&atid=1151178&file_id=396860&aid=3143453' | patch -p0 || exit 1
  echo "maxtrix dimensions"
  wget -qO- 'http://sourceforge.net/tracker/download.php?group_id=270681&atid=1151178&file_id=397250&aid=3148368' | patch -p1 || exit 1
  cd "$pkgname"
  sed -i 's/cvSaveImage( out_img_name, img/cvSaveImage( out_img_name, img, 0/' sift/src/siftfeat.c || exit 1
  patch -p0 <<EOF || exit 1
--- tool_triangulation.h-old  2012-12-02 13:56:10.766761922 +0100
+++ tool_triangulation.h  2012-12-02 13:55:42.366907258 +0100
@@ -31,6 +31,7 @@
 #include "actions.h"
 #include "mvg_triangulation.h"
 #include "ANN/ANN.h"
+#include <opencv2/legacy/legacy.hpp>
 #include <set>
 
 void tool_triangulation_create();
EOF
  find .. -name "*.o" -exec rm {} \; 
  make
}

package() {
  cd "$srcdir/$pkgname/$pkgname"
  mkdir -p $pkgdir/usr/bin/
  install -m 0755 $pkgname $pkgdir/usr/bin/
}

# vim:set ts=2 sw=2 et:
