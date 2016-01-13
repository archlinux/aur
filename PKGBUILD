# Sketch synthesizer is developed by the Computer Assisted Programming Group at MIT.
# See http://people.csail.mit.edu/asolar/
# Maintainer: <kaptoxic at yahoo dot com>
# Contributor: <kaptoxic at yahoo dot com>

pkgname="sketchsynth"
pkgver=1.6.9
pkgrel=1
pkgdesc="A software synthesis tool for developing implementations from sketches"
url="https://bitbucket.org/gatoatigrado/sketch-frontend/wiki/Home"
arch=('i686' 'x86_64')
license=('MIT' 'BSD')
depends=('bash' 'java-runtime')
makedepends=()
source=("http://people.csail.mit.edu/asolar/sketch-${pkgver}.tar.gz" "sketchsynth")
md5sums=('f845406a0468975f7695f5993d3d658b'
         '5fb1be29901fd3651ead93f919e64564')

build() {  
  cd "sketch-$pkgver"/sketch-backend
  
  ./configure --prefix= #--prefix="${srcdir}"
  make #DESTDIR="${srcdir}"
}

package() {
  mkdir -p ${pkgdir}/usr/share/sketchsynth
  mkdir -p ${pkgdir}/usr/share/sketchsynth/bin
  mkdir -p ${pkgdir}/usr/share/sketchsynth/lib
  #mkdir -p ${pkgdir}/usr/share/sketchsynth/sketch-backend/src/SketchSolver/.libs
  #mkdir -p ${pkgdir}/usr/share/sketchsynth/sketch-frontend

  mkdir -p ${pkgdir}/usr/bin
  
  cd ${srcdir}/"sketch-$pkgver"/sketch-backend
  make DESTDIR="$pkgdir/usr/share/sketchsynth/" install

  cd ${srcdir}/"sketch-$pkgver"
  #frontend
  install -m 755 -D ./sketch-frontend/sketch ${pkgdir}/usr/share/sketchsynth/bin/
  install -m 644 -D ./sketch-frontend/sketch-${pkgver}-noarch.jar ${pkgdir}/usr/share/sketchsynth/bin/
  cp -r ./sketch-frontend/runtime ${pkgdir}/usr/share/sketchsynth/
  cp -r ./sketch-frontend/sketchlib ${pkgdir}/usr/share/sketchsynth/

  #backend
  #install -m 755 -D ./sketch-backend/src/SketchSolver/cegis ${pkgdir}/usr/share/sketchsynth/sketch-backend/src/SketchSolver/
  #install -m 644 -D ./sketch-backend/src/SketchSolver/.libs/{libcegis.a,libcegis.la,libcegis.so,libcegis.so.0,libcegis.so.0.0.0} ${pkgdir}/usr/share/sketchsynth/sketch-backend/src/SketchSolver/.libs
  
  # (avoided through custom launcher) defines SKETCH_HOME for codegens
  #mkdir -p ${pkgdir}/etc/profile.d
  #install -m 755 -D ../sketchsynth.sh ${pkgdir}/etc/profile.d
  
  install -m 755 -D ../sketchsynth ${pkgdir}/usr/bin/
}
