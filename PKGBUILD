# Maintainer: David Runge <dave@sleepmap.de>

pkgname=supercollider-git
_name="supercollider"
pkgver=3.9.3.r783.g88621c5f91
pkgrel=1
pkgdesc="Environment and programming language for real time audio synthesis and algorithmic composition"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://supercollider.github.io/"
license=('GPL3')
depends=('boost-libs' 'fftw' 'jack' 'qt5-webengine' 'qt5-svg' 'yaml-cpp')
makedepends=('boost' 'cmake' 'emacs' 'git' 'qt5-tools')
optdepends=('emacs: emacs interface'
            'gedit: gedit interface'
            'sc3-plugins: additional extension plugins for scsynth')
conflicts=('supercollider')
provides=('supercollider')
source=("git+https://github.com/${_name}/${_name}.git"
        "git+https://github.com/timblechmann/nova-simd.git"
        "git+https://github.com/timblechmann/nova-tt.git"
        "git+https://github.com/${_name}/hidapi.git"
        "git+https://github.com/${_name}/portaudio.git"
        "git+https://github.com/${_name}/yaml-cpp.git"
        'boost-1.67.patch')
sha512sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '9980d77802f18fd56d2a13f24f070e81768d9111b2cc63e479a0e9b405a04aec28bc523e5d36aab0462af6a3831d64598470cdc6c3266431e2ca64aa427a6bf2')

pkgver() {
  cd "${_name}"
  git describe --long --tags | sed 's/Version-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${_name}"
  git submodule init
  git config submodule.external_libraries/nova-simd.url "${srcdir}/nova-simd"
  git config submodule.external_libraries/nova-tt.url "${srcdir}/nova-tt"
  git config submodule.external_libraries/hidapi.url "${srcdir}/hidapi"
  git config submodule.external_libraries/portaudio_sc_org.url "${srcdir}/portaudio"
  git config submodule.external_libraries/portaudio_sc_org.branch "${_name}"
  git config submodule.external_libraries/yaml-cpp.url "${srcdir}/yaml-cpp"
  git submodule update
  patch -Np1 -i ../boost-1.67.patch
  mkdir -p build
}

build() {
  cd "${_name}/build"
  _carch=$(uname -m)
#  Qt5LinguistTools_DIR="/usr/lib/cmake/Qt5LinguistTools"
#  export LDFLAGS="${LDFLAGS//-Wl,--as-needed}"
  echo "$_carch architecture detected."
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
    ;;
    *)
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr \
             -DLIBSCSYNTH=ON \
             -DFORTIFY=ON \
             -DSC_VIM=OFF \
             -DSYSTEM_BOOST=ON \
             -DSYSTEM_YAMLCPP=ON \
             -DCMAKE_BUILD_TYPE=Release
    ;;
  esac
  make
}

package() {
  cd "${_name}/build"
  make DESTDIR="${pkgdir}/" install
  install -t "${pkgdir}/usr/share/doc/${pkgname}/" \
    -vDm 644 ../{AUTHORS,{CHANGELOG,README,README_LINUX}.md}
}

