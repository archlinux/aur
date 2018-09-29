# Maintainer: David Runge <dave@sleepmap.de>

pkgname=supercollider-git
_name="supercollider"
pkgver=3.10.0.beta2.r175.gf5efaffea1
pkgrel=1
pkgdesc="Environment and programming language for real time audio synthesis and algorithmic composition"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://supercollider.github.io/"
license=('GPL3')
depends=('boost-libs' 'desktop-file-utils' 'fftw' 'jack' 'qt5-svg' 'qt5-webengine' 'qt5-websockets' 'yaml-cpp')
makedepends=('boost' 'cmake' 'emacs' 'git' 'qt5-tools')
optdepends=('emacs: emacs interface'
            'gedit: gedit interface'
            'sc3-plugins: additional extension plugins for scsynth')
conflicts=('supercollider')
provides=('supercollider')
source=("git+https://github.com/${_name}/${_name}.git#branch=develop"
        "git+https://github.com/timblechmann/nova-simd.git"
        "git+https://github.com/timblechmann/nova-tt.git"
        "git+https://github.com/${_name}/hidapi.git"
        "git+https://github.com/${_name}/portaudio.git"
        "git+https://github.com/${_name}/yaml-cpp.git"
        'boost-1.67.patch::https://github.com/dvzrv/supercollider/commit/bbcd068659ced596402dedc78f49fabfab6470bd.patch')
sha512sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '1bb70a544425d9c3a4e650315fea4a0a388214f1e5b1f300c1bd6706d2fab9e4fe103020c279b8b954386d45fcb5bfd64e730dbf158d4e317517fce3bb393a7c')

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
  # fix supernova linking with boost >= 1.67.0
  # https://github.com/supercollider/supercollider/issues/3981
  patch -Np1 -i ../boost-1.67.patch
  # make sure system boost is used:
  # https://github.com/supercollider/supercollider/issues/4096
  rm -r external_libraries/boost
  mkdir -p build
}

build() {
  cd "${_name}/build"
  _carch=$(uname -m)
  echo "$_carch architecture detected."
  case "$_carch" in
    "armv6l")
      export CC="gcc"
      export CXX="g++"
      cmake -DCMAKE_INSTALL_PREFIX=/usr \
            -DCMAKE_BUILD_TYPE=Release \
            -DLIBSCSYNTH=ON \
            -DFORTIFY=ON \
            -DSC_VIM=OFF \
            -DSYSTEM_BOOST=ON \
            -DSYSTEM_YAMLCPP=ON \
            -DSSE=OFF \
            -DSSE2=OFF \
            -DSUPERNOVA=OFF \
            -DNATIVE=OFF \
            -DSC_QT=OFF \
            -DSC_ED=OFF \
            -DSC_IDE=OFF \
            -DCMAKE_C_FLAGS='-march=armv6 -mfpu=vfp -mfloat-abi=hard' \
            -DCMAKE_CXX_FLAGS='-march=armv6 -mfpu=vfp -mfloat-abi=hard' \
             ..
    ;;
    "armv7l")
      export CC="gcc"
      export CXX="g++"
      cmake -DCMAKE_INSTALL_PREFIX=/usr \
            -DCMAKE_BUILD_TYPE=Release \
            -DLIBSCSYNTH=ON \
            -DFORTIFY=ON \
            -DSC_VIM=OFF \
            -DSYSTEM_BOOST=ON \
            -DSYSTEM_YAMLCPP=ON \
            -DSSE=OFF \
            -DSSE2=OFF \
            -DSUPERNOVA=OFF \
            -DNATIVE=OFF \
            -DSC_QT=OFF \
            -DSC_ED=OFF \
            -DSC_IDE=OFF \
            -DCMAKE_C_FLAGS='-march=armv7-a -mtune=cortex-a8 -mfloat-abi=hard -mfpu=neon' \
            -DCMAKE_CXX_FLAGS='-march=armv7-a -mtune=cortex-a8 -mfloat-abi=hard -mfpu=neon' \
            ..
    ;;
    *)
    cmake -DCMAKE_INSTALL_PREFIX=/usr \
          -DCMAKE_BUILD_TYPE=Release \
          -DLIBSCSYNTH=ON \
          -DFORTIFY=ON \
          -DSC_VIM=OFF \
          -DSYSTEM_BOOST=ON \
          -DSYSTEM_YAMLCPP=ON \
          ..
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

