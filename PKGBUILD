# Maintainer: David Runge <dave@sleepmap.de>

pkgname=supercollider-git
_name="supercollider"
pkgver=3.7.0.alpha1.r182.ge271d31
pkgrel=1
pkgdesc="An environment and programming language for real time audio synthesis and algorithmic composition."
url="http://supercollider.sourceforge.net/"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
license=('GPL3')
depends=('jack' 'fftw' 'cwiid' 'qtwebkit' 'libsndfile')
makedepends=('cmake' 'libsndfile' 'ruby' 'vim' 'emacs' 'boost' 'avahi' 'qt5-base' 'qt5-tools' 'qt5-webkit' 'qt5-location' 'qt5-sensors')
optdepends=('emacs: emacs interface'
            'gedit: gedit interface'
            'vim: vim interface'
            'ruby: vim support'
            'tmux: vim interface'
            'screen: vim interface')
conflicts=('supercollider')
provides=('supercollider')
source=("${_name}::git+https://github.com/supercollider/supercollider")
md5sums=('SKIP')
install="$_name.install"

pkgver() {
  cd "$_name"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/Version.//g'
}

build() {
  cd $srcdir/$_name
  git submodule update --init --recursive .
  _carch=$(uname -m)
  Qt5LinguistTools_DIR="/usr/lib/cmake/Qt5LinguistTools"
  [ -d bld ] || mkdir bld && cd bld
  export LDFLAGS="${LDFLAGS//-Wl,--as-needed}"
  msg "$_carch architecture detected."
  case "$_carch" in
    "armv6l")
      export CC="gcc"
      export CXX="g++"
      cmake .. -L \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_TESTING=OFF \
        -DSSE=OFF \
        -DSSE2=OFF \
        -DSUPERNOVA=OFF \
        -DNOVA_SIMD=ON \
        -DNATIVE=OFF \
        -DSC_QT=OFF \
        -DSC_WII=OFF \
        -DSC_ED=OFF \
        -DSC_IDE=OFF \
        -DSC_EL=ON \
        -DCMAKE_C_FLAGS="-march=armv6 -mfpu=vfp -mfloat-abi=hard" \
        -DCMAKE_CXX_FLAGS="-march=armv6 -mfpu=vfp -mfloat-abi=hard"
      make -j4 | tee build-output.txt
    ;;
    "armv7l")
      export CC="gcc"
      export CXX="g++"
      cmake .. -L \
        -DCMAKE_INSTALL_PREFIX=/usr\
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_TESTING=OFF\
        -DSSE=OFF\
        -DSSE2=OFF\
        -DSUPERNOVA=OFF\
        -DNOVA_SIMD=ON \
        -DNATIVE=OFF\
        -DSC_QT=OFF\
        -DSC_WII=OFF\
        -DSC_ED=OFF\
        -DSC_IDE=OFF\
        -DSC_EL=ON \
        -DCMAKE_C_FLAGS="-march=armv7-a -mtune=cortex-a8 -mfloat-abi=hard -mfpu=neon" \
        -DCMAKE_CXX_FLAGS="-march=armv7-a -mtune=cortex-a8 -mfloat-abi=hard -mfpu=neon"
      make -j4 | tee build-output.txt
    ;;
    *)
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr \
      -DSUPERNOVA=0 \
      -DCMAKE_BUILD_TYPE=Release
    make | tee build-output.txt
    ;;
  esac
}

package() {
  cd "$srcdir/$_name/bld"
  make DESTDIR="$pkgdir/" install
}

