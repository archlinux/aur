# Maintainer: David Runge <dave@sleepmap.de>

pkgname=supercollider-git
_pkg="supercollider"
_latest_tag="3.8.0"
pkgver=3.8.0.r2149.gcca12ff02
pkgrel=1
pkgdesc="An environment and programming language for real time audio synthesis and algorithmic composition."
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://supercollider.github.io/"
license=('GPL3')
depends=('jack' 'fftw' 'cwiid' 'qt5-webkit')
makedepends=('avahi' 'boost' 'cmake' 'emacs' 'libsndfile' 'qt5-tools' 'ruby' 'vim')
optdepends=('emacs: emacs interface'
            'gedit: gedit interface')
conflicts=('supercollider')
provides=('supercollider')
source=("git+https://github.com/supercollider/supercollider.git"
        "git+https://github.com/timblechmann/nova-simd.git"
        "git+https://github.com/timblechmann/nova-tt.git"
        "git+https://github.com/supercollider/hidapi.git"
        "git+https://github.com/supercollider/scvim.git"
        "git+https://github.com/supercollider/portaudio.git"
        "git+https://github.com/supercollider/yaml-cpp.git")
sha512sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd "${_pkg}"
#  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/Version.//g'
  git describe HEAD | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/Version.3.7.2/'"$_latest_tag"'/g'
}

prepare() {
  cd "${_pkg}"
  git submodule init
  git config submodule.external_libraries/nova-simd.url "${srcdir}/nova-simd"
  git config submodule.external_libraries/nova-tt.url "${srcdir}/nova-tt"
  git config submodule.external_libraries/hidapi.url "${srcdir}/hidapi"
  git config submodule.editors/scvim.url "${srcdir}/scvim"
  git config submodule.external_libraries/portaudio_sc_org.url "${srcdir}/portaudio"
  git config submodule.external_libraries/portaudio_sc_org.branch "${_pkg}"
  git config submodule.external_libraries/yaml-cpp.url "${srcdir}/yaml-cpp"
  git submodule update
}

build() {
  cd ${srcdir}/${_pkg}
#  git submodule update --init --recursive .
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
      make
    ;;
    "armv7l")
      export CC="gcc"
      export CXX="g++"
      cmake .. -L \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_TESTING=OFF \
        -DSSE=OFF \
        -DSSE2=OFF \
        -DSUPERNOVA=OFF\
        -DNOVA_SIMD=ON \
        -DNATIVE=OFF \
        -DSC_QT=OFF \
        -DSC_WII=OFF \
        -DSC_ED=OFF \
        -DSC_IDE=OFF \
        -DSC_EL=ON \
        -DCMAKE_C_FLAGS="-march=armv7-a -mtune=cortex-a8 -mfloat-abi=hard -mfpu=neon" \
        -DCMAKE_CXX_FLAGS="-march=armv7-a -mtune=cortex-a8 -mfloat-abi=hard -mfpu=neon"
      make
    ;;
    *)
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr \
      -DSC_VIM=OFF \
      -DCMAKE_BUILD_TYPE=Release
    make
    ;;
  esac
}

package() {
  cd "${srcdir}/${_pkg}/bld"
  make DESTDIR="${pkgdir}/" install
}

