# Sketch synthesizer is developed by the Computer Assisted Programming Group at MIT.
# See http://people.csail.mit.edu/asolar/
# Maintainer: <kaptoxic at yahoo dot com>
# Contributor: <kaptoxic at yahoo dot com>

pkgname="sketchsynth"
pkgver=1.7.6
pkgrel=1
pkgdesc="A software synthesis tool for developing implementations from sketches"
url="https://people.csail.mit.edu/asolar/"
arch=('i686' 'x86_64')
license=('MIT' 'BSD')
depends=('bash' 'java-runtime')
makedepends=()
source=("http://people.csail.mit.edu/asolar/sketch-${pkgver}.tar.gz" "sketchsynth")
sha256sums=('5cdac9ce841fd532215ff9ad8cb61a38cbdf6de0a635a669d0e46cdae72da707'
            '2c3ca4dce000b4960d84fef26f6701a98707a085cf04b18e4d33d1e9989ca6d5')

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
